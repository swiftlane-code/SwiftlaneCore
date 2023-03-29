//

import Foundation

// sourcery: AutoMockable
public protocol XcodeChecking {
	var isRunningFromXcode: Bool { get }
}

public class XcodeChecker: XcodeChecking {
	public init() {}
	
	public var isRunningFromXcode: Bool {
		ProcessInfo.processInfo.environment.keys.contains("__XCODE_BUILT_PRODUCTS_DIR_PATHS")
	}
}
