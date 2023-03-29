//

import Foundation

public struct ShellOutput {
	public let stdoutText: String?
	public let stderrText: String?
	
	public init(stdoutText: String?, stderrText: String?) {
		self.stdoutText = stdoutText
		self.stderrText = stderrText
	}
}

public enum ShError: Error {
	case nonZeroExitCode(command: String, output: ShellOutput, exitCode: Int32)
	case executionTimedOut(command: String, output: ShellOutput, timeout: TimeInterval)
	case closingPipesTimedOut(command: String, output: ShellOutput, timeout: TimeInterval)
	
	public var stdoutText: String? {
		switch self {
		case let .nonZeroExitCode(_, output, _):
			return output.stdoutText
		case let .executionTimedOut(_, output, _):
			return output.stdoutText
		case let .closingPipesTimedOut(_, output, _):
			return output.stdoutText
		}
	}
	
	public var stderrText: String? {
		switch self {
		case let .nonZeroExitCode(_, output, _):
			return output.stderrText
		case let .executionTimedOut(_, output, _):
			return output.stderrText
		case let .closingPipesTimedOut(_, output, _):
			return output.stderrText
		}
	}
	
	private func describe(includeStdOut: Bool) -> String {
		let lines: [String]
		
		func commonLines(command: String, output: ShellOutput) -> [String] {
			var result = ["command: ".magenta + command]
			let stdoutText = output.stdoutText.map { "\n" + $0.addPrefixToAllLines("\t") } ?? "<nil>"
			let stderrText = output.stderrText.map { "\n" + $0.addPrefixToAllLines("\t") } ?? "<nil>"
			
			if includeStdOut {
				result.append("stdout: ".magenta + stdoutText)
			}
			result.append("stderr: ".magenta + stderrText)
			return result
		}
		
		switch self {
		case let .nonZeroExitCode(command, output, exitCode):
			lines = [
				"ShError.nonZeroExitCode:",
				"exitCode: ".magenta + "\(exitCode)",
			] + commonLines(command: command, output: output)
			
		case let .executionTimedOut(command, output, timeout):
			lines = [
				"ShError.executionTimedOut:",
				"timeout: ".magenta + "\(timeout)",
			] + commonLines(command: command, output: output)
			
		case let .closingPipesTimedOut(command, output, timeout):
			lines = [
				"ShError.closingPipesTimedOut:\n",
				"timeout: ".magenta + "\(timeout)",
			] + commonLines(command: command, output: output)
		}
		
		return lines.joined(separator: "\n").addPrefixToAllLines("\t")
	}
}

extension ShError: CustomStringConvertible {
	public var description: String {
		describe(includeStdOut: false)
	}
}

extension ShError: CustomDebugStringConvertible {
	public var debugDescription: String {
		describe(includeStdOut: true)
	}
}
