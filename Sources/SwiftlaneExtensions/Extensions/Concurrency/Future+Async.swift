//

import Combine

public extension Future where Failure == Error {
	/// Initialize a ``Future`` from `async` closure.
	convenience init(operation: @escaping () async throws -> Output) {
		self.init { promise in
			Task {
				do {
					let output = try await operation()
					promise(.success(output))
				} catch {
					promise(.failure(error))
				}
			}
		}
	}
}

public extension Deferred where Failure == Error {
	/// Initialize a ``Deferred`` publisher from `async` closure.
	init<O>(operation: @escaping () async throws -> O) where DeferredPublisher == AnyPublisher<O, Error> {
		self.init {
			Future(operation: operation).eraseToAnyPublisher()
		}
	}
	
	/// Initialize a ``Deferred`` publisher from `async` closure.
	static func erased<O>(operation: @escaping () async throws -> O) -> DeferredPublisher
		where DeferredPublisher == AnyPublisher<O, Error> {
		Self(operation: operation).eraseToAnyPublisher()
	}
}
