//

public extension Sequence {
	func summarize(_ keyPath: KeyPath<Element, Int>) -> Int {
		let sum = map {
			$0[keyPath: keyPath]
		}.reduce(0, +)

		return sum
	}
}

public extension Sequence {
	func sorted<T: Comparable>(
		by sortable: (Element) -> T,
		comparator: (T, T) -> Bool = { $0 < $1 }
	) -> [Element] {
		sorted { lhs, rhs in
			comparator(sortable(lhs), sortable(rhs))
		}
	}
}
