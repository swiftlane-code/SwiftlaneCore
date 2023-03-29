//

import Foundation

public extension Sequence {
	/// Transform a sequence using ``transform`` which is asynchronously called for each element of the source sequence.
	func asyncMap<T>(
		_ transform: (Element) async throws -> T
	) async rethrows -> [T] {
		var values = [T]()

		for element in self {
			try await values.append(transform(element))
		}

		return values
	}
}
