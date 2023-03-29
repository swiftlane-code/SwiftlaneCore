//

@testable import SwiftlanePaths

import Foundation
import XCTest

class PathTests: XCTestCase {
	func test_initializedCorrectly() throws {
		XCTAssertEqual(try Path("/foo/bar"), .absolute(try AbsolutePath("/foo/bar")))
		XCTAssertEqual(try Path("foo/bar"), .relative(try RelativePath("foo/bar")))
		XCTAssertThrowsError(try Path(""))
		
		let home = FileManager.default.homeDirectoryForCurrentUser
		XCTAssertEqual(try Path("~/foo/bar"), .absolute(try AbsolutePath(home.path + "/foo/bar")))
	}
	
	func test_relativeThrows() throws {
		XCTAssertThrowsError(try Path("/foo/bar").relative())
		XCTAssertEqual(try Path("foo/bar").relative(), try RelativePath("foo/bar"))
	}
	
	func test_makeAbsolute() throws {
		let absolute = try AbsolutePath("/abs")
		
		XCTAssertEqual(try Path("foo/bar").makeAbsoluteIfIsnt(relativeTo: absolute).string, "/abs/foo/bar")
		XCTAssertEqual(try Path("/foo/bar").makeAbsoluteIfIsnt(relativeTo: absolute).string, "/foo/bar")
		XCTAssertEqual(try Path("bar/").makeAbsoluteIfIsnt(relativeTo: absolute).string, "/abs/bar")
	}
	
	func test_encodedAndDecodedAsString() throws {
		try check_encodedToString(try Path("/foo/bar/car"))
		try check_encodedToString(try Path("/"))
		
		try check_decodedFromString("/foo/bar/car", equalsTo: Path("/foo/bar/car"))
		try check_decodedFromString("/", equalsTo: Path("/"))
		try check_decodedFromString("foo/bar/car", equalsTo: Path("foo/bar/car"))
		try check_decodedFromString("foo", equalsTo: Path("foo"))
		try check_decodedFromString(".", equalsTo: Path("."))
		XCTAssertThrowsError(try check_decodedFromString("", equalsTo: Path("/foo/bar/car")))
	}
	
	func check_encodedToString(_ path: Path) throws {
		// given
		let encoder = JSONEncoder()
		
		// when
		let data = try encoder.encode(path)
		
		// then
		let decoder = JSONDecoder()
		
		let decodedString = try decoder.decode(String.self, from: data)
		XCTAssertEqual(try Path(decodedString), path)
	}
	
	func check_decodedFromString(_ string: String, equalsTo expectedPath: Path) throws {
		// given
		let encoder = JSONEncoder()
		let data = try encoder.encode(string)
		let decoder = JSONDecoder()
		
		// when
		let decodedPath = try decoder.decode(Path.self, from: data)
		
		// then
		XCTAssertEqual(decodedPath, expectedPath)
	}
}
