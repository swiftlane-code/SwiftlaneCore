//

@testable import SwiftlaneExtensions

import Foundation
import SwiftlaneUnitTestTools
import XCTest

class ResultExtensionsTests: XCTestCase {
	func test_errorForFailureCaseUnwrapsError() {
		// given
		let givenError = TestError.some
		let result = Result<Any, TestError>.failure(givenError)

		// when
		let error = result.error

		// then
		let expectingError = givenError
		XCTAssertEqual(error, expectingError)
	}

	func test_errorForSuccessCaseIsNil() {
		// given
		let result = Result<Any, TestError>.success(#line)

		// when
		let error = result.error

		// then
		XCTAssertNil(error)
	}
}
