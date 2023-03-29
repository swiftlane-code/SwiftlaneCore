//

import Foundation

/// Decodable ``StringMatcher`` with description.
///
/// YAML example:
///
///		matchers:
/// 		- regex: "^[0-9]+$"
/// 		  description: "Only digits."
///
public struct DescriptiveStringMatcher: Decodable {
	public let description: String
	public let matcher: StringMatcher
	
	public init(
		description: String,
		matcher: StringMatcher
	) {
		self.description = description
		self.matcher = matcher
	}
	
	public init(from decoder: Decoder) throws {
		enum CodingKeys: String, CodingKey {
			case description
		}
		let container = try decoder.container(keyedBy: CodingKeys.self)
		description = try container.decode(String.self, forKey: .description)
		matcher = try StringMatcher(from: decoder)
	}
}
