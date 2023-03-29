//

import Darwin
import Foundation

// sourcery: AutoMockable
public protocol WinSizeReading {
	func winsize() -> Darwin.winsize?
}

public class WinSizeReader: WinSizeReading {
	public init() {}
	
	public func winsize() -> Darwin.winsize? {
		var w = Darwin.winsize()
		guard ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == 0 else {
			return nil
		}
		return w
	}
}
