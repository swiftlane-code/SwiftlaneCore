// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0

import Darwin
import Foundation
import PerfectRainbow
import SwiftlaneCoreServices
import SwiftlaneExtensions
import SwiftlaneLogging
import SwiftlanePaths
@testable import SwiftlaneShell
import SwiftyMocky
import XCTest

// MARK: - DispatchSourceSignalFactoring

open class DispatchSourceSignalFactoringMock: DispatchSourceSignalFactoring, Mock, StaticMock {
	public init(
		sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst,
		stubbing stubbingPolicy: StubbingPolicy = .wrap,
		file: StaticString = #file,
		line: UInt = #line
	) {
		SwiftyMockyTestObserver.setup()
		self.sequencingPolicy = sequencingPolicy
		self.stubbingPolicy = stubbingPolicy
		self.file = file
		self.line = line
	}

	var matcher: Matcher = .default
	var stubbingPolicy: StubbingPolicy = .wrap
	var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

	private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
	private var invocations: [MethodType] = []
	private var methodReturnValues: [Given] = []
	private var methodPerformValues: [Perform] = []
	private var file: StaticString?
	private var line: UInt?

	public typealias PropertyStub = Given
	public typealias MethodStub = Given
	public typealias SubscriptStub = Given

	/// Convenience method - call setupMock() to extend debug information when failure occurs
	public func setupMock(file: StaticString = #file, line: UInt = #line) {
		self.file = file
		self.line = line
	}

	/// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
	public func resetMock(_ scopes: MockScope...) {
		let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
		if scopes.contains(.invocation) { invocations = [] }
		if scopes.contains(.given) { methodReturnValues = [] }
		if scopes.contains(.perform) { methodPerformValues = [] }
	}

	static var matcher: Matcher = .default
	static var stubbingPolicy: StubbingPolicy = .wrap
	static var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
	private static var queue = DispatchQueue(label: "com.swiftymocky.invocations.static", qos: .userInteractive)
	private static var invocations: [StaticMethodType] = []
	private static var methodReturnValues: [StaticGiven] = []
	private static var methodPerformValues: [StaticPerform] = []
	public typealias StaticPropertyStub = StaticGiven
	public typealias StaticMethodStub = StaticGiven

	/// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
	public static func resetMock(_ scopes: MockScope...) {
		let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
		if scopes.contains(.invocation) { invocations = [] }
		if scopes.contains(.given) { methodReturnValues = [] }
		if scopes.contains(.perform) { methodPerformValues = [] }
	}

	public static func makeSignalSource(signal: Int32, queue: DispatchQueue?) -> DispatchSourceSignalWrapping {
		addInvocation(.sm_makeSignalSource__signal_signalqueue_queue(Parameter<Int32>.value(signal), Parameter<DispatchQueue?>.value(queue)))
		let perform =
			methodPerformValue(.sm_makeSignalSource__signal_signalqueue_queue(
				Parameter<Int32>.value(signal),
				Parameter<DispatchQueue?>.value(queue)
			)) as? (Int32, DispatchQueue?) -> Void
		perform?(signal, queue)
		var __value: DispatchSourceSignalWrapping
		do {
			__value =
				try methodReturnValue(.sm_makeSignalSource__signal_signalqueue_queue(Parameter<Int32>.value(signal), Parameter<DispatchQueue?>.value(queue)))
					.casted()
		} catch {
			Failure("Stub return value not specified for makeSignalSource(signal: Int32, queue: DispatchQueue?). Use given")
		}
		return __value
	}

	fileprivate enum StaticMethodType {
		case sm_makeSignalSource__signal_signalqueue_queue(Parameter<Int32>, Parameter<DispatchQueue?>)

		static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (
				.sm_makeSignalSource__signal_signalqueue_queue(lhsSignal, lhsQueue),
				.sm_makeSignalSource__signal_signalqueue_queue(rhsSignal, rhsQueue)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsSignal, rhs: rhsSignal, with: matcher), lhsSignal, rhsSignal, "signal"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsQueue, rhs: rhsQueue, with: matcher), lhsQueue, rhsQueue, "queue"))
				return Matcher.ComparisonResult(results)
			}
		}

		func intValue() -> Int {
			switch self {
			case let .sm_makeSignalSource__signal_signalqueue_queue(p0, p1): return p0.intValue + p1.intValue
			}
		}

		func assertionName() -> String {
			switch self {
			case .sm_makeSignalSource__signal_signalqueue_queue: return ".makeSignalSource(signal:queue:)"
			}
		}
	}

	open class StaticGiven: StubbedMethod {
		fileprivate var method: StaticMethodType

		private init(method: StaticMethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func makeSignalSource(
			signal: Parameter<Int32>,
			queue: Parameter<DispatchQueue?>,
			willReturn: DispatchSourceSignalWrapping...
		) -> StaticMethodStub {
			return StaticGiven(
				method: .sm_makeSignalSource__signal_signalqueue_queue(signal, queue),
				products: willReturn.map { StubProduct.return($0 as Any) }
			)
		}

		public static func makeSignalSource(
			signal: Parameter<Int32>,
			queue: Parameter<DispatchQueue?>,
			willProduce: (Stubber<DispatchSourceSignalWrapping>) -> Void
		) -> StaticMethodStub {
			let willReturn: [DispatchSourceSignalWrapping] = []
			let given = StaticGiven(
				method: .sm_makeSignalSource__signal_signalqueue_queue(signal, queue),
				products: willReturn.map { StubProduct.return($0 as Any) }
			)
			let stubber = given.stub(for: DispatchSourceSignalWrapping.self)
			willProduce(stubber)
			return given
		}
	}

	public struct StaticVerify {
		fileprivate var method: StaticMethodType

		public static func makeSignalSource(
			signal: Parameter<Int32>,
			queue: Parameter<DispatchQueue?>
		)
			-> StaticVerify { return StaticVerify(method: .sm_makeSignalSource__signal_signalqueue_queue(signal, queue)) }
	}

	public struct StaticPerform {
		fileprivate var method: StaticMethodType
		var performs: Any

		public static func makeSignalSource(
			signal: Parameter<Int32>,
			queue: Parameter<DispatchQueue?>,
			perform: @escaping (Int32, DispatchQueue?) -> Void
		) -> StaticPerform {
			return StaticPerform(method: .sm_makeSignalSource__signal_signalqueue_queue(signal, queue), performs: perform)
		}
	}

	fileprivate struct MethodType {
		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult { return .match }
		func intValue() -> Int { return 0 }
		func assertionName() -> String { return "" }
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}
	}

	public struct Verify {
		fileprivate var method: MethodType
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any
	}

	public func given(_ method: Given) {
		methodReturnValues.append(method)
	}

	public func perform(_ method: Perform) {
		methodPerformValues.append(method)
		methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
	}

	public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
		let fullMatches = matchingCalls(method, file: file, line: line)
		let success = count.matches(fullMatches)
		let assertionName = method.method.assertionName()
		let feedback: String = {
			guard !success else { return "" }
			return Utils.closestCallsMessage(
				for: self.invocations.map { invocation in
					matcher.set(file: file, line: line)
					defer { matcher.clearFileAndLine() }
					return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
				},
				name: assertionName
			)
		}()
		MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
	}

	private func addInvocation(_ call: MethodType) {
		self.queue.sync { invocations.append(call) }
	}

	private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
		let matched = candidates
			.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
		guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
		return product
	}

	private func methodPerformValue(_ method: MethodType) -> Any? {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
		return matched?.performs
	}

	private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
		matcher.set(file: file ?? self.file, line: line ?? self.line)
		defer { matcher.clearFileAndLine() }
		return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
	}

	private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
		return matchingCalls(method.method, file: file, line: line).count
	}

	private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			onFatalFailure(message)
			Failure(message)
		}
	}

	private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			return nil
		}
	}

	private func onFatalFailure(_ message: String) {
		guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
		SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
	}

	public static func given(_ method: StaticGiven) {
		methodReturnValues.append(method)
	}

	public static func perform(_ method: StaticPerform) {
		methodPerformValues.append(method)
		methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
	}

	public static func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
		let fullMatches = matchingCalls(method, file: file, line: line)
		let success = count.matches(fullMatches)
		let assertionName = method.method.assertionName()
		let feedback: String = {
			guard !success else { return "" }
			return Utils.closestCallsMessage(
				for: self.invocations.map { invocation in
					matcher.set(file: file, line: line)
					defer { matcher.clearFileAndLine() }
					return StaticMethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
				},
				name: assertionName
			)
		}()
		MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
	}

	private static func addInvocation(_ call: StaticMethodType) {
		self.queue.sync { invocations.append(call) }
	}

	private static func methodReturnValue(_ method: StaticMethodType) throws -> StubProduct {
		let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
		let matched = candidates
			.first(where: { $0.isValid && StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
		guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
		return product
	}

	private static func methodPerformValue(_ method: StaticMethodType) -> Any? {
		let matched = methodPerformValues.reversed()
			.first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
		return matched?.performs
	}

	private static func matchingCalls(_ method: StaticMethodType, file: StaticString?, line: UInt?) -> [StaticMethodType] {
		matcher.set(file: file, line: line)
		defer { matcher.clearFileAndLine() }
		return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
	}

	private static func matchingCalls(_ method: StaticVerify, file: StaticString?, line: UInt?) -> Int {
		return matchingCalls(method.method, file: file, line: line).count
	}

	private static func givenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			Failure(message)
		}
	}

	private static func optionalGivenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T? {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			return nil
		}
	}
}

// MARK: - DispatchSourceSignalWrapping

open class DispatchSourceSignalWrappingMock: DispatchSourceSignalWrapping, Mock {
	public init(
		sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst,
		stubbing stubbingPolicy: StubbingPolicy = .wrap,
		file: StaticString = #file,
		line: UInt = #line
	) {
		SwiftyMockyTestObserver.setup()
		self.sequencingPolicy = sequencingPolicy
		self.stubbingPolicy = stubbingPolicy
		self.file = file
		self.line = line
	}

	var matcher: Matcher = .default
	var stubbingPolicy: StubbingPolicy = .wrap
	var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

	private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
	private var invocations: [MethodType] = []
	private var methodReturnValues: [Given] = []
	private var methodPerformValues: [Perform] = []
	private var file: StaticString?
	private var line: UInt?

	public typealias PropertyStub = Given
	public typealias MethodStub = Given
	public typealias SubscriptStub = Given

	/// Convenience method - call setupMock() to extend debug information when failure occurs
	public func setupMock(file: StaticString = #file, line: UInt = #line) {
		self.file = file
		self.line = line
	}

	/// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
	public func resetMock(_ scopes: MockScope...) {
		let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
		if scopes.contains(.invocation) { invocations = [] }
		if scopes.contains(.given) { methodReturnValues = [] }
		if scopes.contains(.perform) { methodPerformValues = [] }
	}

	open func setEventHandler(qos: DispatchQoS, flags: DispatchWorkItemFlags, handler: DispatchSource.DispatchSourceHandler?) {
		addInvocation(.m_setEventHandler__qos_qosflags_flagshandler_handler(
			Parameter<DispatchQoS>.value(qos),
			Parameter<DispatchWorkItemFlags>.value(flags),
			Parameter<DispatchSource.DispatchSourceHandler?>.value(handler)
		))
		let perform = methodPerformValue(.m_setEventHandler__qos_qosflags_flagshandler_handler(
			Parameter<DispatchQoS>.value(qos),
			Parameter<DispatchWorkItemFlags>.value(flags),
			Parameter<DispatchSource.DispatchSourceHandler?>.value(handler)
		)) as? (DispatchQoS, DispatchWorkItemFlags, DispatchSource.DispatchSourceHandler?) -> Void
		perform?(qos, flags, handler)
	}

	open func activate() {
		addInvocation(.m_activate)
		let perform = methodPerformValue(.m_activate) as? () -> Void
		perform?()
	}

	open func setEventHandler(handler: DispatchSource.DispatchSourceHandler?) {
		addInvocation(.m_setEventHandler__handler_handler(Parameter<DispatchSource.DispatchSourceHandler?>.value(handler)))
		let perform =
			methodPerformValue(.m_setEventHandler__handler_handler(Parameter<DispatchSource.DispatchSourceHandler?>.value(handler))) as? (
				DispatchSource
					.DispatchSourceHandler?
			) -> Void
		perform?(handler)
	}

	fileprivate enum MethodType {
		case m_setEventHandler__qos_qosflags_flagshandler_handler(
			Parameter<DispatchQoS>,
			Parameter<DispatchWorkItemFlags>,
			Parameter<DispatchSource.DispatchSourceHandler?>
		)
		case m_activate
		case m_setEventHandler__handler_handler(Parameter<DispatchSource.DispatchSourceHandler?>)

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (
				.m_setEventHandler__qos_qosflags_flagshandler_handler(lhsQos, lhsFlags, lhsHandler),
				.m_setEventHandler__qos_qosflags_flagshandler_handler(rhsQos, rhsFlags, rhsHandler)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsQos, rhs: rhsQos, with: matcher), lhsQos, rhsQos, "qos"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFlags, rhs: rhsFlags, with: matcher), lhsFlags, rhsFlags, "flags"))
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsHandler, rhs: rhsHandler, with: matcher), lhsHandler, rhsHandler, "handler"))
				return Matcher.ComparisonResult(results)

			case (.m_activate, .m_activate): return .match

			case let (.m_setEventHandler__handler_handler(lhsHandler), .m_setEventHandler__handler_handler(rhsHandler)):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsHandler, rhs: rhsHandler, with: matcher), lhsHandler, rhsHandler, "handler"))
				return Matcher.ComparisonResult(results)
			default: return .none
			}
		}

		func intValue() -> Int {
			switch self {
			case let .m_setEventHandler__qos_qosflags_flagshandler_handler(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case .m_activate: return 0
			case let .m_setEventHandler__handler_handler(p0): return p0.intValue
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_setEventHandler__qos_qosflags_flagshandler_handler: return ".setEventHandler(qos:flags:handler:)"
			case .m_activate: return ".activate()"
			case .m_setEventHandler__handler_handler: return ".setEventHandler(handler:)"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func setEventHandler(
			qos: Parameter<DispatchQoS>,
			flags: Parameter<DispatchWorkItemFlags>,
			handler: Parameter<DispatchSource.DispatchSourceHandler?>
		) -> Verify { return Verify(method: .m_setEventHandler__qos_qosflags_flagshandler_handler(qos, flags, handler)) }
		public static func activate() -> Verify { return Verify(method: .m_activate) }
		public static func setEventHandler(handler: Parameter<DispatchSource.DispatchSourceHandler?>)
			-> Verify { return Verify(method: .m_setEventHandler__handler_handler(handler)) }
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func setEventHandler(
			qos: Parameter<DispatchQoS>,
			flags: Parameter<DispatchWorkItemFlags>,
			handler: Parameter<DispatchSource.DispatchSourceHandler?>,
			perform: @escaping (DispatchQoS, DispatchWorkItemFlags, DispatchSource.DispatchSourceHandler?) -> Void
		) -> Perform {
			return Perform(method: .m_setEventHandler__qos_qosflags_flagshandler_handler(qos, flags, handler), performs: perform)
		}

		public static func activate(perform: @escaping () -> Void) -> Perform {
			return Perform(method: .m_activate, performs: perform)
		}

		public static func setEventHandler(
			handler: Parameter<DispatchSource.DispatchSourceHandler?>,
			perform: @escaping (DispatchSource.DispatchSourceHandler?) -> Void
		) -> Perform {
			return Perform(method: .m_setEventHandler__handler_handler(handler), performs: perform)
		}
	}

	public func given(_ method: Given) {
		methodReturnValues.append(method)
	}

	public func perform(_ method: Perform) {
		methodPerformValues.append(method)
		methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
	}

	public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
		let fullMatches = matchingCalls(method, file: file, line: line)
		let success = count.matches(fullMatches)
		let assertionName = method.method.assertionName()
		let feedback: String = {
			guard !success else { return "" }
			return Utils.closestCallsMessage(
				for: self.invocations.map { invocation in
					matcher.set(file: file, line: line)
					defer { matcher.clearFileAndLine() }
					return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
				},
				name: assertionName
			)
		}()
		MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
	}

	private func addInvocation(_ call: MethodType) {
		self.queue.sync { invocations.append(call) }
	}

	private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
		let matched = candidates
			.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
		guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
		return product
	}

	private func methodPerformValue(_ method: MethodType) -> Any? {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
		return matched?.performs
	}

	private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
		matcher.set(file: file ?? self.file, line: line ?? self.line)
		defer { matcher.clearFileAndLine() }
		return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
	}

	private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
		return matchingCalls(method.method, file: file, line: line).count
	}

	private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			onFatalFailure(message)
			Failure(message)
		}
	}

	private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			return nil
		}
	}

	private func onFatalFailure(_ message: String) {
		guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
		SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
	}
}

// MARK: - ProcessProtocol

open class ProcessProtocolMock: ProcessProtocol, Mock {
	public init(
		sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst,
		stubbing stubbingPolicy: StubbingPolicy = .wrap,
		file: StaticString = #file,
		line: UInt = #line
	) {
		SwiftyMockyTestObserver.setup()
		self.sequencingPolicy = sequencingPolicy
		self.stubbingPolicy = stubbingPolicy
		self.file = file
		self.line = line
	}

	var matcher: Matcher = .default
	var stubbingPolicy: StubbingPolicy = .wrap
	var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

	private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
	private var invocations: [MethodType] = []
	private var methodReturnValues: [Given] = []
	private var methodPerformValues: [Perform] = []
	private var file: StaticString?
	private var line: UInt?

	public typealias PropertyStub = Given
	public typealias MethodStub = Given
	public typealias SubscriptStub = Given

	/// Convenience method - call setupMock() to extend debug information when failure occurs
	public func setupMock(file: StaticString = #file, line: UInt = #line) {
		self.file = file
		self.line = line
	}

	/// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
	public func resetMock(_ scopes: MockScope...) {
		let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
		if scopes.contains(.invocation) { invocations = [] }
		if scopes.contains(.given) { methodReturnValues = [] }
		if scopes.contains(.perform) { methodPerformValues = [] }
	}

	public var isRunning: Bool {
		invocations
			.append(.p_isRunning_get); return __p_isRunning ??
			givenGetterValue(.p_isRunning_get, "ProcessProtocolMock - stub value for isRunning was not defined")
	}

	private var __p_isRunning: Bool?

	public var debugDescription: String { invocations.append(.p_debugDescription_get); return __p_debugDescription ?? givenGetterValue(
		.p_debugDescription_get,
		"ProcessProtocolMock - stub value for debugDescription was not defined"
	) }

	private var __p_debugDescription: String?

	public var processIdentifier: Int32 { invocations.append(.p_processIdentifier_get); return __p_processIdentifier ?? givenGetterValue(
		.p_processIdentifier_get,
		"ProcessProtocolMock - stub value for processIdentifier was not defined"
	) }

	private var __p_processIdentifier: Int32?

	public var executableURL: URL? { invocations.append(.p_executableURL_get); return __p_executableURL ?? optionalGivenGetterValue(
		.p_executableURL_get,
		"ProcessProtocolMock - stub value for executableURL was not defined"
	) }

	private var __p_executableURL: URL?

	public var executableName: String? { invocations.append(.p_executableName_get); return __p_executableName ?? optionalGivenGetterValue(
		.p_executableName_get,
		"ProcessProtocolMock - stub value for executableName was not defined"
	) }

	private var __p_executableName: String?

	open func interrupt() {
		addInvocation(.m_interrupt)
		let perform = methodPerformValue(.m_interrupt) as? () -> Void
		perform?()
	}

	open func waitUntilExit() {
		addInvocation(.m_waitUntilExit)
		let perform = methodPerformValue(.m_waitUntilExit) as? () -> Void
		perform?()
	}

	fileprivate enum MethodType {
		case m_interrupt
		case m_waitUntilExit
		case p_isRunning_get
		case p_debugDescription_get
		case p_processIdentifier_get
		case p_executableURL_get
		case p_executableName_get

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case (.m_interrupt, .m_interrupt): return .match

			case (.m_waitUntilExit, .m_waitUntilExit): return .match
			case (.p_isRunning_get, .p_isRunning_get): return Matcher.ComparisonResult.match
			case (.p_debugDescription_get, .p_debugDescription_get): return Matcher.ComparisonResult.match
			case (.p_processIdentifier_get, .p_processIdentifier_get): return Matcher.ComparisonResult.match
			case (.p_executableURL_get, .p_executableURL_get): return Matcher.ComparisonResult.match
			case (.p_executableName_get, .p_executableName_get): return Matcher.ComparisonResult.match
			default: return .none
			}
		}

		func intValue() -> Int {
			switch self {
			case .m_interrupt: return 0
			case .m_waitUntilExit: return 0
			case .p_isRunning_get: return 0
			case .p_debugDescription_get: return 0
			case .p_processIdentifier_get: return 0
			case .p_executableURL_get: return 0
			case .p_executableName_get: return 0
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_interrupt: return ".interrupt()"
			case .m_waitUntilExit: return ".waitUntilExit()"
			case .p_isRunning_get: return "[get] .isRunning"
			case .p_debugDescription_get: return "[get] .debugDescription"
			case .p_processIdentifier_get: return "[get] .processIdentifier"
			case .p_executableURL_get: return "[get] .executableURL"
			case .p_executableName_get: return "[get] .executableName"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func isRunning(getter defaultValue: Bool...) -> PropertyStub {
			return Given(method: .p_isRunning_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func debugDescription(getter defaultValue: String...) -> PropertyStub {
			return Given(method: .p_debugDescription_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func processIdentifier(getter defaultValue: Int32...) -> PropertyStub {
			return Given(method: .p_processIdentifier_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func executableURL(getter defaultValue: URL?...) -> PropertyStub {
			return Given(method: .p_executableURL_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func executableName(getter defaultValue: String?...) -> PropertyStub {
			return Given(method: .p_executableName_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func interrupt() -> Verify { return Verify(method: .m_interrupt) }
		public static func waitUntilExit() -> Verify { return Verify(method: .m_waitUntilExit) }
		public static var isRunning: Verify { return Verify(method: .p_isRunning_get) }
		public static var debugDescription: Verify { return Verify(method: .p_debugDescription_get) }
		public static var processIdentifier: Verify { return Verify(method: .p_processIdentifier_get) }
		public static var executableURL: Verify { return Verify(method: .p_executableURL_get) }
		public static var executableName: Verify { return Verify(method: .p_executableName_get) }
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func interrupt(perform: @escaping () -> Void) -> Perform {
			return Perform(method: .m_interrupt, performs: perform)
		}

		public static func waitUntilExit(perform: @escaping () -> Void) -> Perform {
			return Perform(method: .m_waitUntilExit, performs: perform)
		}
	}

	public func given(_ method: Given) {
		methodReturnValues.append(method)
	}

	public func perform(_ method: Perform) {
		methodPerformValues.append(method)
		methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
	}

	public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
		let fullMatches = matchingCalls(method, file: file, line: line)
		let success = count.matches(fullMatches)
		let assertionName = method.method.assertionName()
		let feedback: String = {
			guard !success else { return "" }
			return Utils.closestCallsMessage(
				for: self.invocations.map { invocation in
					matcher.set(file: file, line: line)
					defer { matcher.clearFileAndLine() }
					return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
				},
				name: assertionName
			)
		}()
		MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
	}

	private func addInvocation(_ call: MethodType) {
		self.queue.sync { invocations.append(call) }
	}

	private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
		let matched = candidates
			.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
		guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
		return product
	}

	private func methodPerformValue(_ method: MethodType) -> Any? {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
		return matched?.performs
	}

	private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
		matcher.set(file: file ?? self.file, line: line ?? self.line)
		defer { matcher.clearFileAndLine() }
		return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
	}

	private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
		return matchingCalls(method.method, file: file, line: line).count
	}

	private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			onFatalFailure(message)
			Failure(message)
		}
	}

	private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			return nil
		}
	}

	private func onFatalFailure(_ message: String) {
		guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
		SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
	}
}

// MARK: - ShellExecuting

open class ShellExecutingMock: ShellExecuting, Mock {
	public init(
		sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst,
		stubbing stubbingPolicy: StubbingPolicy = .wrap,
		file: StaticString = #file,
		line: UInt = #line
	) {
		SwiftyMockyTestObserver.setup()
		self.sequencingPolicy = sequencingPolicy
		self.stubbingPolicy = stubbingPolicy
		self.file = file
		self.line = line
	}

	var matcher: Matcher = .default
	var stubbingPolicy: StubbingPolicy = .wrap
	var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

	private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
	private var invocations: [MethodType] = []
	private var methodReturnValues: [Given] = []
	private var methodPerformValues: [Perform] = []
	private var file: StaticString?
	private var line: UInt?

	public typealias PropertyStub = Given
	public typealias MethodStub = Given
	public typealias SubscriptStub = Given

	/// Convenience method - call setupMock() to extend debug information when failure occurs
	public func setupMock(file: StaticString = #file, line: UInt = #line) {
		self.file = file
		self.line = line
	}

	/// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
	public func resetMock(_ scopes: MockScope...) {
		let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
		if scopes.contains(.invocation) { invocations = [] }
		if scopes.contains(.given) { methodReturnValues = [] }
		if scopes.contains(.perform) { methodPerformValues = [] }
	}

	open func run(command: String, options: ShellCommandOptions, file: String, line: UInt) throws -> ShellOutput {
		addInvocation(.m_run__command_commandoptions_optionsfile_fileline_line(
			Parameter<String>.value(command),
			Parameter<ShellCommandOptions>.value(options),
			Parameter<String>.value(file),
			Parameter<UInt>.value(line)
		))
		let perform = methodPerformValue(.m_run__command_commandoptions_optionsfile_fileline_line(
			Parameter<String>.value(command),
			Parameter<ShellCommandOptions>.value(options),
			Parameter<String>.value(file),
			Parameter<UInt>.value(line)
		)) as? (String, ShellCommandOptions, String, UInt) -> Void
		perform?(command, options, file, line)
		var __value: ShellOutput
		do {
			__value = try methodReturnValue(.m_run__command_commandoptions_optionsfile_fileline_line(
				Parameter<String>.value(command),
				Parameter<ShellCommandOptions>.value(options),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for run(command: String, options: ShellCommandOptions, file: String, line: UInt). Use given")
			Failure("Stub return value not specified for run(command: String, options: ShellCommandOptions, file: String, line: UInt). Use given")
		} catch {
			throw error
		}
		return __value
	}

	@discardableResult
	open func run(
		_ command: String,
		log logType: ShellCommandLogType,
		logPrefix: String? = nil,
		logStdErrToFile: AbsolutePath? = nil,
		maskSubstringsInLog: [String] = [],
		executionTimeout: TimeInterval? = nil,
		shouldIgnoreNonZeroExitCode: @escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool = { _, _ in false },
		silentStdErrMessages: Bool = false,
		file: String = #file,
		line: UInt = #line
	) throws -> ShellOutput {
		addInvocation(
			.m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
				Parameter<String>.value(command),
				Parameter<ShellCommandLogType>.value(logType),
				Parameter<String?>.value(logPrefix),
				Parameter<AbsolutePath?>.value(logStdErrToFile),
				Parameter<[String]>.value(maskSubstringsInLog),
				Parameter<TimeInterval?>.value(executionTimeout),
				Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>.value(shouldIgnoreNonZeroExitCode),
				Parameter<Bool>.value(silentStdErrMessages),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)
		)
		let perform =
			methodPerformValue(
				.m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					Parameter<String>.value(command),
					Parameter<ShellCommandLogType>.value(logType),
					Parameter<String?>.value(logPrefix),
					Parameter<AbsolutePath?>.value(logStdErrToFile),
					Parameter<[String]>.value(maskSubstringsInLog),
					Parameter<TimeInterval?>.value(executionTimeout),
					Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>.value(shouldIgnoreNonZeroExitCode),
					Parameter<Bool>.value(silentStdErrMessages),
					Parameter<String>.value(file),
					Parameter<UInt>.value(line)
				)
			) as? (
				String,
				ShellCommandLogType,
				String?,
				AbsolutePath?,
				[String],
				TimeInterval?,
				@escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool,
				Bool,
				String,
				UInt
			) -> Void
		perform?(
			command,
			logType,
			logPrefix,
			logStdErrToFile,
			maskSubstringsInLog,
			executionTimeout,
			shouldIgnoreNonZeroExitCode,
			silentStdErrMessages,
			file,
			line
		)
		var __value: ShellOutput
		do {
			__value =
				try methodReturnValue(
					.m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
						Parameter<String>.value(command),
						Parameter<ShellCommandLogType>.value(logType),
						Parameter<String?>.value(logPrefix),
						Parameter<AbsolutePath?>.value(logStdErrToFile),
						Parameter<[String]>.value(maskSubstringsInLog),
						Parameter<TimeInterval?>.value(executionTimeout),
						Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>.value(shouldIgnoreNonZeroExitCode),
						Parameter<Bool>.value(silentStdErrMessages),
						Parameter<String>.value(file),
						Parameter<UInt>.value(line)
					)
				).casted()
		} catch MockError.notStubed {
			onFatalFailure(
				"Stub return value not specified for run(_ command: String, log logType: ShellCommandLogType, logPrefix: String? = nil, logStdErrToFile: AbsolutePath? = nil, maskSubstringsInLog: [String] = [], executionTimeout: TimeInterval? = nil, shouldIgnoreNonZeroExitCode: @escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool = { _, _ in false }, silentStdErrMessages: Bool = false, file: String = #file, line: UInt = #line). Use given"
			)
			Failure(
				"Stub return value not specified for run(_ command: String, log logType: ShellCommandLogType, logPrefix: String? = nil, logStdErrToFile: AbsolutePath? = nil, maskSubstringsInLog: [String] = [], executionTimeout: TimeInterval? = nil, shouldIgnoreNonZeroExitCode: @escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool = { _, _ in false }, silentStdErrMessages: Bool = false, file: String = #file, line: UInt = #line). Use given"
			)
		} catch {
			throw error
		}
		return __value
	}

	@discardableResult
	open func run(
		_ commandArray: [String],
		log logType: ShellCommandLogType,
		logPrefix: String? = nil,
		logStdErrToFile: AbsolutePath? = nil,
		maskSubstringsInLog: [String] = [],
		executionTimeout: TimeInterval? = nil,
		shouldIgnoreNonZeroExitCode: @escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool = { _, _ in false },
		silentStdErrMessages: Bool = false,
		file: String = #file,
		line: UInt = #line
	) throws -> ShellOutput {
		addInvocation(
			.m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
				Parameter<[String]>.value(commandArray),
				Parameter<ShellCommandLogType>.value(logType),
				Parameter<String?>.value(logPrefix),
				Parameter<AbsolutePath?>.value(logStdErrToFile),
				Parameter<[String]>.value(maskSubstringsInLog),
				Parameter<TimeInterval?>.value(executionTimeout),
				Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>.value(shouldIgnoreNonZeroExitCode),
				Parameter<Bool>.value(silentStdErrMessages),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)
		)
		let perform =
			methodPerformValue(
				.m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					Parameter<[String]>.value(commandArray),
					Parameter<ShellCommandLogType>.value(logType),
					Parameter<String?>.value(logPrefix),
					Parameter<AbsolutePath?>.value(logStdErrToFile),
					Parameter<[String]>.value(maskSubstringsInLog),
					Parameter<TimeInterval?>.value(executionTimeout),
					Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>.value(shouldIgnoreNonZeroExitCode),
					Parameter<Bool>.value(silentStdErrMessages),
					Parameter<String>.value(file),
					Parameter<UInt>.value(line)
				)
			) as? (
				[String],
				ShellCommandLogType,
				String?,
				AbsolutePath?,
				[String],
				TimeInterval?,
				@escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool,
				Bool,
				String,
				UInt
			) -> Void
		perform?(
			commandArray,
			logType,
			logPrefix,
			logStdErrToFile,
			maskSubstringsInLog,
			executionTimeout,
			shouldIgnoreNonZeroExitCode,
			silentStdErrMessages,
			file,
			line
		)
		var __value: ShellOutput
		do {
			__value =
				try methodReturnValue(
					.m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
						Parameter<[String]>.value(commandArray),
						Parameter<ShellCommandLogType>.value(logType),
						Parameter<String?>.value(logPrefix),
						Parameter<AbsolutePath?>.value(logStdErrToFile),
						Parameter<[String]>.value(maskSubstringsInLog),
						Parameter<TimeInterval?>.value(executionTimeout),
						Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>.value(shouldIgnoreNonZeroExitCode),
						Parameter<Bool>.value(silentStdErrMessages),
						Parameter<String>.value(file),
						Parameter<UInt>.value(line)
					)
				).casted()
		} catch MockError.notStubed {
			onFatalFailure(
				"Stub return value not specified for run(_ commandArray: [String], log logType: ShellCommandLogType, logPrefix: String? = nil, logStdErrToFile: AbsolutePath? = nil, maskSubstringsInLog: [String] = [], executionTimeout: TimeInterval? = nil, shouldIgnoreNonZeroExitCode: @escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool = { _, _ in false }, silentStdErrMessages: Bool = false, file: String = #file, line: UInt = #line). Use given"
			)
			Failure(
				"Stub return value not specified for run(_ commandArray: [String], log logType: ShellCommandLogType, logPrefix: String? = nil, logStdErrToFile: AbsolutePath? = nil, maskSubstringsInLog: [String] = [], executionTimeout: TimeInterval? = nil, shouldIgnoreNonZeroExitCode: @escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool = { _, _ in false }, silentStdErrMessages: Bool = false, file: String = #file, line: UInt = #line). Use given"
			)
		} catch {
			throw error
		}
		return __value
	}

	fileprivate enum MethodType {
		case m_run__command_commandoptions_optionsfile_fileline_line(
			Parameter<String>,
			Parameter<ShellCommandOptions>,
			Parameter<String>,
			Parameter<UInt>
		)
		case m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
			Parameter<String>,
			Parameter<ShellCommandLogType>,
			Parameter<String?>,
			Parameter<AbsolutePath?>,
			Parameter<[String]>,
			Parameter<TimeInterval?>,
			Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			Parameter<Bool>,
			Parameter<String>,
			Parameter<UInt>
		)
		case m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
			Parameter<[String]>,
			Parameter<ShellCommandLogType>,
			Parameter<String?>,
			Parameter<AbsolutePath?>,
			Parameter<[String]>,
			Parameter<TimeInterval?>,
			Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			Parameter<Bool>,
			Parameter<String>,
			Parameter<UInt>
		)

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (
				.m_run__command_commandoptions_optionsfile_fileline_line(lhsCommand, lhsOptions, lhsFile, lhsLine),
				.m_run__command_commandoptions_optionsfile_fileline_line(rhsCommand, rhsOptions, rhsFile, rhsLine)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCommand, rhs: rhsCommand, with: matcher), lhsCommand, rhsCommand, "command"))
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsOptions, rhs: rhsOptions, with: matcher), lhsOptions, rhsOptions, "options"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					lhsCommand,
					lhsLogtype,
					lhsLogprefix,
					lhsLogstderrtofile,
					lhsMasksubstringsinlog,
					lhsExecutiontimeout,
					lhsShouldignorenonzeroexitcode,
					lhsSilentstderrmessages,
					lhsFile,
					lhsLine
				),
				.m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					rhsCommand,
					rhsLogtype,
					rhsLogprefix,
					rhsLogstderrtofile,
					rhsMasksubstringsinlog,
					rhsExecutiontimeout,
					rhsShouldignorenonzeroexitcode,
					rhsSilentstderrmessages,
					rhsFile,
					rhsLine
				)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsCommand, rhs: rhsCommand, with: matcher), lhsCommand, rhsCommand, "_ command")
					)
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsLogtype, rhs: rhsLogtype, with: matcher), lhsLogtype, rhsLogtype, "log logType")
					)
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsLogprefix, rhs: rhsLogprefix, with: matcher), lhsLogprefix, rhsLogprefix, "logPrefix")
					)
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsLogstderrtofile, rhs: rhsLogstderrtofile, with: matcher),
					lhsLogstderrtofile,
					rhsLogstderrtofile,
					"logStdErrToFile"
				))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsMasksubstringsinlog, rhs: rhsMasksubstringsinlog, with: matcher),
					lhsMasksubstringsinlog,
					rhsMasksubstringsinlog,
					"maskSubstringsInLog"
				))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsExecutiontimeout, rhs: rhsExecutiontimeout, with: matcher),
					lhsExecutiontimeout,
					rhsExecutiontimeout,
					"executionTimeout"
				))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsShouldignorenonzeroexitcode, rhs: rhsShouldignorenonzeroexitcode, with: matcher),
					lhsShouldignorenonzeroexitcode,
					rhsShouldignorenonzeroexitcode,
					"shouldIgnoreNonZeroExitCode"
				))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsSilentstderrmessages, rhs: rhsSilentstderrmessages, with: matcher),
					lhsSilentstderrmessages,
					rhsSilentstderrmessages,
					"silentStdErrMessages"
				))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					lhsCommandarray,
					lhsLogtype,
					lhsLogprefix,
					lhsLogstderrtofile,
					lhsMasksubstringsinlog,
					lhsExecutiontimeout,
					lhsShouldignorenonzeroexitcode,
					lhsSilentstderrmessages,
					lhsFile,
					lhsLine
				),
				.m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					rhsCommandarray,
					rhsLogtype,
					rhsLogprefix,
					rhsLogstderrtofile,
					rhsMasksubstringsinlog,
					rhsExecutiontimeout,
					rhsShouldignorenonzeroexitcode,
					rhsSilentstderrmessages,
					rhsFile,
					rhsLine
				)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsCommandarray, rhs: rhsCommandarray, with: matcher),
					lhsCommandarray,
					rhsCommandarray,
					"_ commandArray"
				))
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsLogtype, rhs: rhsLogtype, with: matcher), lhsLogtype, rhsLogtype, "log logType")
					)
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsLogprefix, rhs: rhsLogprefix, with: matcher), lhsLogprefix, rhsLogprefix, "logPrefix")
					)
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsLogstderrtofile, rhs: rhsLogstderrtofile, with: matcher),
					lhsLogstderrtofile,
					rhsLogstderrtofile,
					"logStdErrToFile"
				))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsMasksubstringsinlog, rhs: rhsMasksubstringsinlog, with: matcher),
					lhsMasksubstringsinlog,
					rhsMasksubstringsinlog,
					"maskSubstringsInLog"
				))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsExecutiontimeout, rhs: rhsExecutiontimeout, with: matcher),
					lhsExecutiontimeout,
					rhsExecutiontimeout,
					"executionTimeout"
				))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsShouldignorenonzeroexitcode, rhs: rhsShouldignorenonzeroexitcode, with: matcher),
					lhsShouldignorenonzeroexitcode,
					rhsShouldignorenonzeroexitcode,
					"shouldIgnoreNonZeroExitCode"
				))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsSilentstderrmessages, rhs: rhsSilentstderrmessages, with: matcher),
					lhsSilentstderrmessages,
					rhsSilentstderrmessages,
					"silentStdErrMessages"
				))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)
			default: return .none
			}
		}

		func intValue() -> Int {
			switch self {
			case let .m_run__command_commandoptions_optionsfile_fileline_line(p0, p1, p2, p3): return p0.intValue + p1.intValue + p2.intValue + p3
				.intValue
			case let .m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
				p0,
				p1,
				p2,
				p3,
				p4,
				p5,
				p6,
				p7,
				p8,
				p9
			): return p0.intValue + p1.intValue + p2.intValue + p3.intValue + p4.intValue + p5.intValue + p6.intValue + p7.intValue + p8.intValue + p9
				.intValue
			case let .m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
				p0,
				p1,
				p2,
				p3,
				p4,
				p5,
				p6,
				p7,
				p8,
				p9
			): return p0.intValue + p1.intValue + p2.intValue + p3.intValue + p4.intValue + p5.intValue + p6.intValue + p7.intValue + p8.intValue + p9
				.intValue
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_run__command_commandoptions_optionsfile_fileline_line: return ".run(command:options:file:line:)"
			case .m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line: return ".run(_:log:logPrefix:logStdErrToFile:maskSubstringsInLog:executionTimeout:shouldIgnoreNonZeroExitCode:silentStdErrMessages:file:line:)"
			case .m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line: return ".run(_:log:logPrefix:logStdErrToFile:maskSubstringsInLog:executionTimeout:shouldIgnoreNonZeroExitCode:silentStdErrMessages:file:line:)"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func run(
			command: Parameter<String>,
			options: Parameter<ShellCommandOptions>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willReturn: ShellOutput...
		) -> MethodStub {
			return Given(
				method: .m_run__command_commandoptions_optionsfile_fileline_line(command, options, file, line),
				products: willReturn.map { StubProduct.return($0 as Any) }
			)
		}

		@discardableResult
		public static func run(
			_ command: Parameter<String>,
			log logType: Parameter<ShellCommandLogType>,
			logPrefix: Parameter<String?>,
			logStdErrToFile: Parameter<AbsolutePath?>,
			maskSubstringsInLog: Parameter<[String]>,
			executionTimeout: Parameter<TimeInterval?>,
			shouldIgnoreNonZeroExitCode: Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			silentStdErrMessages: Parameter<Bool>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willReturn: ShellOutput...
		) -> MethodStub {
			return Given(
				method: .m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					command,
					logType,
					logPrefix,
					logStdErrToFile,
					maskSubstringsInLog,
					executionTimeout,
					shouldIgnoreNonZeroExitCode,
					silentStdErrMessages,
					file,
					line
				),
				products: willReturn.map { StubProduct.return($0 as Any) }
			)
		}

		@discardableResult
		public static func run(
			_ commandArray: Parameter<[String]>,
			log logType: Parameter<ShellCommandLogType>,
			logPrefix: Parameter<String?>,
			logStdErrToFile: Parameter<AbsolutePath?>,
			maskSubstringsInLog: Parameter<[String]>,
			executionTimeout: Parameter<TimeInterval?>,
			shouldIgnoreNonZeroExitCode: Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			silentStdErrMessages: Parameter<Bool>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willReturn: ShellOutput...
		) -> MethodStub {
			return Given(
				method: .m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					commandArray,
					logType,
					logPrefix,
					logStdErrToFile,
					maskSubstringsInLog,
					executionTimeout,
					shouldIgnoreNonZeroExitCode,
					silentStdErrMessages,
					file,
					line
				),
				products: willReturn.map { StubProduct.return($0 as Any) }
			)
		}

		public static func run(
			command: Parameter<String>,
			options: Parameter<ShellCommandOptions>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willThrow: Error...
		) -> MethodStub {
			return Given(
				method: .m_run__command_commandoptions_optionsfile_fileline_line(command, options, file, line),
				products: willThrow.map { StubProduct.throw($0) }
			)
		}

		public static func run(
			command: Parameter<String>,
			options: Parameter<ShellCommandOptions>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willProduce: (StubberThrows<ShellOutput>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(
				method: .m_run__command_commandoptions_optionsfile_fileline_line(command, options, file, line),
				products: willThrow.map { StubProduct.throw($0) }
			)
			let stubber = given.stubThrows(for: ShellOutput.self)
			willProduce(stubber)
			return given
		}

		@discardableResult
		public static func run(
			_ command: Parameter<String>,
			log logType: Parameter<ShellCommandLogType>,
			logPrefix: Parameter<String?>,
			logStdErrToFile: Parameter<AbsolutePath?>,
			maskSubstringsInLog: Parameter<[String]>,
			executionTimeout: Parameter<TimeInterval?>,
			shouldIgnoreNonZeroExitCode: Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			silentStdErrMessages: Parameter<Bool>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willThrow: Error...
		) -> MethodStub {
			return Given(
				method: .m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					command,
					logType,
					logPrefix,
					logStdErrToFile,
					maskSubstringsInLog,
					executionTimeout,
					shouldIgnoreNonZeroExitCode,
					silentStdErrMessages,
					file,
					line
				),
				products: willThrow.map { StubProduct.throw($0) }
			)
		}

		@discardableResult
		public static func run(
			_ command: Parameter<String>,
			log logType: Parameter<ShellCommandLogType>,
			logPrefix: Parameter<String?>,
			logStdErrToFile: Parameter<AbsolutePath?>,
			maskSubstringsInLog: Parameter<[String]>,
			executionTimeout: Parameter<TimeInterval?>,
			shouldIgnoreNonZeroExitCode: Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			silentStdErrMessages: Parameter<Bool>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willProduce: (StubberThrows<ShellOutput>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(
				method: .m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					command,
					logType,
					logPrefix,
					logStdErrToFile,
					maskSubstringsInLog,
					executionTimeout,
					shouldIgnoreNonZeroExitCode,
					silentStdErrMessages,
					file,
					line
				),
				products: willThrow.map { StubProduct.throw($0) }
			)
			let stubber = given.stubThrows(for: ShellOutput.self)
			willProduce(stubber)
			return given
		}

		@discardableResult
		public static func run(
			_ commandArray: Parameter<[String]>,
			log logType: Parameter<ShellCommandLogType>,
			logPrefix: Parameter<String?>,
			logStdErrToFile: Parameter<AbsolutePath?>,
			maskSubstringsInLog: Parameter<[String]>,
			executionTimeout: Parameter<TimeInterval?>,
			shouldIgnoreNonZeroExitCode: Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			silentStdErrMessages: Parameter<Bool>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willThrow: Error...
		) -> MethodStub {
			return Given(
				method: .m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					commandArray,
					logType,
					logPrefix,
					logStdErrToFile,
					maskSubstringsInLog,
					executionTimeout,
					shouldIgnoreNonZeroExitCode,
					silentStdErrMessages,
					file,
					line
				),
				products: willThrow.map { StubProduct.throw($0) }
			)
		}

		@discardableResult
		public static func run(
			_ commandArray: Parameter<[String]>,
			log logType: Parameter<ShellCommandLogType>,
			logPrefix: Parameter<String?>,
			logStdErrToFile: Parameter<AbsolutePath?>,
			maskSubstringsInLog: Parameter<[String]>,
			executionTimeout: Parameter<TimeInterval?>,
			shouldIgnoreNonZeroExitCode: Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			silentStdErrMessages: Parameter<Bool>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willProduce: (StubberThrows<ShellOutput>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(
				method: .m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					commandArray,
					logType,
					logPrefix,
					logStdErrToFile,
					maskSubstringsInLog,
					executionTimeout,
					shouldIgnoreNonZeroExitCode,
					silentStdErrMessages,
					file,
					line
				),
				products: willThrow.map { StubProduct.throw($0) }
			)
			let stubber = given.stubThrows(for: ShellOutput.self)
			willProduce(stubber)
			return given
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func run(
			command: Parameter<String>,
			options: Parameter<ShellCommandOptions>,
			file: Parameter<String>,
			line: Parameter<UInt>
		)
			-> Verify { return Verify(method: .m_run__command_commandoptions_optionsfile_fileline_line(command, options, file, line)) }
		@discardableResult
		public static func run(
			_ command: Parameter<String>,
			log logType: Parameter<ShellCommandLogType>,
			logPrefix: Parameter<String?>,
			logStdErrToFile: Parameter<AbsolutePath?>,
			maskSubstringsInLog: Parameter<[String]>,
			executionTimeout: Parameter<TimeInterval?>,
			shouldIgnoreNonZeroExitCode: Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			silentStdErrMessages: Parameter<Bool>,
			file: Parameter<String>,
			line: Parameter<UInt>
		)
			-> Verify {
			return Verify(
				method: .m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					command,
					logType,
					logPrefix,
					logStdErrToFile,
					maskSubstringsInLog,
					executionTimeout,
					shouldIgnoreNonZeroExitCode,
					silentStdErrMessages,
					file,
					line
				)
			)
		}

		@discardableResult
		public static func run(
			_ commandArray: Parameter<[String]>,
			log logType: Parameter<ShellCommandLogType>,
			logPrefix: Parameter<String?>,
			logStdErrToFile: Parameter<AbsolutePath?>,
			maskSubstringsInLog: Parameter<[String]>,
			executionTimeout: Parameter<TimeInterval?>,
			shouldIgnoreNonZeroExitCode: Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			silentStdErrMessages: Parameter<Bool>,
			file: Parameter<String>,
			line: Parameter<UInt>
		)
			-> Verify {
			return Verify(
				method: .m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					commandArray,
					logType,
					logPrefix,
					logStdErrToFile,
					maskSubstringsInLog,
					executionTimeout,
					shouldIgnoreNonZeroExitCode,
					silentStdErrMessages,
					file,
					line
				)
			)
		}
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func run(
			command: Parameter<String>,
			options: Parameter<ShellCommandOptions>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (String, ShellCommandOptions, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_run__command_commandoptions_optionsfile_fileline_line(command, options, file, line), performs: perform)
		}

		@discardableResult
		public static func run(
			_ command: Parameter<String>,
			log logType: Parameter<ShellCommandLogType>,
			logPrefix: Parameter<String?>,
			logStdErrToFile: Parameter<AbsolutePath?>,
			maskSubstringsInLog: Parameter<[String]>,
			executionTimeout: Parameter<TimeInterval?>,
			shouldIgnoreNonZeroExitCode: Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			silentStdErrMessages: Parameter<Bool>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (
				String,
				ShellCommandLogType,
				String?,
				AbsolutePath?,
				[String],
				TimeInterval?,
				@escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool,
				Bool,
				String,
				UInt
			) -> Void
		) -> Perform {
			return Perform(
				method: .m_run__commandlog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					command,
					logType,
					logPrefix,
					logStdErrToFile,
					maskSubstringsInLog,
					executionTimeout,
					shouldIgnoreNonZeroExitCode,
					silentStdErrMessages,
					file,
					line
				),
				performs: perform
			)
		}

		@discardableResult
		public static func run(
			_ commandArray: Parameter<[String]>,
			log logType: Parameter<ShellCommandLogType>,
			logPrefix: Parameter<String?>,
			logStdErrToFile: Parameter<AbsolutePath?>,
			maskSubstringsInLog: Parameter<[String]>,
			executionTimeout: Parameter<TimeInterval?>,
			shouldIgnoreNonZeroExitCode: Parameter<(_ output: ShellOutput, _ exitCode: Int32) -> Bool>,
			silentStdErrMessages: Parameter<Bool>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (
				[String],
				ShellCommandLogType,
				String?,
				AbsolutePath?,
				[String],
				TimeInterval?,
				@escaping (_ output: ShellOutput, _ exitCode: Int32) -> Bool,
				Bool,
				String,
				UInt
			) -> Void
		) -> Perform {
			return Perform(
				method: .m_run__commandArraylog_logTypelogPrefix_logPrefixlogStdErrToFile_logStdErrToFilemaskSubstringsInLog_maskSubstringsInLogexecutionTimeout_executionTimeoutshouldIgnoreNonZeroExitCode_shouldIgnoreNonZeroExitCodesilentStdErrMessages_silentStdErrMessagesfile_fileline_line(
					commandArray,
					logType,
					logPrefix,
					logStdErrToFile,
					maskSubstringsInLog,
					executionTimeout,
					shouldIgnoreNonZeroExitCode,
					silentStdErrMessages,
					file,
					line
				),
				performs: perform
			)
		}
	}

	public func given(_ method: Given) {
		methodReturnValues.append(method)
	}

	public func perform(_ method: Perform) {
		methodPerformValues.append(method)
		methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
	}

	public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
		let fullMatches = matchingCalls(method, file: file, line: line)
		let success = count.matches(fullMatches)
		let assertionName = method.method.assertionName()
		let feedback: String = {
			guard !success else { return "" }
			return Utils.closestCallsMessage(
				for: self.invocations.map { invocation in
					matcher.set(file: file, line: line)
					defer { matcher.clearFileAndLine() }
					return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
				},
				name: assertionName
			)
		}()
		MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
	}

	private func addInvocation(_ call: MethodType) {
		self.queue.sync { invocations.append(call) }
	}

	private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
		let matched = candidates
			.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
		guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
		return product
	}

	private func methodPerformValue(_ method: MethodType) -> Any? {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
		return matched?.performs
	}

	private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
		matcher.set(file: file ?? self.file, line: line ?? self.line)
		defer { matcher.clearFileAndLine() }
		return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
	}

	private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
		return matchingCalls(method.method, file: file, line: line).count
	}

	private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			onFatalFailure(message)
			Failure(message)
		}
	}

	private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			return nil
		}
	}

	private func onFatalFailure(_ message: String) {
		guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
		SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
	}
}

// MARK: - SigIntHandling

open class SigIntHandlingMock: SigIntHandling, Mock {
	public init(
		sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst,
		stubbing stubbingPolicy: StubbingPolicy = .wrap,
		file: StaticString = #file,
		line: UInt = #line
	) {
		SwiftyMockyTestObserver.setup()
		self.sequencingPolicy = sequencingPolicy
		self.stubbingPolicy = stubbingPolicy
		self.file = file
		self.line = line
	}

	var matcher: Matcher = .default
	var stubbingPolicy: StubbingPolicy = .wrap
	var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

	private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
	private var invocations: [MethodType] = []
	private var methodReturnValues: [Given] = []
	private var methodPerformValues: [Perform] = []
	private var file: StaticString?
	private var line: UInt?

	public typealias PropertyStub = Given
	public typealias MethodStub = Given
	public typealias SubscriptStub = Given

	/// Convenience method - call setupMock() to extend debug information when failure occurs
	public func setupMock(file: StaticString = #file, line: UInt = #line) {
		self.file = file
		self.line = line
	}

	/// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
	public func resetMock(_ scopes: MockScope...) {
		let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
		if scopes.contains(.invocation) { invocations = [] }
		if scopes.contains(.given) { methodReturnValues = [] }
		if scopes.contains(.perform) { methodPerformValues = [] }
	}

	open func addSubprocess(_ process: ProcessProtocol) {
		addInvocation(.m_addSubprocess__process(Parameter<ProcessProtocol>.value(process)))
		let perform = methodPerformValue(.m_addSubprocess__process(Parameter<ProcessProtocol>.value(process))) as? (ProcessProtocol) -> Void
		perform?(process)
	}

	fileprivate enum MethodType {
		case m_addSubprocess__process(Parameter<ProcessProtocol>)

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (.m_addSubprocess__process(lhsProcess), .m_addSubprocess__process(rhsProcess)):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsProcess, rhs: rhsProcess, with: matcher), lhsProcess, rhsProcess, "_ process")
					)
				return Matcher.ComparisonResult(results)
			}
		}

		func intValue() -> Int {
			switch self {
			case let .m_addSubprocess__process(p0): return p0.intValue
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_addSubprocess__process: return ".addSubprocess(_:)"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func addSubprocess(_ process: Parameter<ProcessProtocol>) -> Verify { return Verify(method: .m_addSubprocess__process(process))
		}
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func addSubprocess(_ process: Parameter<ProcessProtocol>, perform: @escaping (ProcessProtocol) -> Void) -> Perform {
			return Perform(method: .m_addSubprocess__process(process), performs: perform)
		}
	}

	public func given(_ method: Given) {
		methodReturnValues.append(method)
	}

	public func perform(_ method: Perform) {
		methodPerformValues.append(method)
		methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
	}

	public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
		let fullMatches = matchingCalls(method, file: file, line: line)
		let success = count.matches(fullMatches)
		let assertionName = method.method.assertionName()
		let feedback: String = {
			guard !success else { return "" }
			return Utils.closestCallsMessage(
				for: self.invocations.map { invocation in
					matcher.set(file: file, line: line)
					defer { matcher.clearFileAndLine() }
					return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
				},
				name: assertionName
			)
		}()
		MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
	}

	private func addInvocation(_ call: MethodType) {
		self.queue.sync { invocations.append(call) }
	}

	private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
		let matched = candidates
			.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
		guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
		return product
	}

	private func methodPerformValue(_ method: MethodType) -> Any? {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
		return matched?.performs
	}

	private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
		matcher.set(file: file ?? self.file, line: line ?? self.line)
		defer { matcher.clearFileAndLine() }
		return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
	}

	private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
		return matchingCalls(method.method, file: file, line: line).count
	}

	private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			onFatalFailure(message)
			Failure(message)
		}
	}

	private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			return nil
		}
	}

	private func onFatalFailure(_ message: String) {
		guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
		SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
	}
}

// MARK: - SignalConfiguring

open class SignalConfiguringMock: SignalConfiguring, Mock {
	public init(
		sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst,
		stubbing stubbingPolicy: StubbingPolicy = .wrap,
		file: StaticString = #file,
		line: UInt = #line
	) {
		SwiftyMockyTestObserver.setup()
		self.sequencingPolicy = sequencingPolicy
		self.stubbingPolicy = stubbingPolicy
		self.file = file
		self.line = line
	}

	var matcher: Matcher = .default
	var stubbingPolicy: StubbingPolicy = .wrap
	var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

	private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
	private var invocations: [MethodType] = []
	private var methodReturnValues: [Given] = []
	private var methodPerformValues: [Perform] = []
	private var file: StaticString?
	private var line: UInt?

	public typealias PropertyStub = Given
	public typealias MethodStub = Given
	public typealias SubscriptStub = Given

	/// Convenience method - call setupMock() to extend debug information when failure occurs
	public func setupMock(file: StaticString = #file, line: UInt = #line) {
		self.file = file
		self.line = line
	}

	/// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
	public func resetMock(_ scopes: MockScope...) {
		let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
		if scopes.contains(.invocation) { invocations = [] }
		if scopes.contains(.given) { methodReturnValues = [] }
		if scopes.contains(.perform) { methodPerformValues = [] }
	}

	open func configure(code: Int32, policy: @escaping sig_t) {
		addInvocation(.m_configure__code_codepolicy_policy(Parameter<Int32>.value(code), Parameter<sig_t>.value(policy)))
		let perform = methodPerformValue(.m_configure__code_codepolicy_policy(Parameter<Int32>.value(code), Parameter<sig_t>.value(policy))) as? (
			Int32,
			@escaping sig_t
		) -> Void
		perform?(code, policy)
	}

	fileprivate enum MethodType {
		case m_configure__code_codepolicy_policy(Parameter<Int32>, Parameter<sig_t>)

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (.m_configure__code_codepolicy_policy(lhsCode, lhsPolicy), .m_configure__code_codepolicy_policy(rhsCode, rhsPolicy)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCode, rhs: rhsCode, with: matcher), lhsCode, rhsCode, "code"))
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPolicy, rhs: rhsPolicy, with: matcher), lhsPolicy, rhsPolicy, "policy"))
				return Matcher.ComparisonResult(results)
			}
		}

		func intValue() -> Int {
			switch self {
			case let .m_configure__code_codepolicy_policy(p0, p1): return p0.intValue + p1.intValue
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_configure__code_codepolicy_policy: return ".configure(code:policy:)"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func configure(
			code: Parameter<Int32>,
			policy: Parameter<sig_t>
		) -> Verify { return Verify(method: .m_configure__code_codepolicy_policy(code, policy)) }
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func configure(
			code: Parameter<Int32>,
			policy: Parameter<sig_t>,
			perform: @escaping (Int32, @escaping sig_t) -> Void
		) -> Perform {
			return Perform(method: .m_configure__code_codepolicy_policy(code, policy), performs: perform)
		}
	}

	public func given(_ method: Given) {
		methodReturnValues.append(method)
	}

	public func perform(_ method: Perform) {
		methodPerformValues.append(method)
		methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
	}

	public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
		let fullMatches = matchingCalls(method, file: file, line: line)
		let success = count.matches(fullMatches)
		let assertionName = method.method.assertionName()
		let feedback: String = {
			guard !success else { return "" }
			return Utils.closestCallsMessage(
				for: self.invocations.map { invocation in
					matcher.set(file: file, line: line)
					defer { matcher.clearFileAndLine() }
					return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
				},
				name: assertionName
			)
		}()
		MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
	}

	private func addInvocation(_ call: MethodType) {
		self.queue.sync { invocations.append(call) }
	}

	private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
		let matched = candidates
			.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
		guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
		return product
	}

	private func methodPerformValue(_ method: MethodType) -> Any? {
		matcher.set(file: self.file, line: self.line)
		defer { matcher.clearFileAndLine() }
		let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
		return matched?.performs
	}

	private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
		matcher.set(file: file ?? self.file, line: line ?? self.line)
		defer { matcher.clearFileAndLine() }
		return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
	}

	private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
		return matchingCalls(method.method, file: file, line: line).count
	}

	private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			onFatalFailure(message)
			Failure(message)
		}
	}

	private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
		do {
			return try methodReturnValue(method).casted()
		} catch {
			return nil
		}
	}

	private func onFatalFailure(_ message: String) {
		guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
		SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
	}
}
