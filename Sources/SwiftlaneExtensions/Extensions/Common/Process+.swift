//

import Foundation

public extension Process {
	var executableName: String? {
		executableURL?.path.lastPathComponent
	}
}
