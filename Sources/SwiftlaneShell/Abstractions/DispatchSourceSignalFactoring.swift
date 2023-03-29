//

import Foundation

// sourcery: AutoMockable
public protocol DispatchSourceSignalFactoring {
	static func makeSignalSource(signal: Int32, queue: DispatchQueue?) -> DispatchSourceSignalWrapping
}

extension DispatchSource: DispatchSourceSignalFactoring {
	public static func makeSignalSource(signal: Int32, queue: DispatchQueue?) -> DispatchSourceSignalWrapping {
		let origin: DispatchSourceSignal = makeSignalSource(signal: signal, queue: queue)
		let wrapper = DispatchSourceSignalWrapper(source: origin)

		return wrapper
	}
}
