//

import Foundation
import SwiftlaneExtensions
import SwiftlaneLogging

/// Utility to work with files and directories on disk.
///
// sourcery: AutoMockable
public protocol FSManaging {
	func fileExists(_ path: AbsolutePath) -> Bool
	func directoryExists(_ path: AbsolutePath) -> Bool
	func fileSize(_ path: AbsolutePath) throws -> UInt64
	func readData(_ path: AbsolutePath, log: Bool) throws -> Data
	func readText(_ path: AbsolutePath, log: Bool) throws -> String
	func decode<T: Decodable, D: AnyDecoder>(_ path: AbsolutePath, decoder: D) throws -> T
	func write(_ path: AbsolutePath, data: Data) throws
	func write(_ path: AbsolutePath, text: String) throws
	func delete(_ path: AbsolutePath) throws
	/// `destination` should include FULL file or directory name at the end.
	/// `destination` ending with `/` or `/.` is not allowed.
	func copy(_ source: AbsolutePath, to destination: AbsolutePath) throws
	func find(_ path: AbsolutePath, file: String, line: UInt) throws -> [AbsolutePath]
	func mkdir(_ path: AbsolutePath) throws
	func createSymlink(_ path: AbsolutePath, pointingTo: AbsolutePath) throws
	func move(_ path: AbsolutePath, newPath: AbsolutePath) throws
	func homeDirectoryForCurrentUser() throws -> AbsolutePath
	func pwd() throws -> AbsolutePath
	func ls(_ path: AbsolutePath) throws -> [AbsolutePath]
	func stat(_ path: AbsolutePath, keys: Set<URLResourceKey>) throws -> URLResourceValues
}

public extension FSManaging {
	func find(_ path: AbsolutePath, file: String = #file, line: UInt = #line) throws -> [AbsolutePath] {
		try find(path, file: file, line: line)
	}
}

public class FSManager: FSManaging {
	enum Errors: Error, Equatable {
		case notFilePath(String)
		case pathLeadsToExistingFile(String)
		case invalidArgument(description: String)
	}

	let logger: Logging
	let fileManager: FileManagerProtocol

	public init(
		logger: Logging,
		fileManager: FileManagerProtocol
	) {
		self.logger = logger
		self.fileManager = fileManager
	}
	
	public func fileExists(_ path: AbsolutePath) -> Bool {
		return fileManager.fileExists(path.string)
	}

	public func directoryExists(_ path: AbsolutePath) -> Bool {
		return fileManager.directoryExists(path.string)
	}
	
	public func fileSize(_ path: AbsolutePath) throws -> UInt64 {
		let attr = try fileManager.attributesOfItem(atPath: path.string)
		let fileSize = (attr as NSDictionary).fileSize()
		logger.debug("Size of file \(path.string.quoted) is \(fileSize).")
		return fileSize
	}

	public func readData(_ path: AbsolutePath, log: Bool = true) throws -> Data {
		if log {
			logger.debug("Reading file '\(path.string)'...")
		}

		return try fileManager.contents(atPath: path.string)
			.unwrap(errorDescription: "Unable to read data from \"\(path)\"")
	}

	public func readText(_ path: AbsolutePath, log: Bool = true) throws -> String {
		if log {
			logger.debug("Reading file '\(path.string)'...")
		}
        
		return try String(contentsOfFile: path.string, encoding: .utf8)
	}
	
	public func decode<T, D>(_ path: AbsolutePath, decoder: D) throws -> T where T: Decodable, D: AnyDecoder {
		let data = try readData(path, log: true)
		logger.debug("Decoding \(String(reflecting: T.self)) from \(path.string.quoted)")
		let object = try decoder.decode(T.self, from: data)
		return object
	}
	
	public func write(_ path: AbsolutePath, data: Data) throws {
		// Path separator at the end of path means that path is not path to file
		guard !path.string.hasSuffix("/") else {
			throw Errors.notFilePath(path.string)
		}

		let dirPath = path.string.deletingLastPathComponent
		try fileManager.createDirectory(
			atPath: dirPath,
			withIntermediateDirectories: true
		)

		logger.debug("Writing file '\(path)'...")

		try data.write(to: try URL(string: "file://" + path.string).unwrap())
	}

	public func write(_ path: AbsolutePath, text: String) throws {
		// Path separator at the end of path means that path is not path to file
		guard !path.string.hasSuffix("/") else {
			throw Errors.notFilePath(path.string)
		}

		let dirPath = path.string.deletingLastPathComponent
		try fileManager.createDirectory(
			atPath: dirPath,
			withIntermediateDirectories: true
		)

		logger.debug("Writing file '\(path)'...")

		try text.write(toFile: path.string, atomically: false, encoding: .utf8)
	}
    
	public func delete(_ path: AbsolutePath) throws {
		if fileExists(path) || directoryExists(path) {
			logger.debug("Deleting '\(path)'...")
			do {
				try fileManager.removeItem(atPath: path.string)
			} catch {
				logger.error("Failed to delete '\(path)'.")
				throw error
			}
		} else {
			logger.warn("'\(path)' wasn't deleted. It doesn't exist.")
		}
	}
	
	/// `destination` should include FULL file or directory name at the end.
	/// `destination` ending with `/` or `/.` is not allowed.
	public func copy(_ source: AbsolutePath, to destination: AbsolutePath) throws {
		logger.debug("Copy '\(source)' to '\(destination)'...")
		
		guard !destination.hasSuffix("/"), !destination.hasSuffix("/.") else {
			throw Errors.invalidArgument(
				description: "Destination ending with `/` or `/.` is not allowed."
			)
		}
		
		if !directoryExists(destination.deletingLastComponent) {
			try mkdir(destination.deletingLastComponent)
		}

		do {
			try fileManager.copyItem(atPath: source.string, toPath: destination.string)
		} catch {
			logger.error("Failed to copy '\(source)' to '\(destination)'")
			throw error
		}
	}
    
	public func find(_ path: AbsolutePath, file: String, line: UInt) throws -> [AbsolutePath] {
		if !fileManager.directoryExists(path.string) {
			logger.error(path.string.quoted + " doesn't exist.", file: file, line: line)
		}
		return try fileManager.subpathsOfDirectory(atPath: path.string)
			.map { try! RelativePath($0) }
			.map { path.appending(path: $0) }
	}

	public func ls(_ path: AbsolutePath) throws -> [AbsolutePath] {
		let url = URL(fileURLWithPath: path.string)
		return try fileManager.contentsOfDirectory(at: url)
			.map { try AbsolutePath($0.path) }
	}
	
	public func mkdir(_ path: AbsolutePath) throws {
		logger.debug("Creating directory \(path.string.quoted)'")

		guard !fileManager.fileExists(path.string) else {
			throw Errors.pathLeadsToExistingFile(path.string)
		}

		try fileManager.createDirectory(atPath: path.string, withIntermediateDirectories: true)
	}

	public func createSymlink(_ path: AbsolutePath, pointingTo destinationPath: AbsolutePath) throws {
		logger.debug("Creating symlink at \(path.string.quoted) pointing to \(destinationPath.string.quoted)")
		try fileManager.createSymbolicLink(atPath: path.string, withDestinationPath: destinationPath.string)
	}
	
	public func move(_ path: AbsolutePath, newPath: AbsolutePath) throws {
		logger.debug("Moving \(path.string.quoted) to \(newPath.string.quoted)")
		try fileManager.moveItem(atPath: path.string, toPath: newPath.string)
	}
	
	public func homeDirectoryForCurrentUser() throws -> AbsolutePath {
		try AbsolutePath(fileManager.homeDirectoryForCurrentUser.path)
	}

	public func pwd() throws -> AbsolutePath {
		try AbsolutePath(fileManager.currentDirectoryPath)
	}

	public func stat(_ path: AbsolutePath, keys: Set<URLResourceKey>) throws -> URLResourceValues {
		let url = URL(fileURLWithPath: path.string)
		return try url.resourceValues(forKeys: keys)
	}
}
