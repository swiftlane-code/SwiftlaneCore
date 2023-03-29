//

import Foundation
import SwiftlaneExtensions
import SwiftlaneLogging

/// Allows to log (using `logger`) time required to perform some work in human readable format.
/// e.g. `> Parsing took 5 seconds.`
public struct TimeMeasurer {
	private let formatter: DateComponentsFormatting
	private let logger: Logging
	private let messagesLogLevel: LoggingLevel
	
	init(
		formatter: DateComponentsFormatting,
		logger: Logging,
		messagesLogLevel: LoggingLevel = .important
	) {
		self.formatter = formatter
		self.logger = logger
		self.messagesLogLevel = messagesLogLevel
	}
	
	public init(logger: Logging, messagesLogLevel: LoggingLevel = .important) {
		let formatter = DateComponentsFormatter()
		formatter.unitsStyle = .full
		formatter.allowedUnits = [.month, .day, .hour, .minute, .second]
		
		// often, you don't care about seconds if the elapsed time is in months,
		// so you'll set max unit to whatever is appropriate in your case
		formatter.maximumUnitCount = 2
		
		self.init(formatter: formatter, logger: logger, messagesLogLevel: messagesLogLevel)
	}
}

extension TimeMeasurer: TimeMeasuring {
	/// Start time measuring.
	/// - Returns: `seed` which needs `seed.finishTimeMeasuring()` to be called.
	public func measure(
		description: String,
		file: String = #file,
		line: UInt = #line
	) -> TimeMeasuringSeed {
		let start = Date()
		logger.log(messagesLogLevel, "\(description)...", file: file, line: line)
		return TimeMeasuringSeed { file, line in
			logTimeElapsed(description, from: start, file: file, line: line)
		}
	}
	
	@discardableResult
	public func measure<T>(
		description: String,
		_ closure: () throws -> T,
		file: String = #file,
		line: UInt = #line
	) rethrows -> T {
		let seed = measure(description: description, file: file, line: line)

		do {
			let result = try closure()
			seed.finishTimeMeasuring(file: file, line: line)
			return result
		} catch {
			seed.finishTimeMeasuring(file: file, line: line)
			throw error
		}
	}
}

private extension TimeMeasurer {
	func logTimeElapsed(
		_ desc: String,
		from start: Date,
		file: String,
		line: UInt
	) {
		let stringTimeElapsed = formatter.string(from: start, to: Date()) ?? "nil"
		logger.log(messagesLogLevel, desc + " took " + stringTimeElapsed, file: file, line: line)
	}
}
