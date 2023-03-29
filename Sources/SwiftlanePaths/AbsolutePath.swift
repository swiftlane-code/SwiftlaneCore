//

import Foundation

public struct AbsolutePath: PathProtocol {
	public enum Errors: Error {
		case isNotAbsolutePath(path: String)
		case isNotRelative(path: String, toBasePath: String)
		case containsNewlines(path: String)
	}
	
	public let string: String
	
	public init(_ string: String) throws {
		guard string != "/" else {
			self.string = string
			return
		}
		
		let string = NSString(string: string).expandingTildeInPath
			+ (string.hasSuffix("/") ? "/" : "") // expandingTildeInPath drops last slash
		
		guard string.starts(with: "/") else {
			throw Errors.isNotAbsolutePath(path: string)
		}
		guard !string.contains(where: \.isNewline) else {
			throw Errors.containsNewlines(path: string)
		}
		self.string = string
	}
}

public extension AbsolutePath {
	var deletingLastComponent: Self {
		/// `try!` never fails as we don't change beginning of the path.
		try! .init(string.deletingLastPathComponent)
	}
	
	func relative(to basePath: AbsolutePath) throws -> RelativePath {
		let partToRemove = basePath.hasSuffix("/") ? basePath.string : basePath.string + "/"
		let result = string.dropFirst(partToRemove.count)
		guard string.hasPrefix(partToRemove), !result.isEmpty else {
			throw Errors.isNotRelative(path: string, toBasePath: basePath.string)
		}
		return try RelativePath(result)
	}
}
