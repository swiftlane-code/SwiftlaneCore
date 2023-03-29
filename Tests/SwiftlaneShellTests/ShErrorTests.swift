//

@testable import SwiftlaneShell

import Foundation
import PerfectRainbow
import XCTest

class ShErrorTests: XCTestCase {
	func test_shErrorFormatting_nonZeroExitCode() throws {
		// given
		let rainbowEnabled = Rainbow.enabled
		Rainbow.enabled = false
		defer {
			Rainbow.enabled = rainbowEnabled
		}
		
		let error = ShError.nonZeroExitCode(
			command: "command 1 2 3",
			output: .init(
				stdoutText: "stdout 1\nstdout 2\n\nstdout 4",
				stderrText: "stderr 1\nstderr 2\n\nstderr 4"
			),
			exitCode: 32
		)
		
		let expectedLines = [
			"\t" + "ShError.nonZeroExitCode:",
			"\t" + "exitCode: 32",
			"\t" + "command: command 1 2 3",
			"\t" + "stdout: ",
			"\t\t" + "stdout 1",
			"\t\t" + "stdout 2",
			"\t\t" + "",
			"\t\t" + "stdout 4",
			"\t" + "stderr: ",
			"\t\t" + "stderr 1",
			"\t\t" + "stderr 2",
			"\t\t" + "",
			"\t\t" + "stderr 4",
		]
		
		// when
		let lines = error.debugDescription.split(separator: "\n", omittingEmptySubsequences: false).map { String($0) }
		
		// then
		XCTAssertEqual(lines.count, expectedLines.count)
		zip(lines, expectedLines).enumerated().forEach { vars in
			let (idx, (line, expectedLine)) = vars
			XCTAssertEqual(line, expectedLine, "Line index: \(idx)")
		}
	}
}
