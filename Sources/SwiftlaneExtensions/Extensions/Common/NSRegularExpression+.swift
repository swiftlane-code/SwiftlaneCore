//

import Foundation

public extension NSRegularExpression {
	func matches(in text: String) -> [String] {
		matches(in: text, range: NSRange(text.startIndex..., in: text))
			.map { String(text[Range($0.range, in: text)!]) }
	}

	func firstMatchString(in text: String) -> String? {
		guard let match = firstMatch(in: text, range: NSRange(text.startIndex..., in: text)) else {
			return nil
		}
		return (text as NSString).substring(with: match.range)
	}
	
	func firstMatchGroups(in text: String) -> [Substring]? {
		matchesGroups(in: text).first
	}
	
	func matchesGroups(in text: String) -> [[Substring]] {
		matches(
			in: text,
			range: NSRange(text.startIndex..., in: text)
		)
		.map { match in
			(0..<match.numberOfRanges).map {
				let rangeBounds = match.range(at: $0)
				guard let range = Range(rangeBounds, in: text) else {
					return ""
				}
				return text[range]
			}
		}
	}
    
	func matchesGroupsWithRanges(in text: String) -> [[(Substring, range: Range<String.Index>)?]] {
		let matches = matches(
			in: text,
			range: NSRange(text.startIndex..., in: text)
		)
		return matches.map { match in
			return (0..<match.numberOfRanges).map {
				let rangeBounds = match.range(at: $0)
				guard let range = Range(rangeBounds, in: text) else {
					return nil
				}
				return (text[range], range)
			}
		}
	}
	
	func isMatching(string: String) -> Bool {
		firstMatchString(in: string) != nil
	}
}
