// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0

import Foundation
import PerfectRainbow
@testable import SwiftlaneCoreServices
import SwiftlaneExtensions
import SwiftlaneLogging
import SwiftyMocky
import XCTest

// MARK: - EnvironmentValueReading

open class EnvironmentValueReadingMock: EnvironmentValueReading, Mock {
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

	public var allVariables: [String: String] { invocations.append(.p_allVariables_get); return __p_allVariables ?? givenGetterValue(
		.p_allVariables_get,
		"EnvironmentValueReadingMock - stub value for allVariables was not defined"
	) }

	private var __p_allVariables: [String: String]?

	open func string(_ variableName: ShellEnvKeyRepresentable) throws -> String {
		addInvocation(.m_string__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName)))
		let perform = methodPerformValue(.m_string__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName))) as? (ShellEnvKeyRepresentable)
			-> Void
		perform?(variableName)
		var __value: String
		do {
			__value = try methodReturnValue(.m_string__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for string(_ variableName: ShellEnvKeyRepresentable). Use given")
			Failure("Stub return value not specified for string(_ variableName: ShellEnvKeyRepresentable). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func int(_ variableName: ShellEnvKeyRepresentable) throws -> Int {
		addInvocation(.m_int__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName)))
		let perform = methodPerformValue(.m_int__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName))) as? (ShellEnvKeyRepresentable)
			-> Void
		perform?(variableName)
		var __value: Int
		do {
			__value = try methodReturnValue(.m_int__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for int(_ variableName: ShellEnvKeyRepresentable). Use given")
			Failure("Stub return value not specified for int(_ variableName: ShellEnvKeyRepresentable). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func double(_ variableName: ShellEnvKeyRepresentable) throws -> Double {
		addInvocation(.m_double__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName)))
		let perform = methodPerformValue(.m_double__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName))) as? (ShellEnvKeyRepresentable)
			-> Void
		perform?(variableName)
		var __value: Double
		do {
			__value = try methodReturnValue(.m_double__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for double(_ variableName: ShellEnvKeyRepresentable). Use given")
			Failure("Stub return value not specified for double(_ variableName: ShellEnvKeyRepresentable). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func bool(_ variableName: ShellEnvKeyRepresentable) throws -> Bool {
		addInvocation(.m_bool__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName)))
		let perform = methodPerformValue(.m_bool__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName))) as? (ShellEnvKeyRepresentable)
			-> Void
		perform?(variableName)
		var __value: Bool
		do {
			__value = try methodReturnValue(.m_bool__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for bool(_ variableName: ShellEnvKeyRepresentable). Use given")
			Failure("Stub return value not specified for bool(_ variableName: ShellEnvKeyRepresentable). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func url(_ variableName: ShellEnvKeyRepresentable) throws -> URL {
		addInvocation(.m_url__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName)))
		let perform = methodPerformValue(.m_url__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName))) as? (ShellEnvKeyRepresentable)
			-> Void
		perform?(variableName)
		var __value: URL
		do {
			__value = try methodReturnValue(.m_url__variableName(Parameter<ShellEnvKeyRepresentable>.value(variableName))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for url(_ variableName: ShellEnvKeyRepresentable). Use given")
			Failure("Stub return value not specified for url(_ variableName: ShellEnvKeyRepresentable). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func expandVariables(in string: String) throws -> String {
		addInvocation(.m_expandVariables__in_string(Parameter<String>.value(string)))
		let perform = methodPerformValue(.m_expandVariables__in_string(Parameter<String>.value(string))) as? (String) -> Void
		perform?(string)
		var __value: String
		do {
			__value = try methodReturnValue(.m_expandVariables__in_string(Parameter<String>.value(string))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for expandVariables(in string: String). Use given")
			Failure("Stub return value not specified for expandVariables(in string: String). Use given")
		} catch {
			throw error
		}
		return __value
	}

	fileprivate enum MethodType {
		case m_string__variableName(Parameter<ShellEnvKeyRepresentable>)
		case m_int__variableName(Parameter<ShellEnvKeyRepresentable>)
		case m_double__variableName(Parameter<ShellEnvKeyRepresentable>)
		case m_bool__variableName(Parameter<ShellEnvKeyRepresentable>)
		case m_url__variableName(Parameter<ShellEnvKeyRepresentable>)
		case m_expandVariables__in_string(Parameter<String>)
		case p_allVariables_get

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (.m_string__variableName(lhsVariablename), .m_string__variableName(rhsVariablename)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsVariablename, rhs: rhsVariablename, with: matcher),
					lhsVariablename,
					rhsVariablename,
					"_ variableName"
				))
				return Matcher.ComparisonResult(results)

			case let (.m_int__variableName(lhsVariablename), .m_int__variableName(rhsVariablename)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsVariablename, rhs: rhsVariablename, with: matcher),
					lhsVariablename,
					rhsVariablename,
					"_ variableName"
				))
				return Matcher.ComparisonResult(results)

			case let (.m_double__variableName(lhsVariablename), .m_double__variableName(rhsVariablename)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsVariablename, rhs: rhsVariablename, with: matcher),
					lhsVariablename,
					rhsVariablename,
					"_ variableName"
				))
				return Matcher.ComparisonResult(results)

			case let (.m_bool__variableName(lhsVariablename), .m_bool__variableName(rhsVariablename)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsVariablename, rhs: rhsVariablename, with: matcher),
					lhsVariablename,
					rhsVariablename,
					"_ variableName"
				))
				return Matcher.ComparisonResult(results)

			case let (.m_url__variableName(lhsVariablename), .m_url__variableName(rhsVariablename)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsVariablename, rhs: rhsVariablename, with: matcher),
					lhsVariablename,
					rhsVariablename,
					"_ variableName"
				))
				return Matcher.ComparisonResult(results)

			case let (.m_expandVariables__in_string(lhsString), .m_expandVariables__in_string(rhsString)):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsString, rhs: rhsString, with: matcher), lhsString, rhsString, "in string"))
				return Matcher.ComparisonResult(results)
			case (.p_allVariables_get, .p_allVariables_get): return Matcher.ComparisonResult.match
			default: return .none
			}
		}

		func intValue() -> Int {
			switch self {
			case let .m_string__variableName(p0): return p0.intValue
			case let .m_int__variableName(p0): return p0.intValue
			case let .m_double__variableName(p0): return p0.intValue
			case let .m_bool__variableName(p0): return p0.intValue
			case let .m_url__variableName(p0): return p0.intValue
			case let .m_expandVariables__in_string(p0): return p0.intValue
			case .p_allVariables_get: return 0
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_string__variableName: return ".string(_:)"
			case .m_int__variableName: return ".int(_:)"
			case .m_double__variableName: return ".double(_:)"
			case .m_bool__variableName: return ".bool(_:)"
			case .m_url__variableName: return ".url(_:)"
			case .m_expandVariables__in_string: return ".expandVariables(in:)"
			case .p_allVariables_get: return "[get] .allVariables"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func allVariables(getter defaultValue: [String: String]...) -> PropertyStub {
			return Given(method: .p_allVariables_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func string(_ variableName: Parameter<ShellEnvKeyRepresentable>, willReturn: String...) -> MethodStub {
			return Given(method: .m_string__variableName(variableName), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func int(_ variableName: Parameter<ShellEnvKeyRepresentable>, willReturn: Int...) -> MethodStub {
			return Given(method: .m_int__variableName(variableName), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func double(_ variableName: Parameter<ShellEnvKeyRepresentable>, willReturn: Double...) -> MethodStub {
			return Given(method: .m_double__variableName(variableName), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func bool(_ variableName: Parameter<ShellEnvKeyRepresentable>, willReturn: Bool...) -> MethodStub {
			return Given(method: .m_bool__variableName(variableName), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func url(_ variableName: Parameter<ShellEnvKeyRepresentable>, willReturn: URL...) -> MethodStub {
			return Given(method: .m_url__variableName(variableName), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func expandVariables(in string: Parameter<String>, willReturn: String...) -> MethodStub {
			return Given(method: .m_expandVariables__in_string(string), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func string(_ variableName: Parameter<ShellEnvKeyRepresentable>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_string__variableName(variableName), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func string(_ variableName: Parameter<ShellEnvKeyRepresentable>, willProduce: (StubberThrows<String>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_string__variableName(variableName), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: String.self)
			willProduce(stubber)
			return given
		}

		public static func int(_ variableName: Parameter<ShellEnvKeyRepresentable>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_int__variableName(variableName), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func int(_ variableName: Parameter<ShellEnvKeyRepresentable>, willProduce: (StubberThrows<Int>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_int__variableName(variableName), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Int.self)
			willProduce(stubber)
			return given
		}

		public static func double(_ variableName: Parameter<ShellEnvKeyRepresentable>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_double__variableName(variableName), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func double(_ variableName: Parameter<ShellEnvKeyRepresentable>, willProduce: (StubberThrows<Double>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_double__variableName(variableName), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Double.self)
			willProduce(stubber)
			return given
		}

		public static func bool(_ variableName: Parameter<ShellEnvKeyRepresentable>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_bool__variableName(variableName), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func bool(_ variableName: Parameter<ShellEnvKeyRepresentable>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_bool__variableName(variableName), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Bool.self)
			willProduce(stubber)
			return given
		}

		public static func url(_ variableName: Parameter<ShellEnvKeyRepresentable>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_url__variableName(variableName), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func url(_ variableName: Parameter<ShellEnvKeyRepresentable>, willProduce: (StubberThrows<URL>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_url__variableName(variableName), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: URL.self)
			willProduce(stubber)
			return given
		}

		public static func expandVariables(in string: Parameter<String>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_expandVariables__in_string(string), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func expandVariables(in string: Parameter<String>, willProduce: (StubberThrows<String>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_expandVariables__in_string(string), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: String.self)
			willProduce(stubber)
			return given
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func string(_ variableName: Parameter<ShellEnvKeyRepresentable>)
			-> Verify { return Verify(method: .m_string__variableName(variableName)) }
		public static func int(_ variableName: Parameter<ShellEnvKeyRepresentable>)
			-> Verify { return Verify(method: .m_int__variableName(variableName)) }
		public static func double(_ variableName: Parameter<ShellEnvKeyRepresentable>)
			-> Verify { return Verify(method: .m_double__variableName(variableName)) }
		public static func bool(_ variableName: Parameter<ShellEnvKeyRepresentable>)
			-> Verify { return Verify(method: .m_bool__variableName(variableName)) }
		public static func url(_ variableName: Parameter<ShellEnvKeyRepresentable>)
			-> Verify { return Verify(method: .m_url__variableName(variableName)) }
		public static func expandVariables(in string: Parameter<String>) -> Verify { return Verify(method: .m_expandVariables__in_string(string)) }
		public static var allVariables: Verify { return Verify(method: .p_allVariables_get) }
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func string(
			_ variableName: Parameter<ShellEnvKeyRepresentable>,
			perform: @escaping (ShellEnvKeyRepresentable) -> Void
		) -> Perform {
			return Perform(method: .m_string__variableName(variableName), performs: perform)
		}

		public static func int(
			_ variableName: Parameter<ShellEnvKeyRepresentable>,
			perform: @escaping (ShellEnvKeyRepresentable) -> Void
		) -> Perform {
			return Perform(method: .m_int__variableName(variableName), performs: perform)
		}

		public static func double(
			_ variableName: Parameter<ShellEnvKeyRepresentable>,
			perform: @escaping (ShellEnvKeyRepresentable) -> Void
		) -> Perform {
			return Perform(method: .m_double__variableName(variableName), performs: perform)
		}

		public static func bool(
			_ variableName: Parameter<ShellEnvKeyRepresentable>,
			perform: @escaping (ShellEnvKeyRepresentable) -> Void
		) -> Perform {
			return Perform(method: .m_bool__variableName(variableName), performs: perform)
		}

		public static func url(
			_ variableName: Parameter<ShellEnvKeyRepresentable>,
			perform: @escaping (ShellEnvKeyRepresentable) -> Void
		) -> Perform {
			return Perform(method: .m_url__variableName(variableName), performs: perform)
		}

		public static func expandVariables(in string: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
			return Perform(method: .m_expandVariables__in_string(string), performs: perform)
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

// MARK: - Exiting

open class ExitingMock: Exiting, Mock {
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

	open func exit(with code: Int32) {
		addInvocation(.m_exit__with_code(Parameter<Int32>.value(code)))
		let perform = methodPerformValue(.m_exit__with_code(Parameter<Int32>.value(code))) as? (Int32) -> Void
		perform?(code)
	}

	fileprivate enum MethodType {
		case m_exit__with_code(Parameter<Int32>)

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (.m_exit__with_code(lhsCode), .m_exit__with_code(rhsCode)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCode, rhs: rhsCode, with: matcher), lhsCode, rhsCode, "with code"))
				return Matcher.ComparisonResult(results)
			}
		}

		func intValue() -> Int {
			switch self {
			case let .m_exit__with_code(p0): return p0.intValue
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_exit__with_code: return ".exit(with:)"
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

		public static func exit(with code: Parameter<Int32>) -> Verify { return Verify(method: .m_exit__with_code(code)) }
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func exit(with code: Parameter<Int32>, perform: @escaping (Int32) -> Void) -> Perform {
			return Perform(method: .m_exit__with_code(code), performs: perform)
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

// MARK: - ProcessInfoProtocol

open class ProcessInfoProtocolMock: ProcessInfoProtocol, Mock {
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

	public var environment: [String: String] { invocations.append(.p_environment_get); return __p_environment ?? givenGetterValue(
		.p_environment_get,
		"ProcessInfoProtocolMock - stub value for environment was not defined"
	) }

	private var __p_environment: [String: String]?

	public var arguments: [String] {
		invocations
			.append(.p_arguments_get); return __p_arguments ??
			givenGetterValue(.p_arguments_get, "ProcessInfoProtocolMock - stub value for arguments was not defined")
	}

	private var __p_arguments: [String]?

	public var hostName: String {
		invocations
			.append(.p_hostName_get); return __p_hostName ??
			givenGetterValue(.p_hostName_get, "ProcessInfoProtocolMock - stub value for hostName was not defined")
	}

	private var __p_hostName: String?

	public var processName: String { invocations.append(.p_processName_get); return __p_processName ?? givenGetterValue(
		.p_processName_get,
		"ProcessInfoProtocolMock - stub value for processName was not defined"
	) }

	private var __p_processName: String?

	public var processIdentifier: Int32 { invocations.append(.p_processIdentifier_get); return __p_processIdentifier ?? givenGetterValue(
		.p_processIdentifier_get,
		"ProcessInfoProtocolMock - stub value for processIdentifier was not defined"
	) }

	private var __p_processIdentifier: Int32?

	public var globallyUniqueString: String { invocations.append(.p_globallyUniqueString_get); return __p_globallyUniqueString ?? givenGetterValue(
		.p_globallyUniqueString_get,
		"ProcessInfoProtocolMock - stub value for globallyUniqueString was not defined"
	) }

	private var __p_globallyUniqueString: String?

	fileprivate enum MethodType {
		case p_environment_get
		case p_arguments_get
		case p_hostName_get
		case p_processName_get
		case p_processIdentifier_get
		case p_globallyUniqueString_get

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) { case (.p_environment_get, .p_environment_get): return Matcher.ComparisonResult.match
			case (.p_arguments_get, .p_arguments_get): return Matcher.ComparisonResult.match
			case (.p_hostName_get, .p_hostName_get): return Matcher.ComparisonResult.match
			case (.p_processName_get, .p_processName_get): return Matcher.ComparisonResult.match
			case (.p_processIdentifier_get, .p_processIdentifier_get): return Matcher.ComparisonResult.match
			case (.p_globallyUniqueString_get, .p_globallyUniqueString_get): return Matcher.ComparisonResult.match
			default: return .none
			}
		}

		func intValue() -> Int {
			switch self {
			case .p_environment_get: return 0
			case .p_arguments_get: return 0
			case .p_hostName_get: return 0
			case .p_processName_get: return 0
			case .p_processIdentifier_get: return 0
			case .p_globallyUniqueString_get: return 0
			}
		}

		func assertionName() -> String {
			switch self {
			case .p_environment_get: return "[get] .environment"
			case .p_arguments_get: return "[get] .arguments"
			case .p_hostName_get: return "[get] .hostName"
			case .p_processName_get: return "[get] .processName"
			case .p_processIdentifier_get: return "[get] .processIdentifier"
			case .p_globallyUniqueString_get: return "[get] .globallyUniqueString"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func environment(getter defaultValue: [String: String]...) -> PropertyStub {
			return Given(method: .p_environment_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func arguments(getter defaultValue: [String]...) -> PropertyStub {
			return Given(method: .p_arguments_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func hostName(getter defaultValue: String...) -> PropertyStub {
			return Given(method: .p_hostName_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func processName(getter defaultValue: String...) -> PropertyStub {
			return Given(method: .p_processName_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func processIdentifier(getter defaultValue: Int32...) -> PropertyStub {
			return Given(method: .p_processIdentifier_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func globallyUniqueString(getter defaultValue: String...) -> PropertyStub {
			return Given(method: .p_globallyUniqueString_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static var environment: Verify { return Verify(method: .p_environment_get) }
		public static var arguments: Verify { return Verify(method: .p_arguments_get) }
		public static var hostName: Verify { return Verify(method: .p_hostName_get) }
		public static var processName: Verify { return Verify(method: .p_processName_get) }
		public static var processIdentifier: Verify { return Verify(method: .p_processIdentifier_get) }
		public static var globallyUniqueString: Verify { return Verify(method: .p_globallyUniqueString_get) }
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
}

// MARK: - XcodeChecking

open class XcodeCheckingMock: XcodeChecking, Mock {
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

	public var isRunningFromXcode: Bool { invocations.append(.p_isRunningFromXcode_get); return __p_isRunningFromXcode ?? givenGetterValue(
		.p_isRunningFromXcode_get,
		"XcodeCheckingMock - stub value for isRunningFromXcode was not defined"
	) }

	private var __p_isRunningFromXcode: Bool?

	fileprivate enum MethodType {
		case p_isRunningFromXcode_get

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) { case (.p_isRunningFromXcode_get, .p_isRunningFromXcode_get): return Matcher.ComparisonResult.match
			}
		}

		func intValue() -> Int {
			switch self {
			case .p_isRunningFromXcode_get: return 0
			}
		}

		func assertionName() -> String {
			switch self {
			case .p_isRunningFromXcode_get: return "[get] .isRunningFromXcode"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func isRunningFromXcode(getter defaultValue: Bool...) -> PropertyStub {
			return Given(method: .p_isRunningFromXcode_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static var isRunningFromXcode: Verify { return Verify(method: .p_isRunningFromXcode_get) }
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
}
