//

import Combine
import Foundation

public func performAsync<Value>(
	qos: Dispatch.DispatchQoS.QoSClass = .default,
	_ closure: @escaping () throws -> Value
) -> AnyPublisher<Value, Error> {
	Deferred {
		Future { promise in
			DispatchQueue.global(qos: qos).async {
				do {
					promise(.success(try closure()))
				} catch {
					promise(.failure(error))
				}
			}
		}
	}.eraseToAnyPublisher()
}

public func performAsync<Value>(
	qos: Dispatch.DispatchQoS.QoSClass = .default,
	_ closure: @escaping () -> Value
) -> AnyPublisher<Value, Never> {
	Deferred {
		Future { promise in
			DispatchQueue.global(qos: qos).async {
				promise(.success(closure()))
			}
		}
	}.eraseToAnyPublisher()
}
