//

@testable import SwiftlaneCoreServices

import Foundation
import XCTest

private func XCTAssertThrowsError<T, E: Equatable>(
	_ closure: @escaping @autoclosure () throws -> T,
	expectedError: E,
	file: StaticString = #file,
	line: UInt = #line
) {
	XCTAssertThrowsError(try closure(), file: file, line: line) { error in
		XCTAssertEqual(error as? E, expectedError, file: file, line: line)
	}
}

class SemVerTests: XCTestCase {
	func test_initFromString() throws {
		XCTAssertEqual(try SemVer(parseFrom: "1.2.3"), SemVer(1, 2, 3))
		XCTAssertEqual(try SemVer(parseFrom: "0.1.2"), SemVer(0, 1, 2))
		XCTAssertEqual(try SemVer(parseFrom: "0.0.1"), SemVer(0, 0, 1))
		XCTAssertEqual(try SemVer(parseFrom: "0.0.0"), SemVer(0, 0, 0))
		XCTAssertEqual(try SemVer(parseFrom: "0"), SemVer(0, 0, 0))
		XCTAssertEqual(try SemVer(parseFrom: "1"), SemVer(1, 0, 0))
		XCTAssertEqual(try SemVer(parseFrom: "1.2"), SemVer(1, 2, 0))
		XCTAssertEqual(try SemVer(parseFrom: "0.2"), SemVer(0, 2, 0))
	}
	
	func test_initFromBadString() throws {
		XCTAssertThrowsError(try SemVer(parseFrom: "."))
		XCTAssertThrowsError(try SemVer(parseFrom: ".3"))
		XCTAssertThrowsError(try SemVer(parseFrom: "1."))
		XCTAssertThrowsError(try SemVer(parseFrom: "1.2."))
		XCTAssertThrowsError(try SemVer(parseFrom: "3.5.6."))
		XCTAssertThrowsError(try SemVer(parseFrom: "3.5.6.7"))
		XCTAssertThrowsError(try SemVer(parseFrom: "a"))
		XCTAssertThrowsError(try SemVer(parseFrom: "a.b"))
		XCTAssertThrowsError(try SemVer(parseFrom: "a.b.c"))
		XCTAssertThrowsError(try SemVer(parseFrom: "v1.0"))
	}
	
	func test_stringRepresentation() throws {
		XCTAssertEqual(SemVer(0, 0, 0).string(format: .full), "0.0.0")
		XCTAssertEqual(SemVer(1, 0, 0).string(format: .full), "1.0.0")
		XCTAssertEqual(SemVer(1, 2, 0).string(format: .full), "1.2.0")
		XCTAssertEqual(SemVer(1, 2, 3).string(format: .full), "1.2.3")
		XCTAssertEqual(SemVer(0, 1, 2).string(format: .full), "0.1.2")
		XCTAssertEqual(SemVer(0, 0, 1).string(format: .full), "0.0.1")
		
		XCTAssertEqual(SemVer(0, 0, 0).string(format: .atLeastMajorMinor), "0.0")
		XCTAssertEqual(SemVer(1, 0, 0).string(format: .atLeastMajorMinor), "1.0")
		XCTAssertEqual(SemVer(1, 2, 0).string(format: .atLeastMajorMinor), "1.2")
		XCTAssertEqual(SemVer(1, 2, 3).string(format: .atLeastMajorMinor), "1.2.3")
		XCTAssertEqual(SemVer(0, 1, 2).string(format: .atLeastMajorMinor), "0.1.2")
		XCTAssertEqual(SemVer(0, 0, 1).string(format: .atLeastMajorMinor), "0.0.1")
		
		XCTAssertEqual(SemVer(0, 0, 0).string(format: .atLeastMajor), "0")
		XCTAssertEqual(SemVer(1, 0, 0).string(format: .atLeastMajor), "1")
		XCTAssertEqual(SemVer(1, 2, 0).string(format: .atLeastMajor), "1.2")
		XCTAssertEqual(SemVer(1, 2, 3).string(format: .atLeastMajor), "1.2.3")
		XCTAssertEqual(SemVer(0, 1, 2).string(format: .atLeastMajor), "0.1.2")
		XCTAssertEqual(SemVer(0, 0, 1).string(format: .atLeastMajor), "0.0.1")
	}
	
	func test_comparing() throws {
		XCTAssertEqual(try SemVer(parseFrom: "0.0.0") < SemVer(parseFrom: "0.0.0"), false)
		XCTAssertEqual(try SemVer(parseFrom: "0.0.1") < SemVer(parseFrom: "0.0.0"), false)
		XCTAssertEqual(try SemVer(parseFrom: "0.1.0") < SemVer(parseFrom: "0.0.0"), false)
		XCTAssertEqual(try SemVer(parseFrom: "0.1.1") < SemVer(parseFrom: "0.0.0"), false)
		XCTAssertEqual(try SemVer(parseFrom: "1.1.1") < SemVer(parseFrom: "0.0.0"), false)
		XCTAssertEqual(try SemVer(parseFrom: "1.1.1") < SemVer(parseFrom: "0.0.1"), false)
		XCTAssertEqual(try SemVer(parseFrom: "1.1.1") < SemVer(parseFrom: "0.1.1"), false)
		XCTAssertEqual(try SemVer(parseFrom: "1.1.1") < SemVer(parseFrom: "1.1.1"), false)
		XCTAssertEqual(try SemVer(parseFrom: "0.0.0") < SemVer(parseFrom: "0.0.1"), true)
		XCTAssertEqual(try SemVer(parseFrom: "0.0.0") < SemVer(parseFrom: "0.1.0"), true)
		XCTAssertEqual(try SemVer(parseFrom: "0.0.0") < SemVer(parseFrom: "0.1.1"), true)
		XCTAssertEqual(try SemVer(parseFrom: "0.0.0") < SemVer(parseFrom: "1.1.1"), true)
		XCTAssertEqual(try SemVer(parseFrom: "1.1.2") < SemVer(parseFrom: "1.1.1"), false)
		XCTAssertEqual(try SemVer(parseFrom: "1.2.1") < SemVer(parseFrom: "1.1.1"), false)
		XCTAssertEqual(try SemVer(parseFrom: "2.1.1") < SemVer(parseFrom: "1.1.1"), false)
	}
}
