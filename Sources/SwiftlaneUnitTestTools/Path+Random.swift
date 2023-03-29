//

import Foundation
import SwiftlanePaths

public extension Path {
	static func randomAbsolute() -> Path {
		.absolute(.random())
	}
}

public extension AbsolutePath {
	static func random(suffix: String = "_") -> AbsolutePath {
		try! .init("/absolute/path/" + .random() + suffix)
	}
	
	static func random(lastComponent: String) -> AbsolutePath {
		try! .init("/absolute/path/" + lastComponent)
	}
}

public extension RelativePath {
	static func random(suffix: String = "_") -> RelativePath {
		try! .init("relative/path/" + .random() + suffix)
	}
	
	static func random(lastComponent: String) -> RelativePath {
		try! .init("relative/path/" + lastComponent)
	}
}
