//

import Foundation

// MARK: - Protocol

// sourcery: AutoMockable
public protocol DispatchSourceSignalWrapping {
	func setEventHandler(qos: DispatchQoS, flags: DispatchWorkItemFlags, handler: DispatchSource.DispatchSourceHandler?)

	func activate()
}

public extension DispatchSourceSignalWrapping {
	func setEventHandler(handler: DispatchSource.DispatchSourceHandler?) {
		setEventHandler(qos: .unspecified, flags: [], handler: handler)
	}
}

// MARK: - Wrapper

public struct DispatchSourceSignalWrapper {
	public init(source: DispatchSourceSignal) {
		self.source = source
	}

	let source: DispatchSourceSignal
}

extension DispatchSourceSignalWrapper: DispatchSourceSignalWrapping {
	public func setEventHandler(
		qos: DispatchQoS,
		flags: DispatchWorkItemFlags,
		handler: DispatchSource.DispatchSourceHandler?
	) {
		source.setEventHandler(qos: qos, flags: flags, handler: handler)
	}

	public func activate() {
		source.activate()
	}
}
