//

import Foundation

public extension String {
	static func random() -> String {
		UUID().uuidString
	}
}
