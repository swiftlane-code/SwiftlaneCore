//

import Foundation

///
/// Semantic Version.
///
/// Given a version number MAJOR.MINOR.PATCH, increment the:
/// * MAJOR version when you make incompatible API changes,
/// * MINOR version when you add functionality in a backwards compatible manner, and
/// * PATCH version when you make backwards compatible bug fixes.
///
/// Specification: [https://semver.org](https://semver.org)
///
public struct SemVer: Hashable, Equatable, Codable {
	public typealias StringLiteralType = String

	public let major: UInt
	public let minor: UInt
	public let patch: UInt

	public init(_ major: UInt, _ minor: UInt, _ patch: UInt) {
		self.major = major
		self.minor = minor
		self.patch = patch
	}
	
	public enum StringFormat {
		/// Omitting `patch` if `patch` is zero.
		/// Omitting `patch` and `minor` if those are both zeros.
		case atLeastMajor
		
		/// Omitting `patch` if `patch` is zero.
		case atLeastMajorMinor
		
		/// Always `<major>.<minor>.<patch>`
		case full
	}
	
	public func string(format: StringFormat) -> String {
		switch format {
		case .atLeastMajor:
			var result = "\(major)"
			if minor != 0 || patch != 0 { result += ".\(minor)" }
			if patch != 0 { result += ".\(patch)" }
			return result
			
		case .atLeastMajorMinor:
			var result = "\(major).\(minor)"
			if patch != 0 { result += ".\(patch)" }
			return result
			
		case .full:
			return "\(major).\(minor).\(patch)"
		}
	}
}

extension SemVer {
	public enum Errors: Error, Equatable {
		case notASemVer(String)
	}
	
	private static let regex = try! NSRegularExpression(
		pattern: #"^(\d+)(?:\.(\d+))?(?:\.(\d+))?$"#,
		options: []
	)
	
	private static func parse(from string: String) throws -> SemVer {
		let matches = regex.matchesGroups(in: string)

		guard let groups = matches[safe: 0]?.dropFirst() else {
			throw Errors.notASemVer(string)
		}
		
		let numbers = groups.compactMap { UInt($0) }

		return SemVer(
			numbers[safe: 0] ?? 0,
			numbers[safe: 1] ?? 0,
			numbers[safe: 2] ?? 0
		)
	}
}

extension SemVer: Comparable {
	public static func < (lhs: SemVer, rhs: SemVer) -> Bool {
		let lhsComponents = [lhs.major, lhs.minor, lhs.patch]
		let rhsComponents = [rhs.major, rhs.minor, rhs.patch]

		guard lhsComponents != rhsComponents else {
			return false
		}

		return lhsComponents.lexicographicallyPrecedes(rhsComponents)
	}
}

public extension SemVer {
	/// Strict format initializer.
	init(parseFrom string: String) throws {
		self = try Self.parse(from: string)
	}
}
