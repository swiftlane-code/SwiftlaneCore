//
//  File.swift
//
//

import Foundation

#if FALSE
import Yams
extension YAMLDecoder: AnyDecoder {}
#endif

#if FALSE
import XMLCoder
extension XMLDecoder: AnyDecoder {}
#endif

extension JSONDecoder: AnyDecoder {}
extension PropertyListDecoder: AnyDecoder {}

public protocol AnyDecoder {
	func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}
