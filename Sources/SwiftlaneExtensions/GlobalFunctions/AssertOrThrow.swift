//

import Foundation

/// Assert that `condition` is `true` or throw a error.
public func assert(
	_ condition: Bool,
	orThrow error: Error,
	file: String = #file,
	line: UInt = #line
) throws {
	if !condition {
		throw error
	}
}
