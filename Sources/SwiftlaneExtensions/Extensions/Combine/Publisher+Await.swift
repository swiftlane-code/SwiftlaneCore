//

import Combine
import Foundation

public enum PublisherAwaitError: Error {
	case timedOut(file: String, line: UInt)
	case completedWithoutProducingValue(file: String, line: UInt)
}

public extension Publisher {
	/// Block current thread and wait for completion of the publisher.
	/// - Parameters:
	///   - timeout: maximum waiting time in seconds.
	/// - Returns: the last value produced by the publisher.
	func await(
		timeout: TimeInterval = 61,
		file: String = #file,
		line: UInt = #line
	) throws -> Output {
		var result: Result<Output, Failure>?
		let sema = DispatchSemaphore(value: 0)

		let cancellable = sink(
			receiveCompletion: { completion in
				switch completion {
				case let .failure(error):
					result = .failure(error)
				case .finished:
					break
				}

				sema.signal()
			},
			receiveValue: { value in
				result = .success(value)
			}
		)

		let waitResult = sema.wait(timeout: .now() + timeout)
		cancellable.cancel()
		
		switch result {
		case let .failure(error):
			throw error
		case let .success(value):
			return value
		case .none:
			if waitResult == .success {
				throw PublisherAwaitError.completedWithoutProducingValue(file: file, line: line)
			} else {
				throw PublisherAwaitError.timedOut(file: file, line: line)
			}
		}
	}
}
