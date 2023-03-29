//

@testable import SwiftlaneExtensions

import Foundation
import XCTest

class StringExtensionsTests: XCTestCase {
	func test_lastPathComponent() {
		// given
		let cases = [
			"": "",
			"bla": "bla",
			"bla/foo": "foo",
			"/some/any/another": "another",
			"bla.ext": "bla.ext",
			"bla/foo.txt": "foo.txt",
			"/some/any/another.ext": "another.ext",
			"./": ".", // Wonderful!
			"./bla": "bla",
			"./bla/foo": "foo",
			"./bla.ext": "bla.ext",
			"./bla/foo.txt": "foo.txt",
			"~/": "~", // Wonderful!
			"~/bla": "bla",
			"~/bla/foo": "foo",
			"~/bla.ext": "bla.ext",
			"~/bla/foo.txt": "foo.txt",
		]

		for (path, expected) in cases {
			// when
			let result = path.lastPathComponent

			// then
			XCTAssertEqual(result, expected, "For \"\(path)\"")
		}
	}

	func test_deletingPathExtension() {
		// given
		let cases = [
			"": "",
			"bla": "bla",
			"bla/foo": "bla/foo",
			"/some/any/another": "/some/any/another",
			"bla.ext": "bla",
			"bla/foo.txt": "bla/foo",
			"/some/any/another.ext": "/some/any/another",
			"./": ".", // Wonderful!
			"./bla": "./bla",
			"./bla/foo": "./bla/foo",
			"./bla.ext": "./bla",
			"./bla/foo.txt": "./bla/foo",
			"~/": "~", // Wonderful!
			"~/bla": "~/bla",
			"~/bla/foo": "~/bla/foo",
			"~/bla.ext": "~/bla",
			"~/bla/foo.txt": "~/bla/foo",
		]

		for (path, expected) in cases {
			// when
			let result = path.deletingPathExtension

			// then
			XCTAssertEqual(result, expected, "For \"\(path)\"")
		}
	}

	func test_appending() {
		// given
		struct TestCase: Hashable {
			let string: String
			let appendix: String
			let expected: String
		}

		let cases: [TestCase] = [
			TestCase(string: "", appendix: "", expected: ""),
			TestCase(string: "", appendix: "_", expected: "_"),
			TestCase(string: "!", appendix: "_", expected: "!/_"),
			TestCase(string: ".", appendix: "_", expected: "./_"),
			TestCase(string: "./", appendix: "_", expected: "./_"),
			TestCase(string: "/", appendix: "_", expected: "/_"),
			TestCase(string: "/bla", appendix: "ququ", expected: "/bla/ququ"),
			TestCase(string: "~/bla", appendix: "ququ", expected: "~/bla/ququ"),
			TestCase(string: "/bla.txt", appendix: "qwerty", expected: "/bla.txt/qwerty"),
			TestCase(string: "/bla", appendix: "qwerty.ext", expected: "/bla/qwerty.ext"),
		]

		for testCase in cases {
			// when
			let result = testCase.string.appendingPathComponent(testCase.appendix)

			// then
			XCTAssertEqual(result, testCase.expected)
		}
	}

	func test_deletingLastPathComponent() {
		// given
		let cases = [
			"": "",
			"bla": "",
			"bla/foo": "bla",
			"/some/any/another": "/some/any",
			"bla.ext": "",
			"bla/foo.txt": "bla",
			"/some/any/another.ext": "/some/any",
			"./": "", // Wonderful!
			"./bla": ".",
			"./bla/foo": "./bla",
			"./bla.ext": ".",
			"./bla/foo.txt": "./bla",
			"~/": "", // Wonderful!
			"~/bla": "~",
			"~/bla/foo": "~/bla",
			"~/bla.ext": "~",
			"~/bla/foo.txt": "~/bla",
		]

		for (path, expected) in cases {
			// when
			let result = path.deletingLastPathComponent

			// then
			XCTAssertEqual(result, expected, "For \"\(path)\"")
		}
	}

	func test_addPrefixToAllLines() {
		// given
		struct TestCase: Hashable {
			let lines: String
			let prefix: String
			let expected: String
		}

		let cases: [TestCase] = [
			TestCase(lines: "", prefix: "", expected: ""),
			TestCase(lines: "", prefix: "_", expected: "_"),
			TestCase(lines: "!", prefix: "_", expected: "_!"),
			TestCase(lines: "\n", prefix: "_", expected: "_\n_"), // This is feature
			TestCase(lines: "\n\n", prefix: "_", expected: "_\n_\n_"), // This is feature
		]

		for testCase in cases {
			// when
			let result = testCase.lines.addPrefixToAllLines(testCase.prefix)

			// then
			XCTAssertEqual(result, testCase.expected)
		}
	}
}
