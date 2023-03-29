//

@testable import SwiftlanePaths

import Foundation
import XCTest

class RelativePathTests: XCTestCase {
	func test_initializesCorrectly() throws {
		XCTAssertEqual(try RelativePath(".").string, ".")
		XCTAssertEqual(try RelativePath("foo").string, "foo")
		XCTAssertEqual(try RelativePath("foo/bar").string, "foo/bar")
		XCTAssertThrowsError(try RelativePath("foo/bar\n"))
		XCTAssertThrowsError(try RelativePath(""))
		XCTAssertThrowsError(try RelativePath("/"))
		XCTAssertThrowsError(try RelativePath("/foo"))
		XCTAssertThrowsError(try RelativePath("/foo/bar"))
	}
	
	func test_stringInterpolation() throws {
		XCTAssertEqual("\(try RelativePath("."))", ".")
		XCTAssertEqual("\(try RelativePath("abc"))", "abc")
		XCTAssertEqual("\(try RelativePath("foo/bar"))", "foo/bar")
		XCTAssertEqual("\(try RelativePath("foo/bar.a"))", "foo/bar.a")
		XCTAssertEqual("\(try RelativePath("foo/bar/a/b.c"))", "foo/bar/a/b.c")
	}
	
	func test_compare() throws {
		XCTAssertEqual(try RelativePath("abc"), try RelativePath("abc"))
		XCTAssertNotEqual(try RelativePath("abc"), try RelativePath("abcd"))
	}
	
	func test_appendingRelativePathWorks() throws {
		let path = try RelativePath("foo/bar")
		
		XCTAssertEqual(try path.appending(path: "ab/cd").string, "foo/bar/ab/cd")
		XCTAssertEqual(try path.appending(path: "./ab/cd").string, "foo/bar/./ab/cd")
		XCTAssertEqual(try path.appending(path: "./").string, "foo/bar/.")
		XCTAssertThrowsError(try path.appending(path: "/ab/cd").string)
		XCTAssertThrowsError(try path.appending(path: "/.").string)
	}
	
	func test_utilityExtensionsAreWorkingCorrectly() throws {
		XCTAssertEqual(try RelativePath("foo/bar").deletingExtension.string, "foo/bar")
		XCTAssertEqual(try RelativePath("foo/bar.a").deletingExtension.string, "foo/bar")
		XCTAssertEqual(try RelativePath("foo/bar.a.b").deletingExtension.string, "foo/bar.a")
		
		XCTAssertEqual(try RelativePath("foo/car/bar").deletingLastComponent().string, "foo/car")
		XCTAssertEqual(try RelativePath("foo/car/bar.a").deletingLastComponent().string, "foo/car")
		XCTAssertEqual(try RelativePath("foo/car/bar.a.b").deletingLastComponent().string, "foo/car")
		
		XCTAssertEqual(try RelativePath("bar").hasSuffix("bar"), true)
		XCTAssertEqual(try RelativePath("bar").hasSuffix("r"), true)
		XCTAssertEqual(try RelativePath("bar").hasSuffix("a"), false)
		XCTAssertEqual(try RelativePath("bara").hasSuffix("a"), true)
		XCTAssertEqual(try RelativePath(".bar.a").hasSuffix(".b"), false)
		XCTAssertEqual(try RelativePath("bar.a.b").hasSuffix(".b"), true)
		
		XCTAssertEqual(try RelativePath("foo/car/bar.a.b").lastComponent.string, "bar.a.b")
		XCTAssertEqual(try RelativePath("foo/car/bar.a.b").lastComponent.string, "bar.a.b")
		
		let relativePath = try RelativePath("bar")
		XCTAssertThrowsError(try relativePath.deletingLastComponent())
	}
	
	func test_normalized() throws {
		XCTAssertEqual(try RelativePath("././foo/./bar/dropped/..//.").normalized().string, "foo/bar")
		
		XCTAssertEqual(try RelativePath("foo/bar/...").normalized().string, "foo/bar/...")
		XCTAssertEqual(try RelativePath("foo/bar/.../").normalized().string, "foo/bar/...")
		XCTAssertEqual(try RelativePath("foo/bar/.../.").normalized().string, "foo/bar/...")
		XCTAssertEqual(try RelativePath("foo/bar/.../a").normalized().string, "foo/bar/.../a")
		XCTAssertEqual(try RelativePath("foo/bar/.../a").normalized().string, "foo/bar/.../a")
		XCTAssertEqual(try RelativePath("foo/bar/..././a").normalized().string, "foo/bar/.../a")
		
		XCTAssertEqual(try RelativePath("foo/./bar").normalized().string, "foo/bar")
		XCTAssertEqual(try RelativePath("foo/../bar.a").normalized().string, "bar.a")
		XCTAssertEqual(try RelativePath("foo/bar.a.b").normalized().string, "foo/bar.a.b")
		
		XCTAssertEqual(try RelativePath("foo/.///./bar").normalized().string, "foo/bar")
		XCTAssertEqual(try RelativePath("foo/bar/./").normalized().string, "foo/bar")
		XCTAssertEqual(try RelativePath("foo/bar/./.").normalized().string, "foo/bar")
		XCTAssertEqual(try RelativePath("foo/bar//").normalized().string, "foo/bar")
		XCTAssertEqual(try RelativePath("foo/bar//.").normalized().string, "foo/bar")
		
		XCTAssertEqual(try RelativePath("bar/a/b/./..").normalized().string, "bar/a")
		
		XCTAssertThrowsError(try RelativePath("bar/././..").normalized())
		XCTAssertThrowsError(try RelativePath(".").normalized())
		XCTAssertThrowsError(try RelativePath("./././").normalized())
		XCTAssertThrowsError(try RelativePath("bar/../..").normalized())
		XCTAssertThrowsError(try RelativePath("..").normalized())
	}
}
