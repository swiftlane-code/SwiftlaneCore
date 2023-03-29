//

import Combine
import Foundation

public extension Publisher {
	/// Ignore output value type.
	func mapOutputToVoid(_ outputType: Output.Type = Output.self) -> AnyPublisher<Void, Failure> {
		self
			.map { _ in () }
			.eraseToAnyPublisher()
	}
}
