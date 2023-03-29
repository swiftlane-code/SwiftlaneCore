//

import Foundation
import PerfectRainbow

// sourcery: AutoMockable
public protocol Exiting {
	func exit(with code: Int32)
}

public struct Exitor: Exiting {
	private let exitMessage: (_ code: Int32) -> String
	
	public init(
		exitMessage: @escaping (_ code: Int32) -> String = { exitCode in
			"Exiting with code \(exitCode)."
		}
	) {
		self.exitMessage = exitMessage
	}
	
	public func exit(with code: Int32) {
		let msg = exitMessage(code)
		print(code == 0 ? msg.lightGreen : msg.red)
		Darwin.exit(code)
	}
}
