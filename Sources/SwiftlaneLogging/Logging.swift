//

import Foundation
import PerfectRainbow

// sourcery: AutoMockable
/// Protocol of a logger.
public protocol Logging {
	/// Current level of logging.
	///
	/// Setting it to ``LoggingLevel.error`` makes the logger ignore everything except logs of that level.
	var logLevel: LoggingLevel { get }
	
	/// !!! DO NOT call this method directly.
	///
	/// Main method which is implemented by a specific logger implementation.
	///
	/// This function will not be called if current `logLevel` is less verbose than `level`
	/// 	(See ``shouldLog(level:)``).
	///
	/// - Parameters:
	///   - level: level of the logged message.
	///   - msg: logged message.
	///   - color: color of message.
	///   - terminator: additional suffix of the message (`\n` by default).
	func uncheckedLog(
		_ level: LoggingLevel,
		_ msg: String,
		_ color: NamedColor?,
		terminator: String,
		file: String,
		line: UInt
	)
	
	/// Special method which is used by ``ShellExecutor`` to log an executed shell command.
	///
	/// Note: Should be a decorator to ``log(_:_:_:terminator:file:line:)``.
	func logShellCommand(
		_ msg: String,
		file: String,
		line: UInt
	)
	
	/// Special method which is used to log errors.
	///
	/// Note: Should be a decorator to ``log(_:_:_:terminator:file:line:)``.
	func logError(
		_ error: Error,
		file: String,
		line: UInt
	)
	
	/// Special method which is used to log success-type messages.
	///
	/// Note: Should be a decorator to ``log(_:_:_:terminator:file:line:)``.
	func success(
		_ msg: String,
		file: String,
		line: UInt
	)
}

public extension Logging {
	/// Returns if a message of logging level `level` should be logged
	/// taking into account current value of `self.logLevel`.
	func shouldLog(
		level: LoggingLevel
	) -> Bool {
		logLevel.includes(level: level)
	}
	
	/// Simple wrapper for ``uncheckedLog(_:_:_:terminator:file:line:)``
	/// which checks ``shouldLog(level:)`` beforehand.
	func log(
		_ level: LoggingLevel,
		_ msg: String,
		_ color: NamedColor? = nil,
		terminator: String = "\n",
		file: String = #file,
		line: UInt = #line
	) {
		guard shouldLog(level: level) else {
			return
		}
		uncheckedLog(level, msg, color, terminator: terminator, file: file, line: line)
	}
}
