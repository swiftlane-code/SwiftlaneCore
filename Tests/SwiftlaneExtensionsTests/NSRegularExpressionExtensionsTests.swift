//

@testable import SwiftlaneExtensions

import Foundation
import XCTest

class NSRegularExpressionExtensionsTests: XCTestCase {
	func test_matches() {
		struct MatchCase {
			let text: String
			let pattern: String
			let result: [String]
		}

		let cases: [MatchCase] = [
			MatchCase(text: "", pattern: #"\d"#, result: []),
			MatchCase(text: "123", pattern: #"^\d"#, result: ["1"]),
			MatchCase(text: "a1b2d3", pattern: #"^(\D\d)*$"#, result: ["a1b2d3"]),
		]

		for matchCase in cases {
			let expression = try! NSRegularExpression(
				pattern: matchCase.pattern,
				options: .anchorsMatchLines
			)

			let expectedResult = matchCase.result
			let result = expression.matches(in: matchCase.text)
			XCTAssertEqual(result, expectedResult)
		}
	}

	func test_firstMatch() {
		struct MatchCase {
			let text: String
			let pattern: String
			let result: String?
		}

		let cases: [MatchCase] = [
			MatchCase(text: "", pattern: #"\d"#, result: nil),
			MatchCase(text: "123", pattern: #"^\d"#, result: "1"),
			MatchCase(text: "a1b2d3", pattern: #"^(\D\d)*$"#, result: "a1b2d3"),
		]

		for matchCase in cases {
			let expression = try! NSRegularExpression(
				pattern: matchCase.pattern,
				options: .anchorsMatchLines
			)

			let expectedResult = matchCase.result
			let result = expression.firstMatchString(in: matchCase.text)
			XCTAssertEqual(result, expectedResult)
		}
	}

	func test_matchesGroups() {
		struct MatchCase {
			let text: String
			let pattern: String
			let result: [[String]]
		}

		let cases: [MatchCase] = [
			MatchCase(text: "", pattern: #"\d"#, result: []),
			MatchCase(text: "123", pattern: #"^\d"#, result: [["1"]]),
			MatchCase(text: "a1b2d3", pattern: #"^(\D\d)*$"#, result: [["a1b2d3", "d3"]]),
		]

		for matchCase in cases {
			let expression = try! NSRegularExpression(
				pattern: matchCase.pattern,
				options: .anchorsMatchLines
			)

			let expectedResult = matchCase.result
			let result = expression.matchesGroups(in: matchCase.text)
			XCTAssertEqual(result.map { $0.map(String.init) }, expectedResult)
		}
	}
}
