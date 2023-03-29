//

import Foundation
import SwiftlanePaths

/// Provides API to execute shell commands and run other processes.
// sourcery: AutoMockable
public protocol ShellExecuting {
	func run(
		command: String,
		options: ShellCommandOptions,
		file: String,
		line: UInt
	) throws -> ShellOutput
}

public extension ShellExecuting {
	@discardableResult
	func run(
		_ command: String,
		log logType: ShellCommandLogType,
		logPrefix: String? = nil,
		logStdErrToFile: AbsolutePath? = nil,
		maskSubstringsInLog: [String] = [],
		executionTimeout: TimeInterval? = nil,
		shouldIgnoreNonZeroExitCode: @escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool = { _, _ in false },
		silentStdErrMessages: Bool = false,
		file: String = #file,
		line: UInt = #line
	) throws -> ShellOutput {
		return try run(
			command: command,
			options: ShellCommandOptions(
				logType: logType,
				logPrefix: logPrefix,
				logStdErrToFile: logStdErrToFile,
				maskedStrings: maskSubstringsInLog,
				executionTimeout: executionTimeout,
				shouldIgnoreNonZeroExitCode: shouldIgnoreNonZeroExitCode,
				silentStdErrMessages: silentStdErrMessages
			),
			file: file,
			line: line
		)
	}

	@discardableResult
	func run(
		_ commandArray: [String],
		log logType: ShellCommandLogType,
		logPrefix: String? = nil,
		logStdErrToFile: AbsolutePath? = nil,
		maskSubstringsInLog: [String] = [],
		executionTimeout: TimeInterval? = nil,
		shouldIgnoreNonZeroExitCode: @escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool = { _, _ in false },
		silentStdErrMessages: Bool = false,
		file: String = #file,
		line: UInt = #line
	) throws -> ShellOutput {
		return try run(
			command: commandArray.joined(separator: " "),
			options: ShellCommandOptions(
				logType: logType,
				logPrefix: logPrefix,
				logStdErrToFile: logStdErrToFile,
				maskedStrings: maskSubstringsInLog,
				executionTimeout: executionTimeout,
				shouldIgnoreNonZeroExitCode: shouldIgnoreNonZeroExitCode,
				silentStdErrMessages: silentStdErrMessages
			),
			file: file,
			line: line
		)
	}
}
