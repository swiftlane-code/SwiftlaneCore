//

import Foundation

public extension StringProtocol {
	/// Surround the string value by double quotes.
	var quoted: String {
		"\"\(self)\""
	}
	
	/// Returns `nil` if the instance is an empty string.
	var nilIfEmpty: Self? {
		isEmpty ? nil : self
	}
}

public extension Optional where Wrapped == String {
	/// Surround the string value by double quotes or return `"nil"`.
	var quotedOrNil: String {
		self?.quoted ?? "nil"
	}
}

public extension String {
	/// Split the string by newlines and append a prefix to each substring,
	/// then join substring back together (using the provided `joinUsingNewLine`).
	func addPrefixToAllLines(_ prefix: String, joinUsingNewLine: String = "\n") -> String {
		self
			.split(omittingEmptySubsequences: false, whereSeparator: \.isNewline)
			.map { prefix + $0 }
			.joined(separator: joinUsingNewLine)
	}
	
	/// Replace occurences in place.
	mutating func replaceOccurrences(of string: String, with replacement: String) {
		self = self.replacingOccurrences(of: string, with: replacement)
	}
	
	/// Delete prefix of the string
	/// if the string has the prefix otherwise just return source string.
	func deletingPrefix(_ prefix: String) -> String {
		guard self.hasPrefix(prefix) else { return self }
		return String(self.dropFirst(prefix.count))
	}
	
	/// Delete suffix of the string
	/// if the string has that suffix otherwise just return source string.
	func deletingSuffix(_ suffix: String) -> String {
		guard self.hasSuffix(suffix) else { return self }
		return String(self.dropLast(suffix.count))
	}
}

public extension String {
	/// Make new string by uppercasing only the first character.
	var uppercasedFirst: String {
		if isEmpty {
			return ""
		}
		
		let firstIndex = index(startIndex, offsetBy: 1)
		
		let first = self[..<firstIndex].uppercased()
		let others = self[firstIndex...]
		
		return first + others
	}
}

public extension String {
	/// Create new `String` by dumping the given object's contents using its mirror.
	///
	/// - Parameters:
	///   - object: The value to output to the `target` stream.
	///   - name: A label to use when writing the contents of `value`. When `nil`
	///     is passed, the label is omitted. The default is `nil`.
	///   - indent: The number of spaces to use as an indent for each line of the
	///     output. The default is `0`.
	///   - maxDepth: The maximum depth to descend when writing the contents of a
	///     value that has nested components. The default is `Int.max`.
	///   - maxItems: The maximum number of elements for which to write the full
	///     contents. The default is `Int.max`.
	init<T>(
		dumping object: T,
		name: String? = nil,
		indent: Int = 0,
		maxDepth: Int = .max,
		maxItems: Int = .max
	) {
		self.init()
		
		dump(
			object,
			to: &self,
			name: name,
			indent: indent,
			maxDepth: maxDepth,
			maxItems: maxItems
		)
	}
}
