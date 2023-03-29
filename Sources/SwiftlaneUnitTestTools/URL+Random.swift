//

import Foundation

public extension URL {
	static func random() -> URL {
		URL(string: UUID().uuidString)!
	}
}
