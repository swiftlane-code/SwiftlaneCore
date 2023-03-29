//

import Foundation

/// Wrapper to decode a value of unknown type.
///
/// Provides a way for type safe decoding without using casts.
///
/// For dictionary with different types of values can be used
/// like this `[String: AnyDecodableValue]` instead of `[String: Any]`.
/// This way you don't need to implement custom `init(from decoder:)` in your code.
///
/// Example:
///
///     let data = """
///         {
///             "key1": 1,
///             "key2": "2"
///         }
///     """.data(using: .utf8)!
///
///     let decoded = try! JSONDecoder()
///         .decode([String: AnyDecodableValue].self, from: data)
///
///     print(decoded)
///
/// `decoded` will be equal to
///
///     [
///         "key1" : .int(1),
///         "key2" : .string("2")
///     ]
///
public indirect enum AnyDecodableValue: Decodable, Hashable {
    case bool(Bool)
    case int(Int)
    case double(Double)
    case string(String)
	case array([AnyDecodableValue])
	case dictionary([String: AnyDecodableValue])
    case null
    case unsupported

    public init(from decoder: Decoder) throws {
        if (try? decoder.singleValueContainer().decodeNil()) == true {
            self = .null
            return
        }

        func decodeSpecific<T: Decodable>() -> T? {
            try? decoder.singleValueContainer().decode(T.self)
        }
		
		if let value = decodeSpecific().map({ AnyDecodableValue.bool($0) }) {
			self = value
			return
		}
		
		if let value = decodeSpecific().map({ AnyDecodableValue.int($0) }) {
			self = value
			return
		}
		
		if let value = decodeSpecific().map({ AnyDecodableValue.double($0) }) {
			self = value
			return
		}
		
		if let value = decodeSpecific().map({ AnyDecodableValue.string($0) }) {
			self = value
			return
		}
		
		if let value = decodeSpecific().map({ AnyDecodableValue.array($0) }) {
			self = value
			return
		}
		
		if let value = decodeSpecific().map({ AnyDecodableValue.dictionary($0) }) {
			self = value
			return
		}
		
		self = .unsupported
    }
}

public extension AnyDecodableValue {
	var hasValue: Bool {
		switch self {
		case .bool, .int, .double, .string, .array, .dictionary:
			return true
		case .null, .unsupported:
			return false
		}
	}
	
	var bool: Bool? {
		if case let .bool(bool) = self {
			return bool
		}
		return nil
	}
	
	var int: Int? {
		if case let .int(int) = self {
			return int
		}
		return nil
	}
	
	var double: Double? {
		if case let .double(double) = self {
			return double
		}
		return nil
	}
	
	var string: String? {
		if case let .string(string) = self {
			return string
		}
		return nil
	}
	
	var array: [AnyDecodableValue]? {
		if case let .array(array) = self {
			return array
		}
		return nil
	}
	
	var dictionary: [String: AnyDecodableValue]? {
		if case let .dictionary(dictionary) = self {
			return dictionary
		}
		return nil
	}
}
