//

import Foundation
import PerfectRainbow
import SwiftlaneExtensions

/// Facade which wraps multiple loggers into one object conforming the `Logging` protocol.
public class CompositeLogger {
	private let loggers: [Logging]
	
	public init(loggers: [Logging]) {
		self.loggers = loggers
		if loggers.isEmpty {
			print("CompositeLogger initialized with empty loggers array.".red)
			fatalError()
		}
	}
}

extension CompositeLogger: Logging {
	public var logLevel: LoggingLevel {
		loggers.map { $0.logLevel }.max()!
	}
	
	public func uncheckedLog(
		_ level: LoggingLevel,
		_ msg: String,
		_ color: NamedColor?,
		terminator: String,
		file: String,
		line: UInt
	) {
		loggers.forEach {
			/// Calling `log` instead of `uncheckedLog` because we want specific `shouldLog` checks
			/// to be taken into account for each logger's implementation.
			$0.log(level, msg, color, terminator: terminator, file: file, line: line)
		}
	}
	
	public func logShellCommand(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		loggers.forEach {
			$0.logShellCommand(msg, file: file, line: line)
		}
	}

	public func logError(
		_ error: Error,
		file: String = #file,
		line: UInt = #line
	) {
		loggers.forEach {
			$0.logError(error, file: file, line: line)
		}
	}

	public func success(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		loggers.forEach {
			$0.success(msg, file: file, line: line)
		}
	}
}
