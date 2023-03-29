//

import Foundation
import PerfectRainbow
import SwiftlaneExtensions

/// Custom fancy logger which adds timestamps to all messages.
public class DetailedLogger {
	public let logLevel: LoggingLevel
	
	private let dateFormatter: DateFormatter
	private let printClosure: (String, _ terminator: String) -> Void
	
	init(
		dateFormatter: DateFormatter,
		logLevel: LoggingLevel,
		printClosure: @escaping (String, _ terminator: String) -> Void
	) {
		self.dateFormatter = dateFormatter
		self.logLevel = logLevel
		self.printClosure = printClosure
	}
}

public extension DetailedLogger {
	convenience init(
		logLevel: LoggingLevel,
		printClosure: @escaping (String, _ terminator: String) -> Void = {
			Swift.print($0, terminator: $1)
		}
	) {
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm:ss.SSS zzz"

		self.init(dateFormatter: formatter, logLevel: logLevel, printClosure: printClosure)
	}
}

extension DetailedLogger: Logging {
	public func uncheckedLog(
		_ level: LoggingLevel,
		_ msg: String,
		_ color: NamedColor?,
		terminator: String,
		file: String,
		line: UInt
	) {
		let fileName = NSString(string: file).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
		let prefix = "[\(fileName) \(dateFormatter.string(from: Date()))] > "
		let coloredMessage = color.map { msg.applyingColor($0) } ?? msg
		printClosure(prefix + coloredMessage, terminator)
	}
	
	public func logError(_ error: Error, file: String, line: UInt) {
		let msg: String
		if logLevel >= .verbose {
			msg = "Error: \(error.localizedDescription)\n\n" + String(dumping: error)
		} else if logLevel >= .debug {
			msg = "Error: \(error.localizedDescription)\n\n" + String(reflecting: error)
		} else if logLevel >= .info {
			msg = "Error: \(error.localizedDescription)\n\n\(error)"
		} else {
			msg = "Error: \(error.localizedDescription)"
		}
		
		log(.error, msg, .lightRed, file: file, line: line)
	}
	
	public func logShellCommand(_ msg: String, file: String, line: UInt) {
		log(.debug, msg, .blue, file: file, line: line)
	}
	
	public func success(_ msg: String, file: String, line: UInt) {
		log(.important, msg, .lightGreen, file: file, line: line)
	}
}
