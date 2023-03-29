//

@testable import SwiftlaneExtensions

import Foundation
import SwiftyMocky
import XCTest

class OptionalExtensionsTests: XCTestCase {
	func test_unwrapReturnValue() throws {
		// given
		let value: String? = #function

		// when
		let unwrapped = try value.unwrap()

		// then
		let expected = value!
		XCTAssertEqual(unwrapped, expected)
	}

	func test_unwrapThrowsErrorIfValueNil() throws {
		// given
		let value: String? = nil
		let file = #file
		let line: UInt = #line

		// when

		// then
		let expected = OptionalError.optionalIsNil(description: nil, file: file, line: line)
		XCTAssertThrowsError(
			try value.unwrap(file: file, line: line),
			error: expected
		)
	}
}
