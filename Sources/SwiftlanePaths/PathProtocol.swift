//

import Foundation

@available(*, unavailable, renamed: "PathProtocolErrors")
public enum AnyPathErrors: Error {}

public enum PathProtocolErrors: Error {
	case normalizationError(path: String, description: String)
}

@available(*, unavailable, renamed: "PathProtocol")
public protocol AnyPath {}

public protocol PathProtocol: Comparable, Hashable, CustomStringConvertible, Codable {
	var string: String { get }
	
	init(_ path: String) throws
}

public extension PathProtocol {
	init<T: StringProtocol>(_ path: T) throws {
		try self.init(String(path))
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let string = try container.decode(String.self)
		try self.init(string)
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(string)
	}
	
	var description: String {
		string
	}
	
	static func < (lhs: Self, rhs: Self) -> Bool {
		lhs.string < rhs.string
	}
	
	static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.string == rhs.string
	}
	
	/// Append relative part.
	func appending(path part: RelativePath, file: String = #file, line: UInt = #line) -> Self {
		/// `try!` never fails as we don't change beginning of the path.
		return try! .init(string.appendingPathComponent(part.string))
	}
	
	/// Append relative part. Throws error if supplied `relativePath` is absolute.
	func appending(path relativePath: String, file: String = #file, line: UInt = #line) throws -> Self {
		let relative = try RelativePath(relativePath)
		return appending(path: relative, file: file, line: line)
	}
	
	/// Append suffix to the path without adding `/` before the suffix.
	///
	/// Examples:
	/// ```
	/// "/path".appending(suffix: "s") == "/paths"
	/// "/path/".appending(suffix: "s") == "/path/s" // Be careful!
	/// ```
	///
	/// - Parameter suffix: string.
	func appending(suffix: String) -> Self {
		try! Self(string + suffix)
	}
}

public extension PathProtocol {
	var firstComponent: String {
		/// Never fails because `string` is never empty.
		string.firstPathComponent!
	}
    
	var lastComponent: RelativePath {
		/// `try!` never fails as we take the last component of path.
		try! .init(string.lastPathComponent)
	}
	
	var deletingExtension: Self {
		/// `try!` never fails as we don't change beginning of the path.
		try! .init(string.deletingPathExtension)
	}
	
	/// The path extension, if any, of the string as interpreted as a path.
	///
	/// The path extension is the portion of the last path component which follows the final period, if there is one.
	/// The extension divider is not included.
	///
	/// The following table illustrates the effect of pathExtension on a variety of different paths:
	///
	///  	"/tmp/scratch.tiff" -> "tiff"
	///  	".scratch.tiff" -> "tiff"
	///  	"/tmp/scratch" -> ""
	///  	"/tmp/" -> ""
	///  	"/tmp/scratch..tiff" -> "tiff"
	var pathExtension: String {
		string.pathExtension
	}
	
	func hasPrefix(_ prefix: String) -> Bool {
		string.hasPrefix(prefix)
	}
	
	func hasSuffix(_ suffix: String) -> Bool {
		string.hasSuffix(suffix)
	}
    
	func replacingExtension(with newExtension: String) -> Self {
		self.deletingExtension.appending(suffix: newExtension)
	}
	
	/// Remove `"."` and `".."` components of the path.
	func normalized() throws -> Self {
		let parts = string.split(separator: "/", omittingEmptySubsequences: true)
		
		var result: [String.SubSequence] = []
		
		try parts
			.filter { $0 != "." }
			.forEach {
				if $0 == ".." {
					guard !result.isEmpty else {
						throw PathProtocolErrors.normalizationError(
							path: string,
							description: "Absolute path component \"..\" has no predecessors."
						)
					}
					result.removeLast()
				} else {
					result.append($0)
				}
			}
		
		let firstChar: String = {
			if self is AbsolutePath {
				return string.first.map { String($0) } ?? ""
			}
			return ""
		}()
		let normalized = firstChar + result.joined(separator: "/")
		return try Self(normalized)
	}
}
