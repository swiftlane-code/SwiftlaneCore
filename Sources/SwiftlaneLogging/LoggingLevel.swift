//

import Foundation

/// Priority of a log message.
/// The most important level is `error`.
/// The least important level is `silent`.
public enum LoggingLevel: Int, Comparable {
	case error = 0
	case warning
	case important
	case info
	case debug
	case verbose
	case silent
	
	/// Equivalent to `self >= level`.
	public func includes(level: LoggingLevel) -> Bool {
		self >= level
	}
	
	/// A bigger logging level include more information which is obviously less important.
	public static func < (lhs: LoggingLevel, rhs: LoggingLevel) -> Bool {
		lhs.rawValue < rhs.rawValue
	}
}
