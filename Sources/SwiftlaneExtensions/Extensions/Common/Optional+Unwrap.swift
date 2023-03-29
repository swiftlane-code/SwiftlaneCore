//

public enum OptionalError: Error {
	case optionalIsNil(description: String?, file: String, line: UInt)
}

extension OptionalError: Equatable {}

public extension Optional {
	func unwrap(
		nilError: Error
	) throws -> Wrapped {
		guard let value = self else {
			throw nilError
		}
		return value
	}
	
	func unwrap(
		errorDescription: String? = nil,
		file: String = #file,
		line: UInt = #line
	) throws -> Wrapped {
		try unwrap(
			nilError: OptionalError.optionalIsNil(
				description: errorDescription,
				file: file,
				line: line
			)
		)
	}
}
