//

import Foundation

/// See ``StringMatcher+Codable.swift``.
public enum StringMatcher: Equatable {
	case equals(String)
	case contains(String)
	case hasPrefix(String)
	case hasSuffix(String)
	case regex(NSRegularExpression)
	
	public static func regex(
		_ pattern: String,
		options: NSRegularExpression.Options = [.anchorsMatchLines]
	) throws -> Self {
		.regex(try NSRegularExpression(pattern: pattern, options: options))
	}

	public func isMatching(_ string: String) -> Bool {
		switch self {
		case let .equals(value):
			return string == value
			
		case let .contains(value):
			return string.contains(value)
			
		case let .hasPrefix(prefix):
			return string.hasPrefix(prefix)
			
		case let .hasSuffix(suffix):
			return string.hasSuffix(suffix)
			
		case let .regex(regex):
			return regex.firstMatchString(in: string) != nil
		}
	}
}

public extension Collection where Element == StringMatcher {
	/// If at least one matcher in the collection matches `string`.
	func isMatching(string: String) -> Bool {
		contains {
			$0.isMatching(string)
		}
	}
	
	func firstMatchingMatcher(string: String) -> StringMatcher? {
		first {
			$0.isMatching(string)
		}
	}
}
