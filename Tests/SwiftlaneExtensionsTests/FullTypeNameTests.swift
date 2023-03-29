//

@testable import SwiftlaneExtensions

import Foundation
import XCTest

class FullTypeNameTests: XCTestCase {
	func test_fullTypeNameForType() throws {
		XCTAssertEqual(fullTypeName(FullTypeNameTests.self), "SwiftlaneExtensionsTests.FullTypeNameTests")
		XCTAssertEqual(fullTypeName(CollectionExtensionsTests.self), "SwiftlaneExtensionsTests.CollectionExtensionsTests")
		XCTAssertEqual(fullTypeName(1), "Swift.Int")
	}

	func test_fullTypeNameForNSClasses() {
		XCTAssertEqual(fullTypeName(NSArray()), "__NSArray0")
	}
}
