//

import Foundation

@propertyWrapper
public struct Resolved<T> {
	private var value: T

	public init(_ strategy: DependencyResolver.Strategy) {
		self.value = DependencyResolver.shared.resolve(T.self, strategy)
	}

	public var wrappedValue: T {
		value
	}
}
