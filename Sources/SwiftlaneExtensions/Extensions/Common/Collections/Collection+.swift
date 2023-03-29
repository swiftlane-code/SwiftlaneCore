
import Foundation

public extension Collection {
	/// Make an array from the collection.
	var asArray: [Element] {
		Array(self)
	}
	
	/// Returns element at index or nil, if collection doesn't contain the index
	subscript(safe index: Index) -> Element? {
		indices.contains(index) ? self[index] : nil
	}
}

public extension Collection where Element: Hashable {
	/// Make array of unique elements.
	///
	/// Order of elements **IS NOT** preserved.
	var unique: [Element] {
		Set(self).asArray
	}
    
	/// Make array of unique elements.
	///
	/// Order of elements **IS** preserved.
	var removingDuplicates: [Element] {
		var result: [Element] = []
		var tmp: Set<Element> = Set(minimumCapacity: self.count)
		result.reserveCapacity(self.count)
		self.lazy /// required for `filter -> foreach -> filter -> foreach -> ...` execution flow.
			.filter { !tmp.contains($0) }
			.forEach { result.append($0); tmp.insert($0) }
		return result
	}
}
