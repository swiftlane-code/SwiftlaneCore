//

@testable import SwiftlaneExtensions

import Foundation
import XCTest

class SetExtensionsTests: XCTestCase {
	func test_anotherSetInsertion() {
		// given
		struct TestCase {
			let first: Set<Int>
			let second: Set<Int>
			let expected: Set<Int>
		}

		let cases: [TestCase] = [
			TestCase(
				first: Set(),
				second: Set(),
				expected: Set()
			),
			TestCase(
				first: Set([1, 2]),
				second: Set([3]),
				expected: Set([1, 2, 3])
			),
		]

		for insertCase in cases {
			var result = insertCase.first
			result.insert(all: insertCase.second)

			XCTAssertEqual(result, insertCase.expected)
		}

		// when

		// then
	}
}
