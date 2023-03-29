//

import Combine
import Foundation

public extension Publisher {
	/// In comparison to simple `func retry(_ retries:)` this operator delays each retry by specified `delay`.
	///
	/// After at least one retry is done: `receive(subscriber:)` of the upstream publisher will be called from a background thread.
	/// Also a value or a failure will be passed to the downstream receiver on a background thread in this case.
	///
	/// After exceeding the specified number of retries, the publisher passes the failure to the downstream receiver.
	/// - Parameter retries: The number of times to attempt to recreate the subscription.
	/// - Parameter delay: Delay before each retry.
	/// - Returns: A publisher that attempts to recreate its subscription to a failed upstream publisher.
	func retry(
		_ retries: Int,
		delay: DispatchQueue.SchedulerTimeType.Stride,
		onRetry: @escaping (_ retryNumber: Int, _ maxRetries: Int) -> Void = { _, _ in },
		onError: @escaping (Failure) -> Void = { _ in }
	) -> AnyPublisher<Output, Failure> {
		guard retries > 0 else {
			return self.eraseToAnyPublisher()
		}
		
		return self
			.catch { error -> AnyPublisher<Output, Failure> in
				onError(error)
				var retryNumber = 1
				
				return Just(())
					.delay(
						for: delay,
						tolerance: 1,
						scheduler: DispatchQueue.global()
					)
					.flatMap { () -> Self in
						onRetry(retryNumber, retries)
						retryNumber += 1
						return self
					}
					.handleEvents(receiveCompletion: { completion in
						if case let .failure(error) = completion {
							onError(error)
						}
					})
					.retry(retries - 1)
					.eraseToAnyPublisher()
			}
			.eraseToAnyPublisher()
	}
}
