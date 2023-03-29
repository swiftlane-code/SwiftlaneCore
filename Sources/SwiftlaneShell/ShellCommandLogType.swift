//

import Foundation
import SwiftlaneLogging

public enum ShellCommandLogType: Equatable {
	case silent
	case commandOnly
	case commandAndOutput(outputLogLevel: LoggingLevel)
	case outputOnly(outputLogLevel: LoggingLevel)
	
	var shouldLogCommand: Bool {
		switch self {
		case .silent, .outputOnly: return false
		case .commandOnly, .commandAndOutput: return true
		}
	}
	
	var outputLogLevel: LoggingLevel {
		switch self {
		case .silent, .commandOnly: return .silent
		case let .outputOnly(level), let .commandAndOutput(level): return level
		}
	}
}
