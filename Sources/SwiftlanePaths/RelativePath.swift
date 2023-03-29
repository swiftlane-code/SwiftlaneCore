//

import Foundation

public struct RelativePath: PathProtocol {
	enum Errors: Error {
		case isNotRelativePath(String)
		case tildeIsNotSupportedInRelativePath(String)
		case emptyRelativePath
		case containsNewLines(path: String)
	}
	
	public let string: String
	
	/// * Relative path should not be empty.
	/// * Relative path should not start with `"/"`.
	public init(_ path: String) throws {
		guard !path.starts(with: "/") else {
			throw Errors.isNotRelativePath(path)
		}
		guard !path.starts(with: "~") else {
			throw Errors.tildeIsNotSupportedInRelativePath(path)
		}
		guard !path.isEmpty else {
			throw Errors.emptyRelativePath
		}
		guard !path.contains(where: \.isNewline) else {
			throw Errors.containsNewLines(path: path)
		}
		self.string = path
	}
}

public extension RelativePath {
	/// Will throw error if result is empty.
	func deletingLastComponent() throws -> Self {
		try .init(string.deletingLastPathComponent)
	}
}
