//

import Foundation

// sourcery: AutoMockable
public protocol DateComponentsFormatting {
	func string(from startDate: Date, to endDate: Date) -> String?
}

extension DateComponentsFormatter: DateComponentsFormatting {}
