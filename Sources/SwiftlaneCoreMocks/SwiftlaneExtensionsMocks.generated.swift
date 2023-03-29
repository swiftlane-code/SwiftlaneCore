// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0

import Foundation
@testable import SwiftlaneExtensions
import SwiftyMocky
import XCTest

// MARK: - DateComponentsFormatting

open class DateComponentsFormattingMock: DateComponentsFormatting, Mock {
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

	open func string(from startDate: Date, to endDate: Date) -> String? {
		addInvocation(.m_string__from_startDateto_endDate(Parameter<Date>.value(startDate), Parameter<Date>.value(endDate)))
		let perform = methodPerformValue(.m_string__from_startDateto_endDate(Parameter<Date>.value(startDate), Parameter<Date>.value(endDate))) as? (
			Date,
			Date
		) -> Void
		perform?(startDate, endDate)
		var __value: String?
		do {
			__value = try methodReturnValue(.m_string__from_startDateto_endDate(Parameter<Date>.value(startDate), Parameter<Date>.value(endDate))).casted()
		} catch {
			// do nothing
		}
		return __value
	}

	fileprivate enum MethodType {
		case m_string__from_startDateto_endDate(Parameter<Date>, Parameter<Date>)

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (.m_string__from_startDateto_endDate(lhsStartdate, lhsEnddate), .m_string__from_startDateto_endDate(rhsStartdate, rhsEnddate)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsStartdate, rhs: rhsStartdate, with: matcher),
					lhsStartdate,
					rhsStartdate,
					"from startDate"
				))
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsEnddate, rhs: rhsEnddate, with: matcher), lhsEnddate, rhsEnddate, "to endDate")
					)
				return Matcher.ComparisonResult(results)
			}
		}

		func intValue() -> Int {
			switch self {
			case let .m_string__from_startDateto_endDate(p0, p1): return p0.intValue + p1.intValue
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_string__from_startDateto_endDate: return ".string(from:to:)"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func string(from startDate: Parameter<Date>, to endDate: Parameter<Date>, willReturn: String?...) -> MethodStub {
			return Given(method: .m_string__from_startDateto_endDate(startDate, endDate), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func string(
			from startDate: Parameter<Date>,
			to endDate: Parameter<Date>,
			willProduce: (Stubber<String?>) -> Void
		) -> MethodStub {
			let willReturn: [String?] = []
			let given = Given(method: .m_string__from_startDateto_endDate(startDate, endDate), products: willReturn.map { StubProduct.return($0 as Any) })
			let stubber = given.stub(for: (String?).self)
			willProduce(stubber)
			return given
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func string(
			from startDate: Parameter<Date>,
			to endDate: Parameter<Date>
		) -> Verify { return Verify(method: .m_string__from_startDateto_endDate(startDate, endDate)) }
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func string(from startDate: Parameter<Date>, to endDate: Parameter<Date>, perform: @escaping (Date, Date) -> Void) -> Perform {
			return Perform(method: .m_string__from_startDateto_endDate(startDate, endDate), performs: perform)
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
