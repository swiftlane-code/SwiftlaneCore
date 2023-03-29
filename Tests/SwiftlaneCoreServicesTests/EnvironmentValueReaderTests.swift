//

@testable import SwiftlaneCoreServices

import Foundation
import SwiftlaneCoreMocks
import SwiftyMocky
import XCTest

class EnvironmentValueReaderTests: XCTestCase {
	var reader: EnvironmentValueReader!
	
	var processInfo: ProcessInfoProtocolMock!
	
	override func setUp() {
		super.setUp()

		processInfo = .init()
		
		reader = EnvironmentValueReader(processInfo: processInfo)
	}
	
	func test_readsTypedValues() throws {
		// given
		processInfo.given(.environment(getter: [
			"UNITTEST_STRING_VAR": "SOME_STRING",
			"UNITTEST_INT_VAR": "12345",
			"UNITTEST_DOUBLE_VAR": "3.14",
			"UNITTEST_BOOL_VAR_true": "true",
			"UNITTEST_BOOL_VAR_false": "false",
			"UNITTEST_BOOL_VAR_1": "true",
			"UNITTEST_BOOL_VAR_0": "false",
			"UNITTEST_BOOL_VAR_TRUE": "true",
			"UNITTEST_BOOL_VAR_FALSE": "false",
			"UNITTEST_BOOL_VAR_YES": "true",
			"UNITTEST_BOOL_VAR_NO": "false",
		]))
		
		// when & then
		XCTAssertEqual(try reader.string("UNITTEST_STRING_VAR"), "SOME_STRING")
		XCTAssertEqual(try reader.int("UNITTEST_INT_VAR"), 12345)
		XCTAssertEqual(try reader.double("UNITTEST_DOUBLE_VAR"), 3.14)
		XCTAssertEqual(try reader.bool("UNITTEST_BOOL_VAR_true"), true)
		XCTAssertEqual(try reader.bool("UNITTEST_BOOL_VAR_false"), false)
		XCTAssertEqual(try reader.bool("UNITTEST_BOOL_VAR_1"), true)
		XCTAssertEqual(try reader.bool("UNITTEST_BOOL_VAR_0"), false)
		XCTAssertEqual(try reader.bool("UNITTEST_BOOL_VAR_TRUE"), true)
		XCTAssertEqual(try reader.bool("UNITTEST_BOOL_VAR_FALSE"), false)
		XCTAssertEqual(try reader.bool("UNITTEST_BOOL_VAR_YES"), true)
		XCTAssertEqual(try reader.bool("UNITTEST_BOOL_VAR_NO"), false)
	}
	
	func test_missingVariableThrowsError() {
		// given
		let name = UUID().uuidString
		
		processInfo.given(.environment(getter: [:]))
		
		// when & then
		XCTAssertThrowsError(
			try reader.string(name),
			of: EnvironmentValueReader.Errors.self
		)
	}
}
