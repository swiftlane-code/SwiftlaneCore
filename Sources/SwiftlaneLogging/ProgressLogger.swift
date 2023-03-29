//

import Foundation

public protocol ProgressLogging {
	func logFancy(progress: Double, description: String)
	func logString(progress: Double, description: String)
}

public class ProgressLogger {
	/// This regex matches any ANSI escape characters sequences like text color
	/// or background color setters (e.g. `"\033[31;1;4mHello\033[0m"`).
	///
	/// Don't ask me how this regex works... because it just works (c).
	private static let escapeCodeRegex = try! NSRegularExpression(pattern: #"\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])"#)
	
	private let winsizeReader: WinSizeReading
	private let printClosure: (String, String) -> Void
	
	public init(
		winsizeReader: WinSizeReading,
		printClosure: @escaping (String, String) -> Void = { Swift.print($0, terminator: $1) }
	) {
		self.winsizeReader = winsizeReader
		self.printClosure = printClosure
	}
	
	private func print(_ string: String, terminator: String = "\n") {
		printClosure(string, terminator)
	}
	
	private func progressString(progress: Double, description: String) -> String {
		let percent = String(format: "%.2f", progress * 100)
		return (description + "\(percent)%").lightMagenta
	}

	// swiftformat:disable indent
	private func logBar(progress: Double, description: String, viewportWidth: UInt16) {
		let progressDescription = progressString(progress: progress, description: description)
		let progressBarPrefix = "["
		let progressBarSuffix = "]"
		let viewportWidth = Int(viewportWidth)
		guard viewportWidth > 2 + progressBarPrefix.count + progressBarSuffix.count else {
			return print(progressDescription, terminator: "\n")
		}
		
		let escapeCharsCount = Self.escapeCodeRegex.matches(in: progressDescription)
			.map { $0.count }
			.reduce(0, +)
		let progressDescriptionWidth = progressDescription.count - escapeCharsCount
		
		// width which can be filled with progress characters
		let wishedAvailableWidth = viewportWidth - (
			progressDescriptionWidth +
			1 + // space after progressDescription
			progressBarPrefix.count +
			progressBarSuffix.count
		)
		
		let oneLineLayout = wishedAvailableWidth >= 3
		
		let widthAvailableToFill = oneLineLayout ? wishedAvailableWidth :
			(viewportWidth - progressBarPrefix.count - progressBarSuffix.count)
		
		let widthToFillWithProgress = Int(round(progress * Double(widthAvailableToFill)))
		let widthToFillWithSpaces = widthAvailableToFill - widthToFillWithProgress
		
		let string =
			(oneLineLayout ? "\r" : "") +
			(
				progressDescription +
				(oneLineLayout ? " " : "\n") +
				progressBarPrefix +
				String(repeating: "#", count: widthToFillWithProgress) +
				String(repeating: " ", count: widthToFillWithSpaces) +
				progressBarSuffix
			).yellow

		print(string, terminator: oneLineLayout ? "" : "\n")
	}
	// swiftformat:enable indent
}

extension ProgressLogger: ProgressLogging {
	/// Either logs running progress bar or just a progress percent string (both prefixed with `\r`).
	/// Fills entire width of terminal window.
	public func logFancy(progress: Double, description: String) {
		let progress = max(0, min(progress, 1))
		
		if let winsize = winsizeReader.winsize() {
			logBar(progress: progress, description: description, viewportWidth: winsize.ws_col)
		} else {
			logString(progress: progress, description: description)
		}
	}
	
	/// Logs progress percent string prefixed with `\r`.
	public func logString(progress: Double, description: String) {
		print("\r" + progressString(progress: progress, description: description), terminator: "  ")
	}
}
