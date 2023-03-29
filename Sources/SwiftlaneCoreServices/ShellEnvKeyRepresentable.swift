//

import Foundation

public protocol ShellEnvKeyRepresentable {
	var asShellEnvKey: String { get }
}

extension String: ShellEnvKeyRepresentable {
	public var asShellEnvKey: String {
		self
	}
}
