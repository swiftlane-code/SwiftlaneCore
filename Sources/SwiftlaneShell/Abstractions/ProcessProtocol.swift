//

import Foundation
import SwiftlaneExtensions

// sourcery: AutoMockable
public protocol ProcessProtocol {
	var isRunning: Bool { get }
	var debugDescription: String { get }
	var processIdentifier: Int32 { get }
	var executableURL: URL? { get }
	var executableName: String? { get }
	func interrupt()
	func waitUntilExit()
}

extension Process: ProcessProtocol {
	/// Implemented in `SwiftExtensions`.
}
