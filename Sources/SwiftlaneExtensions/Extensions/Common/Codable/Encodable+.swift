//

import Foundation

public extension Encodable {
	/// Represent the object as a pretty printed JSON string.
	func asPrettyJSON() -> String {
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		encoder.dateEncodingStrategy = .iso8601
		let json = (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) }
		return json ?? "<<<Unable to encode as json object: \(String(reflecting: self).quoted)>>>"
	}
}
