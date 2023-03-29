//

import Foundation

public extension Array {
	func chunks(maxChunkSize: Int) -> [[Element]] {
		return stride(from: 0, to: count, by: maxChunkSize).map {
			Array(self[$0..<Swift.min($0 + maxChunkSize, count)])
		}
	}
}

public extension Array {
	mutating func sort<T: Comparable>(
		by sortable: (Element) -> T,
		comparator: (T, T) -> Bool = { $0 < $1 }
	) {
		self = sorted(by: sortable, comparator: comparator)
	}
}
