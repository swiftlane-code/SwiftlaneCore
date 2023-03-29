//

import Foundation

/// Caset object to another type or throw error.
struct TypeCastError: Error, CustomStringConvertible {
	let description: String
}

public func cast<T>(_ object: Any, to type: T.Type) throws -> T {
	guard let casted = (object as? T) else {
		throw TypeCastError(
			description: "Unable to cast \(String(reflecting: object)) to \(String(reflecting: T.self))"
		)
	}
	return casted
}
