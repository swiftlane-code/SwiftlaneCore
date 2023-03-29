//

@testable import SwiftlaneShell

import Foundation
import SwiftlaneCoreMocks
import SwiftlanePaths
import SwiftlaneUnitTestTools
import SwiftyMocky
import XCTest

class ShellTests: XCTestCase {
	var shell: ShellExecutor!
	
	var filesManager: FSManagingMock!

	override func setUp() {
		super.setUp()
		
		Matcher.default = .init() // prevents Data Race crash
		let logger = LoggingMock()
		Matcher.default = .init() // prevents Data Race crash
		let sigIntHandler = SigIntHandlingMock()
		let xcodeChecker = XcodeCheckingMock()
		filesManager = FSManagingMock()
		
		shell = ShellExecutor(
			sigIntHandler: sigIntHandler,
			logger: logger,
			xcodeChecker: xcodeChecker,
			filesManager: filesManager
		)
		
		xcodeChecker.given(.isRunningFromXcode(getter: false))
		logger.given(.logLevel(getter: .verbose))
	}
	
	override func tearDown() {
		shell = nil
		filesManager = nil
		
		super.tearDown()
	}

	func test_shWorks() throws {
		// when
		let output = try shell.run("ls /bin/", log: .silent).stdoutText.unwrap()
		
		// then
		XCTAssertTrue(output.contains("bash"))
	}
	
	/// This test is subject to Data Race in ``Matcher.set(file:line:)`` inside SwiftyMocky code.
	func test_stderrLogging_normal() throws {
		// when
		let stderrLogFile = AbsolutePath.random()
		_ = try shell.run(
			">&2 echo 'oh wow such error'; echo 'stdout text'",
			log: .silent,
			logStdErrToFile: stderrLogFile
		)
		
		// then
		filesManager.verify(
			.write(
				.value(stderrLogFile),
				text: .value("oh wow such error\n")
			)
		)
	}
	
	/// This test is subject to Data Race in ``Matcher.set(file:line:)`` inside SwiftyMocky code.
	func test_stderrLogging_badExitCode() throws {
		// when
		let stderrLogFile = AbsolutePath.random()
		XCTAssertThrowsError(
			try shell.run(
				">&2 echo 'oh wow such error'; exit 1",
				log: .silent,
				logStdErrToFile: stderrLogFile
			)
		)
		
		// then
		filesManager.verify(
			.write(
				.value(stderrLogFile),
				text: .value("oh wow such error\n")
			)
		)
	}
	
	/// This test is subject to Data Race in ``Matcher.set(file:line:)`` inside SwiftyMocky code.
	func test_stderrLogging_timeout() throws {
		// when
		let stderrLogFile = AbsolutePath.random()
		
		XCTAssertThrowsError(
			try shell.run(
				">&2 echo 'oh wow such error'; sleep 10",
				log: .silent,
				logStdErrToFile: stderrLogFile,
				executionTimeout: 0.1
			)
		)
		
		// then
		filesManager.verify(
			.write(
				.value(stderrLogFile),
				text: .value("oh wow such error\n")
			)
		)
	}
}
