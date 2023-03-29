//

import Foundation

public extension Data {
	/// Returns size in bytes/megabytes/kilobytes/etc.
	/// e.g. `"64MB"`
	func humanSize() -> String {
		let formatter = ByteCountFormatter()
		formatter.allowedUnits = []
		formatter.countStyle = .file
		let result = formatter.string(fromByteCount: Int64(self.count))
		return result
	}
}
