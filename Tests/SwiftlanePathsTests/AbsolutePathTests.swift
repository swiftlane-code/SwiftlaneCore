//

@testable import SwiftlanePaths

import Foundation
import XCTest

class AbsolutePathTests: XCTestCase {
	func test_initializesCorrectly() throws {
		XCTAssertEqual(try AbsolutePath("/").string, "/")
		XCTAssertEqual(try AbsolutePath("/foo").string, "/foo")
		XCTAssertEqual(try AbsolutePath("/foo/bar").string, "/foo/bar")
		XCTAssertThrowsError(try AbsolutePath("/foo/bar\n"))
		XCTAssertThrowsError(try AbsolutePath(""))
		XCTAssertThrowsError(try AbsolutePath("foo"))
		XCTAssertThrowsError(try AbsolutePath("foo/bar"))
		
		let home = FileManager.default.homeDirectoryForCurrentUser
		XCTAssertEqual(try AbsolutePath("~/foo/bar").string, home.path + "/foo/bar")
	}
	
	func test_stringInterpolation() throws {
		XCTAssertEqual("\(try AbsolutePath("/abc"))", "/abc")
		XCTAssertEqual("\(try AbsolutePath("/foo/bar"))", "/foo/bar")
		XCTAssertEqual("\(try AbsolutePath("/foo/bar.a"))", "/foo/bar.a")
		XCTAssertEqual("\(try AbsolutePath("/foo/bar/a/b.c"))", "/foo/bar/a/b.c")
	}
	
	func test_compare() throws {
		XCTAssertEqual(try AbsolutePath("/abc"), try AbsolutePath("/abc"))
		XCTAssertNotEqual(try AbsolutePath("/abc"), try AbsolutePath("/abcd"))
	}
	
	func test_appendingRelativePathWorks() throws {
		let path = try AbsolutePath("/foo/bar")
		
		XCTAssertEqual(try path.appending(path: "ab/cd").string, "/foo/bar/ab/cd")
		XCTAssertEqual(try path.appending(path: "./ab/cd").string, "/foo/bar/./ab/cd")
		XCTAssertEqual(try path.appending(path: "./").string, "/foo/bar/.")
		XCTAssertThrowsError(try path.appending(path: "/ab/cd").string)
		XCTAssertThrowsError(try path.appending(path: "/.").string)
	}
	
	func test_utilityExtensionsAreWorkingCorrectly() throws {
		XCTAssertEqual(try AbsolutePath("/foo/bar").deletingExtension.string, "/foo/bar")
		XCTAssertEqual(try AbsolutePath("/foo/bar.a").deletingExtension.string, "/foo/bar")
		XCTAssertEqual(try AbsolutePath("/foo/bar.a.b").deletingExtension.string, "/foo/bar.a")
		
		XCTAssertEqual(try AbsolutePath("/foo/car/bar").deletingLastComponent.string, "/foo/car")
		XCTAssertEqual(try AbsolutePath("/foo/car/bar.a").deletingLastComponent.string, "/foo/car")
		XCTAssertEqual(try AbsolutePath("/foo/car/bar.a.b").deletingLastComponent.string, "/foo/car")
		
		XCTAssertEqual(try AbsolutePath("/bar").deletingLastComponent.string, "/")
		XCTAssertEqual(try AbsolutePath("/bar.a").deletingLastComponent.string, "/")
		XCTAssertEqual(try AbsolutePath("/bar.a.b").deletingLastComponent.string, "/")
		
		XCTAssertEqual(try AbsolutePath("/bar").hasSuffix("/bar"), true)
		XCTAssertEqual(try AbsolutePath("/bar").hasSuffix("r"), true)
		XCTAssertEqual(try AbsolutePath("/bar").hasSuffix("a"), false)
		XCTAssertEqual(try AbsolutePath("/bara").hasSuffix("a"), true)
		XCTAssertEqual(try AbsolutePath("/.bar.a").hasSuffix(".b"), false)
		XCTAssertEqual(try AbsolutePath("/bar.a.b").hasSuffix(".b"), true)
		
		XCTAssertEqual(try AbsolutePath("/foo/car/bar.a.b").lastComponent.string, "bar.a.b")
		XCTAssertEqual(try AbsolutePath("/foo/car/bar.a.b").lastComponent.string, "bar.a.b")
	}
	
	func test_relativeTo() throws {
		XCTAssertEqual(try makeRelativePath(basePath: "/base/path", path: "/base/path/foo"), "foo")
		XCTAssertEqual(try makeRelativePath(basePath: "/base/path", path: "/base/path/foo/bar"), "foo/bar")
		XCTAssertEqual(try makeRelativePath(basePath: "/base/path", path: "/base/path/base/path"), "base/path")
		XCTAssertEqual(try makeRelativePath(basePath: "/base/path", path: "/base/path/foo/bar/"), "foo/bar/")
		XCTAssertEqual(try makeRelativePath(basePath: "/base/path", path: "/base/path/."), ".")
		
		XCTAssertEqual(try makeRelativePath(basePath: "/base/path/", path: "/base/path/foo"), "foo")
		XCTAssertEqual(try makeRelativePath(basePath: "/base/path/", path: "/base/path/foo/bar"), "foo/bar")
		XCTAssertEqual(try makeRelativePath(basePath: "/base/path/", path: "/base/path/foo/bar/"), "foo/bar/")
		XCTAssertEqual(try makeRelativePath(basePath: "/base/path/", path: "/base/path/."), ".")
		
		XCTAssertThrowsError(try makeRelativePath(basePath: "/base/path_1", path: "/base/path/foo/bar"))
		XCTAssertThrowsError(try makeRelativePath(basePath: "/base", path: "/base"))
		XCTAssertThrowsError(try makeRelativePath(basePath: "/base/", path: "/base"))
	}
	
	func test_encodedAndDecodedAsString() throws {
		try check_encodedToString(try AbsolutePath("/foo/bar/car"))
		try check_encodedToString(try AbsolutePath("/"))
		
		try check_decodedFromString("/foo/bar/car")
		try check_decodedFromString("/")
		XCTAssertThrowsError(try check_decodedFromString("foo/bar/car"))
		XCTAssertThrowsError(try check_decodedFromString(""))
	}
	
	func test_normalized() throws {
		XCTAssertEqual(try AbsolutePath("//././foo/./bar/dropped/..//.").normalized().string, "/foo/bar")
		
		XCTAssertEqual(try AbsolutePath("/foo/bar/...").normalized().string, "/foo/bar/...")
		XCTAssertEqual(try AbsolutePath("/foo/bar/.../").normalized().string, "/foo/bar/...")
		XCTAssertEqual(try AbsolutePath("/foo/bar/.../.").normalized().string, "/foo/bar/...")
		XCTAssertEqual(try AbsolutePath("/foo/bar/.../a").normalized().string, "/foo/bar/.../a")
		XCTAssertEqual(try AbsolutePath("/foo/bar/.../a").normalized().string, "/foo/bar/.../a")
		XCTAssertEqual(try AbsolutePath("/foo/bar/..././a").normalized().string, "/foo/bar/.../a")
		
		XCTAssertEqual(try AbsolutePath("/foo/./bar").normalized().string, "/foo/bar")
		XCTAssertEqual(try AbsolutePath("/foo/../bar.a").normalized().string, "/bar.a")
		XCTAssertEqual(try AbsolutePath("/foo/bar.a.b").normalized().string, "/foo/bar.a.b")
		
		XCTAssertEqual(try AbsolutePath("/foo/.///./bar").normalized().string, "/foo/bar")
		XCTAssertEqual(try AbsolutePath("/foo/bar/./").normalized().string, "/foo/bar")
		XCTAssertEqual(try AbsolutePath("/foo/bar/./.").normalized().string, "/foo/bar")
		XCTAssertEqual(try AbsolutePath("/foo/bar//").normalized().string, "/foo/bar")
		XCTAssertEqual(try AbsolutePath("/foo/bar//.").normalized().string, "/foo/bar")
		
		XCTAssertEqual(try AbsolutePath("/bar/././..").normalized().string, "/")
		XCTAssertEqual(try AbsolutePath("/bar/a/b/./..").normalized().string, "/bar/a")
		XCTAssertEqual(try AbsolutePath("/.").normalized().string, "/")
		XCTAssertEqual(try AbsolutePath("/").normalized().string, "/")
		XCTAssertEqual(try AbsolutePath("/./././").normalized().string, "/")
		
		XCTAssertThrowsError(try AbsolutePath("/bar/../..").normalized())
		XCTAssertThrowsError(try AbsolutePath("/..").normalized())
	}
	
	func check_encodedToString(_ path: AbsolutePath) throws {
		// given
		let encoder = JSONEncoder()
		
		// when
		let data = try encoder.encode(path)
		
		// then
		let decoder = JSONDecoder()
		
		let decodedString = try decoder.decode(String.self, from: data)
		XCTAssertEqual(decodedString, path.string)
	}
	
	func check_decodedFromString(_ string: String) throws {
		// given
		let encoder = JSONEncoder()
		let data = try encoder.encode(string)
		let decoder = JSONDecoder()
		
		// when
		let decodedPath = try decoder.decode(AbsolutePath.self, from: data)
		
		// then
		XCTAssertEqual(decodedPath.string, string)
	}
	
	func makeRelativePath(basePath: String, path: String) throws -> String {
		let base = try AbsolutePath(basePath)
		let inner = try AbsolutePath(path)
		return try inner.relative(to: base).string
	}
}
