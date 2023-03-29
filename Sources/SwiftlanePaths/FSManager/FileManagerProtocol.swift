//

import Foundation

// sourcery: AutoMockable
public protocol FileManagerProtocol {
	var currentDirectoryPath: String { get }
	func fileExists(_ path: String) -> Bool
	func directoryExists(_ path: String) -> Bool
	func createDirectory(
		atPath path: String,
		withIntermediateDirectories createIntermediates: Bool,
		attributes: [FileAttributeKey: Any]?
	) throws
	func removeItem(atPath path: String) throws
	func copyItem(atPath srcPath: String, toPath dstPath: String) throws
	func subpathsOfDirectory(atPath path: String) throws -> [String]
	func createSymbolicLink(atPath path: String, withDestinationPath destPath: String) throws
	func contents(atPath: String) throws -> Data?
	func moveItem(atPath: String, toPath: String) throws
	func contentsOfDirectory(atPath: String) throws -> [String]
	func attributesOfItem(atPath path: String) throws -> [FileAttributeKey: Any]
	var homeDirectoryForCurrentUser: URL { get }
	func contentsOfDirectory(
		at url: URL,
		includingPropertiesForKeys keys: [URLResourceKey]?,
		options mask: FileManager.DirectoryEnumerationOptions
	) throws -> [URL]
}

extension FileManagerProtocol {
	func createDirectory(atPath path: String, withIntermediateDirectories createIntermediates: Bool) throws {
		try createDirectory(atPath: path, withIntermediateDirectories: createIntermediates, attributes: nil)
	}

	func contentsOfDirectory(
		at url: URL,
		includingPropertiesForKeys keys: [URLResourceKey]?
	) throws -> [URL] {
		try contentsOfDirectory(at: url, includingPropertiesForKeys: keys, options: [])
	}

	func contentsOfDirectory(
		at url: URL
	) throws -> [URL] {
		try contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
	}
}

extension FileManager: FileManagerProtocol {
	public func fileExists(_ path: String) -> Bool {
		var isDir: ObjCBool = false
		let exists = fileExists(atPath: path, isDirectory: &isDir)
		return exists && !isDir.boolValue
	}

	public func directoryExists(_ path: String) -> Bool {
		var isDir: ObjCBool = false
		let exists = fileExists(atPath: path, isDirectory: &isDir)
		return exists && isDir.boolValue
	}
}
