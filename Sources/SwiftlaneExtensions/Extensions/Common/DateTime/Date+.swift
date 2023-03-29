//

import Foundation

public extension Date {
	func daysSince(start: Date) -> Int {
		Calendar.current.dateComponents([.day], from: start, to: self).day! // this force unwrap never fails.
	}
}
