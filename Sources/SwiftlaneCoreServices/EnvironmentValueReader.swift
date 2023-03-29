//

import Foundation

// sourcery: AutoMockable
public protocol EnvironmentValueReading {
	func string(_ variableName: ShellEnvKeyRepresentable) throws -> String
	func int(_ variableName: ShellEnvKeyRepresentable) throws -> Int
	func double(_ variableName: ShellEnvKeyRepresentable) throws -> Double
	func bool(_ variableName: ShellEnvKeyRepresentable) throws -> Bool
	func url(_ variableName: ShellEnvKeyRepresentable) throws -> URL

	func expandVariables(in string: String) throws -> String
	
	var allVariables: [String: String] { get }
}

public class EnvironmentValueReader {
	public enum Errors: Error {
		case variableIsNotSet(name: String)
		case unableToParseBool(variableName: String, value: String)
	}
	
	private let processInfo: ProcessInfoProtocol
	
	public init(processInfo: ProcessInfoProtocol = ProcessInfo.processInfo) {
		self.processInfo = processInfo
	}
}

extension EnvironmentValueReader: EnvironmentValueReading {
	public var allVariables: [String: String] {
		processInfo.environment
	}
	
	public func string(_ variableName: ShellEnvKeyRepresentable) throws -> String {
		guard let value = processInfo.environment[variableName.asShellEnvKey] else {
			throw Errors.variableIsNotSet(name: variableName.asShellEnvKey)
		}
		return value
	}
	
	public func int(_ variableName: ShellEnvKeyRepresentable) throws -> Int {
		let string = try string(variableName)
		return try Int(
			string
		).unwrap(
			errorDescription: "Unable to parse Int from \"\(string)\" value of variable \"\(variableName)\""
		)
	}
	
	public func double(_ variableName: ShellEnvKeyRepresentable) throws -> Double {
		let string = try string(variableName)
		return try Double(
			string
		).unwrap(
			errorDescription: "Unable to parse Double from \"\(string)\" value of variable \(variableName)"
		)
	}
	
	public func bool(_ variableName: ShellEnvKeyRepresentable) throws -> Bool {
		let string = try string(variableName)
		
		// Parses only "true" or "false"
		if let bool = Bool(string) {
			return bool
		}
		
		switch string.lowercased() {
		case "1", "yes", "true":
			return true
			
		case "0", "no", "false":
			return false
			
		default:
			throw Errors.unableToParseBool(variableName: variableName.asShellEnvKey, value: string)
		}
	}
	
	public func url(_ variableName: ShellEnvKeyRepresentable) throws -> URL {
		let string = try string(variableName)
		return try URL(
			string: string
		).unwrap(
			errorDescription: "Unable to initialize URL from \"\(string)\" value of variable \(variableName)"
		)
	}
	
	public func expandVariables(in string: String) throws -> String {
		let regex = try NSRegularExpression(pattern: #"\$(\w+)"#, options: .anchorsMatchLines)
		return try regex.matchesGroups(in: string).reduce(string) { result, groups in
			let variableName = String(groups[1])
			return result.replacingOccurrences(of: groups[0], with: try self.string(variableName))
		}
	}
}
