//

import Foundation

public extension Date {
	/// Parses date from string in format `dd.MM.yyyy`.
	static func from(string: String, format: String = "dd.MM.yyyy") throws -> Date {
		let parser = DateFormatter()
		parser.dateFormat = format
		return try parser.date(from: string)
			.unwrap(errorDescription: "Can't parse date from string \(string.quoted)")
	}
}
