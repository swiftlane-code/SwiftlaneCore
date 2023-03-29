//

import Foundation

public class FileHandleTextOutputStream: TextOutputStream {
	private let filePath: AbsolutePath
	private let fileHandle: FileHandle
	
	private init(
		filePath: AbsolutePath,
		fileHandle: FileHandle
	) throws {
		self.filePath = filePath
		self.fileHandle = fileHandle
	}
	
	public convenience init(
		filesManager: FSManaging,
		filePath: AbsolutePath,
		appendFile: Bool
	) throws {
		if !filesManager.fileExists(filePath) {
			try filesManager.write(filePath, data: Data())
		}
		
		let fileHandle = try FileHandle(forWritingAtPath: filePath.string).unwrap(
			errorDescription: "Unable to open log file \(filePath) for writing."
		)
		
		if appendFile {
			fileHandle.seekToEndOfFile()
		}
		
		try self.init(filePath: filePath, fileHandle: fileHandle)
	}

	deinit {
		fileHandle.closeFile()
	}

	public func write(_ string: String) {
		let data = Data(string.utf8)
		try? fileHandle.write(contentsOf: data)
		try? fileHandle.synchronize() // Force flushing in-memory buffer to disk.
	}
}
