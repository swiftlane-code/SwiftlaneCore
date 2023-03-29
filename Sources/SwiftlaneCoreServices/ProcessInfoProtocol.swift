//

import Foundation

// sourcery: AutoMockable
public protocol ProcessInfoProtocol {
	var environment: [String: String] { get }
	var arguments: [String] { get }
	var hostName: String { get }
	var processName: String { get }
	var processIdentifier: Int32 { get }
	var globallyUniqueString: String { get }
}

extension ProcessInfo: ProcessInfoProtocol {}
