//

import Foundation
import PerfectRainbow
import SwiftlaneCoreServices
import SwiftlaneLogging
import SwiftlanePaths

extension ShellExecutor: ShellExecuting {
	public func run(
		command: String,
		options: ShellCommandOptions,
		file: String = #file,
		line: UInt = #line
	) throws -> ShellOutput {
		try _run(command: command, options: options, file: file, line: line)
	}
}

public struct ShellExecutor {
	let sigIntHandler: SigIntHandling
	let logger: Logging
	let xcodeChecker: XcodeChecking
	let filesManager: FSManaging

	public init(
		sigIntHandler: SigIntHandling,
		logger: Logging,
		xcodeChecker: XcodeChecking,
		filesManager: FSManaging
	) {
		self.sigIntHandler = sigIntHandler
		self.logger = logger
		self.xcodeChecker = xcodeChecker
		self.filesManager = filesManager
	}
	
	private func mask(substrings: [String], in string: String) -> String {
		substrings.reduce(string) {
			$0.replacingOccurrences(of: $1, with: "[MASKED]")
		}
	}

	/// Executes shell command.
	///
	/// ```
	/// # Example usage:
	/// shell("ls -la")
	/// ```
	private func _run(
		command: String,
		options: ShellCommandOptions,
		file: String = #file,
		line: UInt = #line
	) throws -> ShellOutput {
		let maskedCommand = mask(substrings: options.maskedStrings, in: command)
		
		let task = Process()
		let stdoutPipe = Pipe()
		let stderrPipe = Pipe()
		task.standardOutput = stdoutPipe
		task.standardError = stderrPipe
		task.launchPath = "/bin/zsh"
		task.arguments = ["-c", "set -eu && " + command]

		if options.logType.shouldLogCommand {
			logger.logShellCommand(maskedCommand, file: file, line: line)
		}

		/// stdout and stderr data buffers.
		/// * These buffers prevent tearing lines apart when reprinting stdout/stderr in runtime.
		/// * All data should be converted into string as a whole AFTER the process is finished.
		let stdoutData = PipeDataBuffer()
		let stderrData = PipeDataBuffer()
		
		/// if `options.logType.shouldLogOutput` stdout and stderr are logged in line-buffered way.
		let printedDataSeparator = UInt8(UnicodeScalar("\n").value)
		
		/// Returns `options.logPrefix + String(data)`
		func loggedString(from data: Data) -> String {
			let dataString = String(decoding: data, as: UTF8.self)
			guard let prefix = options.logPrefix else {
				return dataString
			}
			return prefix + dataString
		}
		
		/// Prepare logging things
		
		/// Get log levels from logger from the current thread.
		/// As we don't want get into data race in case ``Logging.logLevel`` changes while we are doing the job.
		let stderrLogLevel: LoggingLevel = options.silentStdErrMessages ? .verbose : .warning
		let shouldLiveLogOutput = logger.shouldLog(level: options.logType.outputLogLevel)
		let shouldLiveLogStdErr = logger.shouldLog(level: stderrLogLevel)
		
		let loggingQueue = DispatchQueue(label: "ShellExecutorLogging for \(maskedCommand.split(separator: " ")[0])")
		func threadSafeLog(
			level: LoggingLevel,
			message: String,
			color: NamedColor,
			terminator: String,
			file: String = #file,
			line: UInt = #line
		) {
			loggingQueue.async {
				/// Calling ``uncheckedLog`` here because we want to bypass ``shouldLog`` call.
				logger.uncheckedLog(
					level,
					message,
					color,
					terminator: terminator,
					file: file,
					line: line
				)
			}
		}
		
		// Define stdout and stderr handlers
		
		let pipesEOFDispatchGroup = DispatchGroup()
		
		pipesEOFDispatchGroup.enter()
		stdoutPipe.fileHandleForReading.readabilityHandler = { (handle: FileHandle) in
			let data = handle.availableData
			
			guard !data.isEmpty else {
				// End of stdout stream.
				if shouldLiveLogOutput,
				   let unprintedData = stdoutData.dataToTheEnd() {
					threadSafeLog(
						level: options.logType.outputLogLevel,
						message: loggedString(from: unprintedData),
						color: .default,
						terminator: "\n"
					)
				}
				
				/// From docs:
				/// > To stop reading the file or socket, set the value of this property to nil.
				/// > Doing so cancels the dispatch source and cleans up the file handle’s structures appropriately.
				handle.readabilityHandler = nil
				pipesEOFDispatchGroup.leave()
				return
			}
			
			stdoutData.append(data: data)
			
			// Real time logging.
			if shouldLiveLogOutput,
			   let dataToPrint = stdoutData.data(upToLast: printedDataSeparator) {
				threadSafeLog(
					level: options.logType.outputLogLevel,
					message: loggedString(from: dataToPrint),
					color: .default,
					terminator: ""
				)
			}
		}

		pipesEOFDispatchGroup.enter()
		stderrPipe.fileHandleForReading.readabilityHandler = { (handle: FileHandle) in
			let data = handle.availableData
			
			guard !data.isEmpty else {
				// End of stderr stream.
				if shouldLiveLogStdErr,
				   let unprintedData = stderrData.dataToTheEnd() {
					threadSafeLog(
						level: stderrLogLevel,
						message: "[stderr]:\n" + loggedString(from: unprintedData),
						color: .yellow,
						terminator: "\n"
					)
				}
			
				/// From docs:
				/// > To stop reading the file or socket, set the value of this property to nil.
				/// > Doing so cancels the dispatch source and cleans up the file handle’s structures appropriately.
				handle.readabilityHandler = nil
				pipesEOFDispatchGroup.leave()
				return
			}
			
			stderrData.append(data: data)
			
			// Real time logging.
			if shouldLiveLogStdErr,
			   let dataToPrint = stderrData.data(upToLast: printedDataSeparator) {
				threadSafeLog(
					level: stderrLogLevel,
					message: loggedString(from: dataToPrint),
					color: .yellow,
					terminator: ""
				)
			}
		}
		
		// Process termination semaphore
		
		let terminationSemaphore = DispatchSemaphore(value: 0)
		task.terminationHandler = { _ in
			terminationSemaphore.signal()
		}

		// ===== Launch task ===== //
		
		sigIntHandler.addSubprocess(task)
		task.launch()
		
		/// Decodes string from data ignoring decoding errors, returns nil only if data is empty.
		func string(from data: Data) -> String? {
			guard !data.isEmpty else {
				return nil
			}
			return String(decoding: data, as: UTF8.self)
		}
		
		/// Will be equal to ``options.executionTimeout`` if execution will time out.
		let executionTimedOut: TimeInterval?
		
		// Wait for termination
		if let executionTimeout = options.executionTimeout {
			// With timeout
			let timeoutResult = terminationSemaphore.wait(timeout: .now() + executionTimeout)
			switch timeoutResult {
			case .success:
				executionTimedOut = nil
			case .timedOut:
				task.terminate()
				executionTimedOut = executionTimeout
			}
		} else {
			// Without timeout
			terminationSemaphore.wait()
			executionTimedOut = nil
		}
		
		/// # Wait for EOF in pipes.
		/// Wait a few seconds after process' termination for EOFs in pipes.
		/// Prevent closing pipes before all data is read from them because `readabilityHandler`s are called asynchronously.
		/// In normal scenario EOF appears in a matter of milliseconds. So 10 seconds is too safe actually.
		let closingPipesAfterTerminationTimeout: TimeInterval = 10
		let closingPipesTimeoutResult = pipesEOFDispatchGroup.wait(timeout: .now() + closingPipesAfterTerminationTimeout)
		
		/// Decode strings from data (nil if data is empty)
		/// * All data should be converted into string as a whole AFTER the process is finished.
		let stdoutText = string(from: stdoutData.data)
		let stderrText = string(from: stderrData.data)
		
		/// # Close pipes
		try stdoutPipe.fileHandleForReading.close()
		try stderrPipe.fileHandleForReading.close()
		
		/// Write stderr data to file if needed.
		if let stderrLogFile = options.logStdErrToFile {
			do {
				try filesManager.write(stderrLogFile, text: stderrText ?? "")
			} catch {
				logger.error("Error writing stderr log file to \(stderrLogFile.string.quoted).")
				logger.logError(error)
			}
		}
		
		/// Throw ``executionTimedOut`` error if needed.
		if let executionTimeout = executionTimedOut {
			throw ShError.executionTimedOut(
				command: maskedCommand,
				output: ShellOutput(
					stdoutText: string(from: stdoutData.data),
					stderrText: string(from: stderrData.data)
				),
				timeout: executionTimeout
			)
		}
		
		switch closingPipesTimeoutResult {
		case .success:
			break
		case .timedOut:
			throw ShError.closingPipesTimedOut(
				command: maskedCommand,
				output: ShellOutput(stdoutText: stdoutText, stderrText: stderrText),
				timeout: closingPipesAfterTerminationTimeout
			)
		}
		
		let output = ShellOutput(stdoutText: stdoutText, stderrText: stderrText)
		
		/// ``terminationStatus`` raises an NSInvalidArgumentException if the receiver is still running
		let exitCode = task.isRunning ? -111 : task.terminationStatus

		if exitCode != 0, !options.shouldIgnoreNonZeroExitCode(output, exitCode) {
			logger.log(.debug, "Command '\(maskedCommand)' finished with exit code: \(exitCode).", .red, file: file, line: line)
			throw ShError.nonZeroExitCode(
				command: maskedCommand,
				output: ShellOutput(stdoutText: stdoutText, stderrText: stderrText),
				exitCode: exitCode
			)
		} else {
			if let stderrText = stderrText {
				logger.debug("stderr text is not empty: \(stderrText)")
			}
		}

		return output
	}
}
