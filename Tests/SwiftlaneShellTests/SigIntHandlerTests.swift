//

@testable import SwiftlaneShell

import Foundation
import SwiftlaneCoreMocks
import SwiftyMocky
import XCTest

class SigIntHandlerTests: XCTestCase {
	var loggerMock: LoggingMock!
	var exitorMock: ExitingMock!
	var dispatchSourcesFactoryMock: DispatchSourceSignalFactoringMock.Type!
	var processMock: ProcessProtocolMock!
	var sourceMock: DispatchSourceSignalWrappingMock!
	var signalConfigurator: SignalConfiguringMock!

	let singleSignal = Set<Int32>([#line])

	let queue = DispatchQueue(label: "SigIntHandlerTests")

	let queueSpecificKey = DispatchSpecificKey<String>()
	let queueSpecificValue = "SigIntHandlerTests"

	override func setUp() {
		super.setUp()

		loggerMock = LoggingMock()
		exitorMock = ExitingMock()
		dispatchSourcesFactoryMock = DispatchSourceSignalFactoringMock.self
		processMock = ProcessProtocolMock()
		sourceMock = DispatchSourceSignalWrappingMock()
		signalConfigurator = SignalConfiguringMock()

		queue.setSpecific(
			key: queueSpecificKey,
			value: queueSpecificValue
		)
		
		loggerMock.given(.logLevel(getter: .verbose))
	}

	override func tearDown() {
		super.tearDown()

		dispatchSourcesFactoryMock.resetMock()
	}

	func test_signalActivated() {
		// given
		dispatchSourcesFactoryMock.given(
			.makeSignalSource(
				signal: .any,
				queue: .any,
				willReturn: sourceMock
			)
		)

		let handler = SigIntHandler(
			queue: queue,
			logger: loggerMock,
			dispatchSourcesFactory: dispatchSourcesFactoryMock,
			exitor: exitorMock,
			subscriptionSignals: singleSignal,
			signalConfigurator: signalConfigurator
		)

		// when
		handler.addSubprocess(processMock)

		// then
		sourceMock.verify(.activate(), count: 1)
	}

	func test_subprocessInteraptingIfRunning() {
		assertSubprocessInterapting(isRunning: true, isInterapted: true)
	}

	func test_subprocessNotInteraptingIfNotRunning() {
		assertSubprocessInterapting(isRunning: false, isInterapted: false)
	}

	func test_subscriptionSignalsDisabledForCustormHandlersToBeWorking() throws {
		// given
		dispatchSourcesFactoryMock.given(
			.makeSignalSource(
				signal: .any,
				queue: .any,
				willReturn: sourceMock
			)
		)

		let handler = SigIntHandler(
			queue: queue,
			logger: loggerMock,
			dispatchSourcesFactory: dispatchSourcesFactoryMock,
			exitor: exitorMock,
			subscriptionSignals: singleSignal,
			signalConfigurator: signalConfigurator
		)

		// when
		handler.addSubprocess(processMock)

		// then
		let expectedSignal = try XCTUnwrap(singleSignal.first)
		signalConfigurator.verify(
			.configure(
				code: .value(expectedSignal),
				policy: .any
			),
			count: 1
		)
	}

	func test_signalActivatedOnlyOnce() {
		// given
		dispatchSourcesFactoryMock.given(
			.makeSignalSource(
				signal: .any,
				queue: .any,
				willReturn: sourceMock
			)
		)

		let handler = SigIntHandler(
			queue: queue,
			logger: loggerMock,
			dispatchSourcesFactory: dispatchSourcesFactoryMock,
			exitor: exitorMock,
			subscriptionSignals: singleSignal,
			signalConfigurator: signalConfigurator
		)
		let anotherProcessMock = ProcessProtocolMock()

		// when
		handler.addSubprocess(processMock)
		handler.addSubprocess(anotherProcessMock)

		// then
		sourceMock.verify(.activate(), count: 1)
	}
}

extension SigIntHandlerTests {
	func assertSubprocessInterapting(
		isRunning: Bool,
		isInterapted: Bool,
		file: StaticString = #file,
		line: UInt = #line
	) {
		// given
		dispatchSourcesFactoryMock.given(
			.makeSignalSource(
				signal: .any,
				queue: .any,
				willReturn: sourceMock
			)
		)

		let handler = SigIntHandler(
			queue: queue,
			logger: loggerMock,
			dispatchSourcesFactory: dispatchSourcesFactoryMock,
			exitor: exitorMock,
			subscriptionSignals: singleSignal,
			signalConfigurator: signalConfigurator
		)

		processMock.given(.isRunning(getter: isRunning))
		processMock.given(.processIdentifier(getter: 555))
		processMock.given(.debugDescription(getter: #function))

		let wait = expectation(description: #function)

		var eventHandler: (() -> Void)?

		sourceMock.perform(
			.setEventHandler(
				qos: .any,
				flags: .any,
				handler: .any,
				perform: {
					_, _, completion in
					eventHandler = completion!
					self.assertExecutingInSpecifiedQueue()
					wait.fulfill()
				}
			)
		)

		handler.addSubprocess(processMock)

		waitForExpectations(timeout: 0.5) { error in
			guard let error = error else { return }
			XCTFail("Error: \(error)", file: file, line: line)
		}

		// when
		eventHandler!()

		// then
		let expectedCount: Count = .exactly(isInterapted ? 1 : 0)
		processMock.verify(
			.interrupt(),
			count: expectedCount,
			file: file,
			line: line
		)
	}

	func assertExecutingInSpecifiedQueue(
		file: StaticString = #file,
		line: UInt = #line
	) {
		let specificKey = queueSpecificKey
		let currentValue = DispatchQueue.getSpecific(key: specificKey)

		let expectedValue = queueSpecificValue
		XCTAssertEqual(currentValue, expectedValue, "Queue check failed", file: file, line: line)
	}
}
