//

import Foundation

extension Array where Element: Hashable {
	func skippedOrderDifference(from other: [Element]) -> [Element] {
		let this = Set(self)
		let other = Set(other)
		return Array(this.symmetricDifference(other))
	}
}
