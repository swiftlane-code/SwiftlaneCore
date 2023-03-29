//

import Foundation

public class TimeMeasuringSeed {
	private let finishClosure: (_ file: String, _ line: UInt) -> Void
	private var isFinished = false
	
	init(finishClosure: @escaping (_ file: String, _ line: UInt) -> Void) {
		self.finishClosure = finishClosure
	}
	
	deinit {
		guard !isFinished else { return }
		finishClosure(#file, #line)
	}
	
	/// Finish this time measuring.
	public func finishTimeMeasuring(file: String = #file, line: UInt = #line) {
		guard !isFinished else { return }
		isFinished = true
		finishClosure(file, line)
	}
}

public protocol TimeMeasuring {
	func measure(
		description: String,
		file: String,
		line: UInt
	) -> TimeMeasuringSeed
	
	func measure<T>(
		description: String,
		_ closure: () throws -> T,
		file: String,
		line: UInt
	) rethrows -> T
}

public extension TimeMeasuring {
	func measure(
		description: String,
		file: String = #file,
		line: UInt = #line
	) -> TimeMeasuringSeed {
		measure(
			description: description,
			file: file,
			line: line
		)
	}
	
	func measure<T>(
		description: String,
		_ closure: () throws -> T,
		file: String = #file,
		line: UInt = #line
	) rethrows -> T {
		try measure(
			description: description,
			closure,
			file: file,
			line: line
		)
	}
}
