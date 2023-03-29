//

import Foundation
import PerfectRainbow

/// Prints just the message itself without any additional info such as timestamps.
/// Prints messages to `stdout`.
public struct SimpleLogger {
	public let logLevel: LoggingLevel
	
	public init(logLevel: LoggingLevel) {
		self.logLevel = logLevel
	}
}

extension SimpleLogger: Logging {
	public func uncheckedLog(
		_ level: LoggingLevel,
		_ msg: String,
		_ color: NamedColor?,
		terminator: String,
		file: String,
		line: UInt
	) {
		guard logLevel.includes(level: level) else {
			return
		}
		
		let coloredMessage = color.map { msg.applyingColor($0) } ?? msg
		Swift.print(coloredMessage, terminator: terminator)
	}
	
	public func logShellCommand(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		log(.info, String(msg.prefix { !$0.isWhitespace }) + " ...", .blue, file: file, line: line)
	}

	public func logError(
		_ error: Error,
		file: String = #file,
		line: UInt = #line
	) {
		log(.error, "Error: \"\(error)\"", .red, file: file, line: line)
	}

	public func success(
		_ msg: String,
		file: String = #file,
		line: UInt = #line
	) {
		log(.important, msg, .lightGreen, file: file, line: line)
	}
}
