//

import Foundation

extension StringMatcher: Codable {
	private enum CodingKeys: String, CodingKey {
		case equals
		case contains
		case hasPrefix
		case hasSuffix
		case regex
	}
	
	/// YAML Example for decodable `StringMatcher.contains("123")`:
	///
	/// 	contains: "123"
	///
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		if let string = try container.decodeIfPresent(String.self, forKey: .equals) {
			self = .equals(string)
			
		} else if let substring = try container.decodeIfPresent(String.self, forKey: .contains) {
			self = .contains(substring)
			
		} else if let prefix = try container.decodeIfPresent(String.self, forKey: .hasPrefix) {
			self = .hasPrefix(prefix)
			
		} else if let suffix = try container.decodeIfPresent(String.self, forKey: .hasSuffix) {
			self = .hasSuffix(suffix)
			
		} else {
			self = try .regex(try container.decode(String.self, forKey: .regex))
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		switch self {
		case let .equals(string):
			try container.encode(string, forKey: .equals)
			
		case let .contains(string):
			try container.encode(string, forKey: .contains)
			
		case let .hasPrefix(prefix):
			try container.encode(prefix, forKey: .hasPrefix)
			
		case let .hasSuffix(suffix):
			try container.encode(suffix, forKey: .hasSuffix)
			
		case let .regex(regex):
			try container.encode(regex.pattern, forKey: .regex)
		}
	}
}
