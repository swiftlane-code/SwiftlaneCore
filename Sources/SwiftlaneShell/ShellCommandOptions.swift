//

import Foundation
import SwiftlanePaths

public struct ShellCommandOptions {
	public let logType: ShellCommandLogType
	public let logPrefix: String?
	public let logStdErrToFile: AbsolutePath?
	public let maskedStrings: [String]
	public let executionTimeout: TimeInterval?
	public let shouldIgnoreNonZeroExitCode: (_ output: ShellOutput, _ exitCode: Int32) -> Bool
	public let silentStdErrMessages: Bool
	
	public init(
		logType: ShellCommandLogType,
		logPrefix: String?,
		logStdErrToFile: AbsolutePath?,
		maskedStrings: [String],
		executionTimeout: TimeInterval?,
		shouldIgnoreNonZeroExitCode: @escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool,
		silentStdErrMessages: Bool
	) {
		self.logType = logType
		self.logPrefix = logPrefix
		self.logStdErrToFile = logStdErrToFile
		self.maskedStrings = maskedStrings
		self.executionTimeout = executionTimeout
		self.shouldIgnoreNonZeroExitCode = shouldIgnoreNonZeroExitCode
		self.silentStdErrMessages = silentStdErrMessages
	}
}
