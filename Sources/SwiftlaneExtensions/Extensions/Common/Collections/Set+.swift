//

import Foundation

public extension Set {
	/// All all elements of a `collection` into the set.
	mutating func insert<T: Collection>(all collection: T) where T.Element == Element {
		collection.forEach {
			insert($0)
		}
	}
}
