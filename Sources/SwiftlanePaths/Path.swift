//

import Foundation

extension Path: PathProtocol {
	public var string: String {
		switch self {
		case let .relative(relative):
			return relative.string
		case let .absolute(absolute):
			return absolute.string
		}
	}
	
	public init(_ path: String) throws {
		if let absolute = try? AbsolutePath(path) {
			self = .absolute(absolute)
		} else {
			let relative = try RelativePath(path)
			self = .relative(relative)
		}
	}
}

public enum Path: Codable, Equatable, Hashable {
	case absolute(AbsolutePath)
	case relative(RelativePath)
	
	public func makeAbsoluteIfIsnt(relativeTo: AbsolutePath) -> AbsolutePath {
		switch self {
		case let .absolute(absolutePath):
			return absolutePath
		case let .relative(relativePath):
			return relativeTo.appending(path: relativePath)
		}
	}
	
	public func relative() throws -> RelativePath {
		switch self {
		case let .relative(relative):
			return try .init(relative.string)
		case let .absolute(absolute):
			return try .init(absolute.string)
		}
	}
}
