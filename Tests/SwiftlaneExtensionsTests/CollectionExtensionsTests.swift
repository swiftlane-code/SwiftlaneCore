//

@testable import SwiftlaneExtensions

import Foundation
import XCTest

class CollectionExtensionsTests: XCTestCase {
	func test_safeReturnNilIfIndexNotExist() {
		// given
		let someCollection: [String] = []
		let notExistingIndex = #line

		// when
		let element = someCollection[safe: notExistingIndex]

		// then
		XCTAssertNil(element)
	}
	
	func test_sortedBy_nonzeroBitCount() {
		XCTAssertEqual(
			(1...9).sorted(by: \.nonzeroBitCount),
			[1, 2, 4, 8, 3, 5, 6, 9, 7]
		)
	}
	
	func test_sortedBy_indicesDict() {
		let indices = [
			1: 2,
			2: 3,
			3: 1,
			4: 4,
			5: 0,
		]
		XCTAssertEqual(
			(1...5).sorted(by: { indices[$0]! }),
			[5, 3, 1, 2, 4]
		)
		XCTAssertEqual(
			(1...5).sorted(by: { indices[$0]! }, comparator: >),
			[4, 2, 1, 3, 5]
		)
	}
}
