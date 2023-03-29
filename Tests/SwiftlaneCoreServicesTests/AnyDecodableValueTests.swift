//

import XCTest

@testable import SwiftlaneCoreServices

class AnyDecodableValueTests: XCTestCase {
    func testDifferentDecodableValues() throws {
        check(
            parse: #"0"#,
            equals: .int(0)
        )
        check(
            parse: #""0""#,
            equals: .string("0")
        )
        check(
            parse: #""1""#,
            equals: .string("1")
        )
        check(
            parse: #""3.14""#,
            equals: .string("3.14")
        )
        check(
            parse: #""true""#,
            equals: .string("true")
        )
        check(
            parse: #""false""#,
            equals: .string("false")
        )
        check(
            parse: #"2"#,
            equals: .int(2)
        )
        check(
            parse: #"3.14"#,
            equals: .double(3.14)
        )
        check(
            parse: #"1"#,
            equals: .int(1)
        )
        check(
            parse: #"true"#,
            equals: .bool(true)
        )
        check(
            parse: #"false"#,
            equals: .bool(false)
        )
        check(
            parse: #"null"#,
            equals: .null
        )
        check(
            parse: #"{"1":"2"}"#,
			equals: .dictionary(["1":.string("2")])
        )
		check(
			parse: #"[true]"#,
			equals: .array([.bool(true)])
		)
		check(
			parse: #"[true, "ok"]"#,
			equals: .array([.bool(true), .string("ok")])
		)
    }
	
	func test_decodingOfCollections() throws {
		check(
			parse: #"""
			{
				"1":"one",
				"2":"two",
				"3":true
			}
			"""#,
			equals: .dictionary([
				"1": .string("one"),
				"2": .string("two"),
				"3": .bool(true),
			])
		)
		
		check(
			parse: #"""
			{
				"1":"one",
				"2":"two",
				"3": {
					"arr":[1,2]
				}
			}
			"""#,
			equals: .dictionary([
				"1": .string("one"),
				"2": .string("two"),
				"3": .dictionary([
					"arr": .array([.int(1), .int(2)])
				]),
			])
		)
	}

    private func check(
        parse string: String,
        equals expectedValue: AnyDecodableValue,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        // given
        guard let data = string.data(using: .utf8) else {
            return XCTFail("Unable to make data from \"\(string)\"", file: file, line: line)
        }

        // when
		do {
			let value = try JSONDecoder().decode(AnyDecodableValue.self, from: data)
			
			// then
			XCTAssertEqual(value, expectedValue, file: file, line: line)
		} catch {
			debugPrint(error)
			XCTFail("Unable to decode value from \"\(string)\"", file: file, line: line)
		}
    }
}
