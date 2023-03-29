//

import Foundation

/// Default implementation of functions to log messages of different loggin levels.
public extension Logging {
	/// Log a error-level message.
	func error(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		log(.error, msg, .lightRed, file: file, line: line)
	}

	/// Log a warning-level message.
	func warn(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		log(.warning, msg, .lightYellow, file: file, line: line)
	}
	
	/// Log a important-level message.
	func important(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		log(.important, msg, .lightCyan, file: file, line: line)
	}
	
	/// Log a info-level message.
	func info(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		log(.info, msg, .magenta, file: file, line: line)
	}
	
	/// Log a debug-level message.
	func debug(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		log(.debug, msg, .cyan, file: file, line: line)
	}
	
	/// Log a verbose-level message.
	func verbose(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		log(.verbose, msg, .lightWhite, file: file, line: line)
	}
	
	/// Log a `Error` object.
	func logError(
		_ error: Error,
		file: String = #file,
		line: UInt = #line
	) {
		logError(error, file: file, line: line)
	}
	
	/// Log a shell command planned to be executed.
	func logShellCommand(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		logShellCommand(msg, file: file, line: line)
	}
	
	/// Log a success-like message.
	func success(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		success(msg, file: file, line: line)
	}
}
