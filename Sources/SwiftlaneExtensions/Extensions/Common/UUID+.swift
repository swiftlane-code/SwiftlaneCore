//

import Foundation

public extension UUID {
	var data: Data {
		withUnsafeBytes(of: uuid) { Data($0) }
	}
}
