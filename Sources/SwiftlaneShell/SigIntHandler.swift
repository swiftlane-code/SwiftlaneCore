//

import Foundation
import SwiftlaneCoreServices
import SwiftlaneExtensions
import SwiftlaneLogging

// sourcery: AutoMockable
public protocol SigIntHandling {
	func addSubprocess(_ process: ProcessProtocol)
}

public class SigIntHandler {
	private let queue: DispatchQueue
	private let dispatchSourcesFactory: DispatchSourceSignalFactoring.Type
	let logger: Logging
	private var subprocesses = [ProcessProtocol]()
	private var isActive = false
	private var handlers = [DispatchSourceSignalWrapping]()
	private let exitor: Exiting
	private let subscriptionSignals: Set<Int32>
	private let signalConfigurator: SignalConfiguring

	public init(
		queue: DispatchQueue,
		logger: Logging,
		dispatchSourcesFactory: DispatchSourceSignalFactoring.Type,
		exitor: Exiting,
		subscriptionSignals: Set<Int32>,
		signalConfigurator: SignalConfiguring
	) {
		self.queue = queue
		self.logger = logger
		self.dispatchSourcesFactory = dispatchSourcesFactory
		self.exitor = exitor
		self.subscriptionSignals = subscriptionSignals
		self.signalConfigurator = signalConfigurator
	}

	private func subscribeForSignals() {
		guard !isActive else {
			return
		}

		isActive = true

		for code in subscriptionSignals {
			subscribe(for: code, signalName: "\(code)")
		}
	}
	
	private func subscribe(for signalCode: Int32, signalName: String) {
		let source = dispatchSourcesFactory.makeSignalSource(
			signal: signalCode,
			queue: queue
		)

		source.setEventHandler { [weak self, logger, exitor] in
			self?.subprocesses
				.filter { $0.isRunning }
				.forEach {
					logger.warn("Sending \(signalName) to \($0.executableName ?? "") pid:\($0.processIdentifier)")
					$0.interrupt()
				}

			exitor.exit(with: signalCode)
		}

		source.activate()
		handlers.append(source)
		
		// Prevent our process from exiting because of a signal which the handler was setup for.
		signalConfigurator.configure(code: signalCode, policy: SIG_IGN)
	}
}

extension SigIntHandler: SigIntHandling {
	public func addSubprocess(_ process: ProcessProtocol) {
		// For thread safety
		queue.sync {
			subscribeForSignals()
			// TODO: subscribeForSignals payload executes once, but process can be added twice
			// Is it ok?
			subprocesses.append(process)
		}
	}
}

public extension SigIntHandler {
	convenience init(
		logger: Logging,
		subscriptionSignals: Set<Int32> = [SIGHUP, SIGINT, SIGQUIT, SIGILL, SIGTRAP, SIGABRT],
		queueLabel: String = "SigIntHandler",
		exitor: Exiting = Exitor()
	) {
		self.init(
			queue: DispatchQueue(label: queueLabel),
			logger: logger,
			dispatchSourcesFactory: DispatchSource.self,
			exitor: exitor,
			subscriptionSignals: subscriptionSignals,
			signalConfigurator: SignalsConfigurator()
		)
	}
}
