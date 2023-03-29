//

import Foundation

public extension DecodingError {
	/// Actually meaningful description of a `DecodingError`.
	var debugDescription: String {
		switch self {
		case let .typeMismatch(_, context):
			return context.debugDescription
		case let .valueNotFound(_, context):
			return context.debugDescription
		case let .keyNotFound(_, context):
			return context.debugDescription
		case let .dataCorrupted(context):
			return context.debugDescription
		@unknown default:
			return errorDescription ?? "<no error description>"
		}
	}
}
