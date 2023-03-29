//

import Foundation

/// Something that needs to be protected from appearing in logs etc.
///
///	Example:
///
///		print("Value:", SensitiveData("123"))
///		// will print:
///		> Value: SensitiveData<String>
///
public struct SensitiveData<T> {
	private let value: T
	
	public var sensitiveValue: T {
		value
	}
	
	public init(_ value: T) {
		self.value = value
	}
}

extension SensitiveData: CustomStringConvertible {
	public var description: String {
		String(describing: type(of: self))
	}
}

extension SensitiveData: CustomDebugStringConvertible {
	public var debugDescription: String {
		String(describing: type(of: self))
	}
}

extension SensitiveData: CustomLeafReflectable {
	public var customMirror: Mirror {
		Mirror(reflecting: String(describing: type(of: self)))
	}
}
