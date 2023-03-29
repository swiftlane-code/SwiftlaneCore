//

@testable import SwiftlaneCoreServices

import Foundation
import SwiftlaneCoreMocks
import SwiftlaneUnitTestTools
import SwiftyMocky
import XCTest

class TimeMeasurerTests: XCTestCase {
	var formatter: DateComponentsFormattingMock!
	var logger: LoggingMock!

	let desc = #function
	let file = #file
	let line: UInt = #line

	override func setUp() {
		super.setUp()

		formatter = DateComponentsFormattingMock()
		logger = LoggingMock()
		
		logger.given(.logLevel(getter: .verbose))
	}

	func test_meatureReportsdesAtStart() {
		// given
		let measurer = TimeMeasurer(formatter: formatter, logger: logger)

		// when
		measurer.measure(description: desc, {
			1 + 1
		}, file: file, line: line)

		// then
		logger.verify(
			.uncheckedLog(
				.value(.important),
				.value("\(desc)..."),
				.any,
				terminator: .any,
				file: .value(file),
				line: .value(line)
			),
			count: 1
		)
	}

	func test_meatureReportsElapsedTime() {
		// given
		formatter.given(.string(from: .any, to: .any, willReturn: "formated time interval"))
		let measurer = TimeMeasurer(formatter: formatter, logger: logger)

		// when
		measurer.measure(description: desc, {
			1 + 1
		}, file: file, line: line)

		// then
		logger.verify(
			.uncheckedLog(
				.value(.important),
				.value("\(desc) took formated time interval"),
				.any,
				terminator: .any,
				file: .value(file),
				line: .value(line)
			),
			count: 1
		)
	}

	func test_meatureReportsElapsedTimeIfIntervalFormattingFailures() {
		// given
		formatter.given(.string(from: .any, to: .any, willReturn: nil))
		let measurer = TimeMeasurer(formatter: formatter, logger: logger)

		// when
		measurer.measure(description: desc, {
			1 + 1
		}, file: file, line: line)

		// then
		logger.verify(
			.uncheckedLog(
				.value(.important),
				.value("\(desc) took nil"),
				.any,
				terminator: .any,
				file: .value(file),
				line: .value(line)
			),
			count: 1
		)
	}

	func test_meatureReportsReturnsClosureValue() {
		// given
		let measurer = TimeMeasurer(formatter: formatter, logger: logger)

		let expectedRerurnValue = #line

		// when
		let returnValue = measurer.measure(description: desc, {
			expectedRerurnValue
		}, file: file, line: line)

		// then
		XCTAssertEqual(returnValue, expectedRerurnValue)
	}

	func test_meatureReportsRethrowsClosureException() {
		// given
		let measurer = TimeMeasurer(formatter: formatter, logger: logger)

		// when

		// then
		XCTAssertThrowsError(
			try measurer.measure(description: desc, {
				throw TestError.some
			}, file: file, line: line),
			error: TestError.some
		)
	}
}
