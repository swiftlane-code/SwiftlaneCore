//

import Foundation

public extension TimeZone {
	static var GMT: TimeZone? {
		.init(secondsFromGMT: 0)
	}
}
