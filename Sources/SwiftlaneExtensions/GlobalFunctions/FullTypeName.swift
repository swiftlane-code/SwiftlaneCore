//

import Foundation

/// Returns type name including framework (e.g. `"Swift.Int"`)
public func fullTypeName(_ obj: Any) -> String {
	String(reflecting: type(of: obj).self)
}

/// Returns type name including framework (e.g. `"Swift.Int"`)
public func fullTypeName<T>(_ objType: T.Type) -> String {
	String(reflecting: objType.self)
}
