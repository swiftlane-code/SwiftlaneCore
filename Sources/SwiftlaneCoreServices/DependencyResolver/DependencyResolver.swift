//

import Foundation
import SwiftlaneExtensions

private struct Producer {
	let closure: () -> Any
	
	func produce<T>() -> T {
		let produced = closure()
		guard let casted = produced as? T else {
			logFatalErrorAndExit("Type mismatch: expected '\(T.self)' but produced is '\(type(of: produced))'")
		}
		return casted
	}
}

private func logFatalErrorAndExit(
	_ message: @autoclosure () -> String,
	file: String = #file,
	line: UInt = #line
) -> Never {
	Swift.print("\(file.lastPathComponent) > " + message().red)

	if XcodeChecker().isRunningFromXcode {
		// Trigger fatalError breakpoint when running in Xcode.
		Swift.fatalError(message())
	} else {
		exit(1)
	}
}

public class DependencyResolver {
	public enum Strategy {
		case unique
		case shared
	}
	
	public static let shared = DependencyResolver()
	
	private var producers: [String: Producer] = [:]
	private var sharedInstances: [String: Any] = [:]
	
	public init() {}

	public func reset() {
		producers.removeAll()
		sharedInstances.removeAll()
	}
	
	public func register<T>(_ registerType: T.Type, producerClosure: @escaping () -> T) {
		let key = fullTypeName(registerType)
		precondition(!producers.keys.contains(key))
		producers[key] = Producer(closure: producerClosure)
	}
	
	public func resolve<T>(_ requiredType: T.Type, _ strategy: Strategy) -> T {
		let key = fullTypeName(requiredType)
		guard let producer = producers[key] else {
			logFatalErrorAndExit("Producer for type '\(key)' is not registered")
		}
		switch strategy {
		case .unique:
			return producer.produce()
		case .shared:
			if let existing = sharedInstances[key] {
				guard let casted = existing as? T else {
					logFatalErrorAndExit(
						"Type mismatch: expected is '\(fullTypeName(T.self))' but existing is '\(fullTypeName(existing))'"
					)
				}
				return casted
			} else {
				let created: T = producer.produce()
				sharedInstances[key] = created
				return created
			}
		}
	}
}
