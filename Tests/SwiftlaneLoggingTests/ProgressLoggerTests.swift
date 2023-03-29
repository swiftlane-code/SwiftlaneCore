//

@testable import SwiftlaneLogging

import Foundation
import PerfectRainbow
import SwiftlaneCoreMocks
import SwiftlaneUnitTestTools
import XCTest

class ProgressLoggerTests: XCTestCase {
	var winsizeReader: WinSizeReadingMock!

	override static func setUp() {
		super.setUp()
		
		Rainbow.outputTarget = .unknown
	}
	
	override func setUp() {
		super.setUp()

		winsizeReader = WinSizeReadingMock()
	}
	
	func check(
		progress: Double,
		description: String,
		winWidth: UInt16?,
		expectedResult: String,
		file: StaticString = #file,
		line: UInt = #line
	) {
		// given
		var printed: String?
		func print(_ string: String, terminator: String) {
			printed = string + terminator
		}
		
		let winsize = winWidth.map { Darwin.winsize(ws_row: 30, ws_col: $0, ws_xpixel: 0, ws_ypixel: 0) }
		winsizeReader.given(.winsize(willReturn: winsize))
		
		let logger = ProgressLogger(
			winsizeReader: winsizeReader,
			printClosure: print(_:terminator:)
		)
		
		// when
		logger.logFancy(progress: progress, description: description)
		
		// then
		Swift.print("expect:", String(reflecting: expectedResult as String?))
		Swift.print("got:   ", String(reflecting: printed))
		XCTAssertEqual(printed, expectedResult, file: file, line: line)
	}
	
	func test_progressStrings() {
		// wrong params
		
		check(
			progress: -0.5,
			description: "some process: ",
			winWidth: 80,
			expectedResult: "\r" + "some process: 0.00% [                                                          ]"
		)
		
		check(
			progress: 1.5,
			description: "some process: ",
			winWidth: 80,
			expectedResult: "\r" + "some process: 100.00% [########################################################]"
		)
		
		// normal cases
		
		check(
			progress: 0.5,
			description: "some process: ",
			winWidth: 80,
			expectedResult: "\r" + "some process: 50.00% [#############################                            ]"
		)
		
		check(
			progress: 0.25,
			description: "Progress: ",
			winWidth: 80,
			expectedResult: "\r" + "Progress: 25.00% [###############                                              ]"
		)
		
		check(
			progress: 0.25,
			description: "Progress: ",
			winWidth: 80,
			expectedResult: "\r" + "Progress: 25.00% [###############                                              ]"
		)
		
		check(
			progress: 0.9512311111,
			description: "Progress: ",
			winWidth: 30,
			expectedResult: "\r" + "Progress: 95.12% [########## ]"
		)
		
		check(
			progress: 1,
			description: "Progress: ",
			winWidth: 30,
			expectedResult: "\r" + "Progress: 100.00% [##########]"
		)
		
		check(
			progress: 0.3,
			description: "Progress: ",
			winWidth: UInt16("Progress: 30.00% []".count) + 3,
			expectedResult: "\r" + "Progress: 30.00% [#  ]"
		)
		
		// overflowing
		
		check(
			progress: 0.25,
			description: "",
			winWidth: 0,
			expectedResult: "25.00%\n"
		)
		
		check(
			progress: 0.25,
			description: "very long description: ",
			winWidth: 0,
			expectedResult: "very long description: 25.00%\n"
		)
		
		check(
			progress: 0.25,
			description: "very long description: ",
			winWidth: 15,
			expectedResult: "very long description: 25.00%\n[###          ]\n"
		)
	}
}
