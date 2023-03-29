//

import XCTest

public extension XCTestCase {
	func assertArraysEqual<Element>(
		gotten: [Element],
		expected: [Element],
		additionalErrorMsg: String? = nil,
		file: StaticString = #file,
		line: UInt = #line
	)
		where Element: Hashable {
		guard gotten != expected else {
			return
		}

		let diff = gotten.skippedOrderDifference(from: expected)

		guard !diff.isEmpty else {
			return
		}

		var msg = "Not equal!"
		if let additionalErrorMsg = additionalErrorMsg {
			msg += " \(additionalErrorMsg)"
		}
		msg += " Differencies:\n\(diff)"

		XCTFail(msg, file: file, line: line)
	}
}
