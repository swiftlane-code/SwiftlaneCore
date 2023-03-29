//

import Foundation

public protocol PasswordReading {
	/// Read password from stdin.
	func readPassword(hint: String) throws -> String
}

extension PasswordReading {
	/// Read password from stdin usign hint `"Please enter your password:"`.
	func readPassword() throws -> String {
		try readPassword(hint: "Please enter your password:")
	}
}

public struct PasswordReader {
	public enum Errors: Error {
		case failedToReadPassword
	}
	
	public init() {}
}

extension PasswordReader: PasswordReading {
	public func readPassword(hint: String = "Please enter your password:") throws -> String {
		print(hint.yellow, terminator: " ")
		guard let password = getpass("") else {
			print("Password is required.".red)
			throw Errors.failedToReadPassword
		}
		return String(cString: password)
	}
}
