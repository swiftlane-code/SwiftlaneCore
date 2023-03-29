//

import Darwin
import Foundation

// sourcery: AutoMockable
public protocol SignalConfiguring {
	func configure(code: Int32, policy: @escaping sig_t)
}

struct SignalsConfigurator {}

extension SignalsConfigurator: SignalConfiguring {
	func configure(code: Int32, policy: @escaping @convention(c) (Int32) -> Void) {
		signal(code, policy)
	}
}
