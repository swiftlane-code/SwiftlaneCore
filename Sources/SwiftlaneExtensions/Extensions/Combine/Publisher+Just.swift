//

import Combine

public extension Publisher {
	/// Publisher emitting single output `value`.
	static func just(_ value: Output) -> AnyPublisher<Output, Failure> {
		Result.Publisher(value).eraseToAnyPublisher()
	}
	
	/// Publisher emitting failure `error`.
	static func just(_ error: Failure) -> AnyPublisher<Output, Failure> {
		Result.Publisher(error).eraseToAnyPublisher()
	}
}
