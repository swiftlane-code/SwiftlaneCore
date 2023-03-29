//

import Foundation

public extension DateFormatter {
	static func strict_GMT_enUSPOSIX(format: Format) -> DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = format.rawValue
		formatter.calendar = Calendar(identifier: .iso8601)
		formatter.timeZone = .GMT
		formatter.locale = .en_US_POSIX
		return formatter
	}
	
	enum Format: String {
		case shortISO8601 = "yyyy-MM-dd'T'HH:mm:ss'Z"
		case fullISO8601 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
		case yyyyMMdd_dashSeparated = "yyyy-MM-dd"
		case ddMMyyyy_dashSeparated = "dd-MM-yyyy"
		case ddMMyyyy_dotSeparated = "dd.MM.yyyy"
		case ddMM_dotSeparated = "dd.MM"
		case full_custom = "yyyy-MM-dd_HH-mm-ss"
	}
}

public extension DateFormatter {
	static let shortISO8601: DateFormatter = .strict_GMT_enUSPOSIX(
		format: .shortISO8601
	)

	static let fullISO8601: DateFormatter = .strict_GMT_enUSPOSIX(
		format: .fullISO8601
	)
	
	static let ddMMyyyyDashSeparated: DateFormatter = .strict_GMT_enUSPOSIX(
		format: .ddMMyyyy_dashSeparated
	)
	
	static let ddMMyyyyDotSeparated: DateFormatter = .strict_GMT_enUSPOSIX(
		format: .ddMMyyyy_dotSeparated
	)

	static let ddMM: DateFormatter = .strict_GMT_enUSPOSIX(
		format: .ddMM_dotSeparated
	)
	
	static let yyyyMMdd_dashSeparated: DateFormatter = .strict_GMT_enUSPOSIX(
		format: .yyyyMMdd_dashSeparated
	)

	static let full_custom: DateFormatter = .strict_GMT_enUSPOSIX(
		format: .full_custom
	)
}

public extension Date {
	/// `yyyy-MM-dd'T'HH:mm:ss'Z`
	var shortISO8601String: String {
		DateFormatter.shortISO8601.string(from: self)
	}

	/// `yyyy-MM-dd'T'HH:mm:ss.SSS'Z`
	var fullISO8601String: String {
		DateFormatter.fullISO8601.string(from: self)
	}
	
	/// `dd-MM-yyyy`
	var ddMMyyyy_dashSeparated: String {
		DateFormatter.ddMMyyyyDashSeparated.string(from: self)
	}
	
	/// `dd.MM.yyyy`
	var ddMMyyyy_dotSeparated: String {
		DateFormatter.ddMMyyyyDotSeparated.string(from: self)
	}

	/// `yyyy-MM-dd_HH-mm-ss`
	var full_custom: String {
		DateFormatter.full_custom.string(from: self)
	}
}
