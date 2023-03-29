//

@testable import SwiftlanePaths

import Foundation
import SwiftlaneCoreMocks
import SwiftlaneLogging
import SwiftlaneUnitTestTools
import SwiftyMocky
import XCTest

class FSManagerTests: XCTestCase {
	var loggerMock: LoggingMock!
	var fileManagerMock: FileManagerProtocolMock!

	let realFileManager = FileManager.default

	override func setUp() {
		super.setUp()

		loggerMock = LoggingMock()
		fileManagerMock = FileManagerProtocolMock()
		
		loggerMock.given(.logLevel(getter: .verbose))
	}

	func test_fileExist() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let cases: [AbsolutePath: Bool] = [
			try! AbsolutePath("/bin/bash"): true,
			try! AbsolutePath("/hl/not/exist"): false,
			try! AbsolutePath("/"): false,
		]

		for (filePath, expectedResult) in cases {
			// when
			let isExists = filesManager.fileExists(filePath)

			// then
			XCTAssertEqual(isExists, expectedResult, "For \(filePath)")
		}
	}

	func test_fileExistIfPathIsDir() {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let cases: [AbsolutePath: Bool] = [
			try! AbsolutePath("/"): true,
			try! AbsolutePath("/bin/bash"): false,
			try! AbsolutePath("/hl/not/exist"): false,
		]

		for (filePath, expectedResult) in cases {
			// when
			let isExists = filesManager.directoryExists(filePath)

			// then
			XCTAssertEqual(isExists, expectedResult, "For \(filePath)")
		}
	}

	func test_readText() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let expectedFileContent = #function
		let tmpfilePath = try! AbsolutePath("/tmp/\(#function)-\(#line)")
		let encoding: String.Encoding = .utf8
		try expectedFileContent.write(toFile: tmpfilePath.string, atomically: false, encoding: encoding)
		defer {
			try! FileManager.default.removeItem(atPath: tmpfilePath.string)
		}

		// when
		let fileContent = try filesManager.readText(tmpfilePath)

		// then
		XCTAssertEqual(fileContent, expectedFileContent)
	}

	func test_readTextThrowsIfFileNotExist() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let notExistingFilePath = try! AbsolutePath("/\(#function)")

		// when

		// then
		XCTAssertThrowsError(try filesManager.readText(notExistingFilePath))
	}

	func test_writeInExistingDirectory() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let expectedFileContent = #function
		let tmpfilePath = try! AbsolutePath("/tmp/\(#function)-\(#line)")
		defer {
			try! FileManager.default.removeItem(atPath: tmpfilePath.string)
		}

		// when
		try filesManager.write(tmpfilePath, text: expectedFileContent)

		// then
		let fileContent = try String(contentsOfFile: tmpfilePath.string, encoding: .utf8)
		XCTAssertEqual(fileContent, expectedFileContent)
	}

	func test_writeThrowsIfPathNotFilePath() {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let fileContent = #function
		let pathSeparator = "/"
		let tmpfilePath = try! AbsolutePath("/tmp/\(#function)-\(#line)\(pathSeparator)")
		// Path separator at the end of path means that path is not path to file
		XCTAssertTrue(tmpfilePath.hasSuffix(pathSeparator))

		// when
		// then
		let expectedError = FSManager.Errors.notFilePath(tmpfilePath.string)
		XCTAssertThrowsError(
			try filesManager.write(tmpfilePath, text: fileContent),
			error: expectedError
		)
	}

	func test_writeCreatesNotExistingIntermediateDirs() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let expectedFileContent = #function
		let rootDirName = "tmp"
		let fileName = "\(#function)-\(#line)"
		let intermediateDirName = #function
		let tmpfilePath = try! AbsolutePath("/\(rootDirName)/\(intermediateDirName)/\(fileName)")

		let fullIntermediateDirPath = "/\(rootDirName)/\(intermediateDirName)"
		try? realFileManager.removeItem(atPath: fullIntermediateDirPath)
		// Check dir not exists.
		// Nevermind fileExists method path -
		// it also check dirs existance 🤦‍♂️
		var isDir: ObjCBool = false
		XCTAssertFalse(realFileManager.fileExists(
			atPath: fullIntermediateDirPath,
			isDirectory: &isDir
		))

		// when
		try filesManager.write(tmpfilePath, text: expectedFileContent)

		// then
		let fileContent = try String(contentsOfFile: tmpfilePath.string, encoding: .utf8)
		XCTAssertEqual(fileContent, expectedFileContent)
	}

	func test_deleteNotThrowsIfPathNotExist() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let tmpPath = try! AbsolutePath("/tmp/\(#function)-\(#line)")

		// when
		// then
		try filesManager.delete(tmpPath)
	}

	func test_deleteFile() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let fileContent = #function
		let tmpFilePath = try! AbsolutePath("/tmp/\(#function)-\(#line)")
		try fileContent.write(toFile: tmpFilePath.string, atomically: false, encoding: .utf8)
		defer {
			try? realFileManager.removeItem(atPath: tmpFilePath.string)
		}

		// when
		try filesManager.delete(tmpFilePath)

		// then
		var isDir: ObjCBool = false
		XCTAssertFalse(realFileManager.fileExists(
			atPath: tmpFilePath.string,
			isDirectory: &isDir
		))
	}

	func test_deleteLowLevelDir() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let pathSeparator = "/"
		let tmpDirPath = "/tmp/\(#function)-\(#line)\(pathSeparator)"
		try realFileManager.createDirectory(
			atPath: tmpDirPath,
			withIntermediateDirectories: true
		)
		defer {
			try? realFileManager.removeItem(atPath: tmpDirPath)
		}

		// when
		try filesManager.delete(try AbsolutePath(tmpDirPath))

		// then
		var isDir: ObjCBool = false
		XCTAssertFalse(realFileManager.fileExists(
			atPath: tmpDirPath,
			isDirectory: &isDir
		))
	}

	func test_deleteSubdirs() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let intermediateDirName = #function
		let fullIntermediateDirPath = "/tmp/\(intermediateDirName)"
		let fullLowLevelDirPath = "\(fullIntermediateDirPath)/\(#function)-\(#line)"
		try realFileManager.createDirectory(
			atPath: fullLowLevelDirPath,
			withIntermediateDirectories: true
		)
		defer {
			try? realFileManager.removeItem(atPath: fullIntermediateDirPath)
		}

		// when
		try filesManager.delete(try AbsolutePath(fullIntermediateDirPath))

		// then
		var isDir: ObjCBool = false
		XCTAssertFalse(realFileManager.fileExists(
			atPath: fullLowLevelDirPath,
			isDirectory: &isDir
		))
	}

	func test_copyRethrowError() {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: fileManagerMock
		)
		let source = AbsolutePath.random()
		let destination = AbsolutePath.random()
		fileManagerMock.given(.copyItem(
			atPath: .value(source.string),
			toPath: .value(destination.string),
			willThrow: TestError.some
		))

		fileManagerMock.given(.directoryExists(.any, willReturn: true))

		// when
		// then
		let expectedError = TestError.some
		XCTAssertThrowsError(
			try filesManager.copy(source, to: destination),
			error: expectedError
		)
	}

	func test_copyIntoNonExistingDirectoryInvokesMakeDir() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: fileManagerMock
		)
		let source = AbsolutePath.random()
		let destination = AbsolutePath.random()
		fileManagerMock.given(.directoryExists(.any, willReturn: false))
		fileManagerMock.given(.fileExists(.any, willReturn: false))

		// when
		try filesManager.copy(source, to: destination)

		// then
		fileManagerMock.verify(
			.createDirectory(
				atPath: .any,
				withIntermediateDirectories: .value(true),
				attributes: .any
			)
		)
	}

	func test_copyExecutesCreateDirectoryForPathWitoutLastComponentRethrowError() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: fileManagerMock
		)
		let source = AbsolutePath.random()
		let destination = try! AbsolutePath("/test_dir/test_file")

		fileManagerMock.given(.directoryExists(.value("/test_dir"), willReturn: false))
		fileManagerMock.given(.fileExists(.any, willReturn: false))

		// when
		try filesManager.copy(source, to: destination)

		// then
		fileManagerMock.verify(
			.createDirectory(
				atPath: .value("/test_dir"),
				withIntermediateDirectories: .value(true),
				attributes: .any
			)
		)
	}

	func test_findReturnsFullPaths() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: fileManagerMock
		)
		let path = AbsolutePath.random()
		let relativeSubpaths = [
			String(#line),
			String(#line),
			String(#line),
		]

		fileManagerMock.given(.directoryExists(.value(path.string), willReturn: true))
		fileManagerMock.given(.subpathsOfDirectory(atPath: .value(path.string), willReturn: relativeSubpaths))
		// when
		let result = try filesManager.find(path)

		// then
		let expectedPaths = relativeSubpaths.map { "\(path)/\($0)" }
		XCTAssertEqual(Set(result.map { $0.string }), Set(expectedPaths))
	}

	func test_findReturnsPathForDirsAndFiles() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)

		let rootDirPath = try! AbsolutePath("/tmp/\(#function)-\(#line)")
		let firstSubdirPath = "\(rootDirPath)/\(#line)"
		let secondSubdirPath = "\(rootDirPath)/\(#line)"
		let filePath = "\(secondSubdirPath)/\(#line)"

		try realFileManager.createDirectory(atPath: firstSubdirPath, withIntermediateDirectories: true)
		try realFileManager.createDirectory(atPath: secondSubdirPath, withIntermediateDirectories: true)
		try "".write(toFile: filePath, atomically: false, encoding: .utf8)

		// when
		let result = try filesManager.find(rootDirPath)

		// then
		let expectedPaths = [firstSubdirPath, secondSubdirPath, filePath]
		XCTAssertEqual(Set(result.map(\.string)), Set(expectedPaths))
	}

	func test_findRethrowsError() {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: fileManagerMock
		)
		let path = AbsolutePath.random()
		fileManagerMock.given(.directoryExists(.value(path.string), willReturn: true))
		fileManagerMock.given(
			.subpathsOfDirectory(
				atPath: .value(path.string),
				willThrow: TestError.some
			)
		)

		// when
		// then
		let expectedError = TestError.some
		XCTAssertThrowsError(
			try filesManager.find(path),
			error: expectedError
		)
	}

	func test_mkdirRethrowsError() {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: fileManagerMock
		)
		let path = AbsolutePath.random()
		fileManagerMock.given(
			.createDirectory(
				atPath: .any,
				withIntermediateDirectories: .any,
				attributes: .any,
				willThrow: TestError.some
			)
		)

		fileManagerMock.given(.fileExists(.value(path.string), willReturn: false))

		// when
		// then
		let expectedError = TestError.some
		XCTAssertThrowsError(
			try filesManager.mkdir(path),
			error: expectedError
		)
	}

	func test_mkdirInitiateCreationOfIntermediateDirectories() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: fileManagerMock
		)
		let path = AbsolutePath.random()

		fileManagerMock.given(.fileExists(.value(path.string), willReturn: false))

		// when
		_ = try filesManager.mkdir(path)

		// then
		fileManagerMock.verify(
			.createDirectory(
				atPath: .value(path.string),
				withIntermediateDirectories: .value(true),
				attributes: .any
			),
			count: 1
		)
	}

	func test_mkdirIfDirNotExistsDirCreated() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let path = try! AbsolutePath("/tmp/\(#function)-\(#line)")

		defer {
			try? realFileManager.removeItem(atPath: path.string)
		}

		// when
		try filesManager.mkdir(path)

		// then
		assertDirExists(path.string)
	}

	func test_mkdirIfDirExistsDirContinuesExist() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let tmpDirPath = try! AbsolutePath("/tmp/\(#function)-\(#line)")

		try realFileManager.createDirectory(
			atPath: tmpDirPath.string,
			withIntermediateDirectories: true
		)
		defer {
			try? realFileManager.removeItem(atPath: tmpDirPath.string)
		}

		// when
		try filesManager.mkdir(tmpDirPath)

		// then
		assertDirExists(tmpDirPath.string)
	}

	func test_mkdirIfFileExistsByPathThrowsError() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let tmpPath = try! AbsolutePath("/tmp/\(#function)-\(#line)")

		try "".write(toFile: tmpPath.string, atomically: false, encoding: .utf8)

		defer {
			try? realFileManager.removeItem(atPath: tmpPath.string)
		}

		// when
		// then
		let expectedError = FSManager.Errors.pathLeadsToExistingFile(tmpPath.string)
		XCTAssertThrowsError(try filesManager.mkdir(tmpPath), error: expectedError)
	}

	func test_lsDoesNotSearchRecursivly() throws {
		// given
		let filesManager = FSManager(
			logger: loggerMock,
			fileManager: realFileManager
		)
		let rootDir = try AbsolutePath("/tmp/bla/\(#function)-\(#line)")
		let filePath = try rootDir.appending(path: "\(#line).txt")
		let firstLevelDir = try rootDir.appending(path: "\(#line)")
		let secondLevelDir = try firstLevelDir.appending(path: "\(#line)")

		defer {
			try? realFileManager.removeItem(atPath: rootDir.string)
		}

		try filesManager.mkdir(rootDir)
		try filesManager.mkdir(firstLevelDir)
		try filesManager.mkdir(secondLevelDir)
		try filesManager.write(filePath, text: "#line")

		// when
		
		///	Note: `/tmp` is a symlink to `/private/tmp`.
		///
		/// ```bash
		/// ls -@al /tmp
		/// lrwxr-xr-x@ 1 root  wheel  11 Aug 24 14:59 /tmp -> private/tmp
		/// ```
		let lsPaths = try filesManager.ls(rootDir)
			.map { $0.string.deletingPrefix("/private") }

		// then
		let expectedPaths = [filePath, firstLevelDir].map { $0.string }

		XCTAssertEqual(Set(lsPaths), Set(expectedPaths))
	}
}

extension FSManagerTests {
	func assertDirExists(
		_ path: String,
		file: StaticString = #file,
		line: UInt = #line
	) {
		var isDir: ObjCBool = false
		let exists = realFileManager.fileExists(atPath: path, isDirectory: &isDir)

		XCTAssertTrue(exists && isDir.boolValue, file: file, line: line)
	}
}
