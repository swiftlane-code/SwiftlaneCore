// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0

import Darwin
import Foundation
import PerfectRainbow
@testable import SwiftlaneLogging
import SwiftyMocky
import XCTest

// MARK: - Logging

open class LoggingMock: Logging, Mock {
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

	public var logLevel: LoggingLevel {
		invocations
			.append(.p_logLevel_get); return __p_logLevel ?? givenGetterValue(.p_logLevel_get, "LoggingMock - stub value for logLevel was not defined")
	}

	private var __p_logLevel: LoggingLevel?

	open func uncheckedLog(_ level: LoggingLevel, _ msg: String, _ color: NamedColor?, terminator: String, file: String, line: UInt) {
		addInvocation(.m_uncheckedLog__level_msg_colorterminator_terminatorfile_fileline_line(
			Parameter<LoggingLevel>.value(level),
			Parameter<String>.value(msg),
			Parameter<NamedColor?>.value(color),
			Parameter<String>.value(terminator),
			Parameter<String>.value(file),
			Parameter<UInt>.value(line)
		))
		let perform = methodPerformValue(.m_uncheckedLog__level_msg_colorterminator_terminatorfile_fileline_line(
			Parameter<LoggingLevel>.value(level),
			Parameter<String>.value(msg),
			Parameter<NamedColor?>.value(color),
			Parameter<String>.value(terminator),
			Parameter<String>.value(file),
			Parameter<UInt>.value(line)
		)) as? (LoggingLevel, String, NamedColor?, String, String, UInt) -> Void
		perform?(level, msg, color, terminator, file, line)
	}

	open func logShellCommand(_ msg: String, file: String, line: UInt) {
		addInvocation(.m_logShellCommand__msgfile_fileline_line(
			Parameter<String>.value(msg),
			Parameter<String>.value(file),
			Parameter<UInt>.value(line)
		))
		let perform =
			methodPerformValue(.m_logShellCommand__msgfile_fileline_line(
				Parameter<String>.value(msg),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)) as? (String, String, UInt) -> Void
		perform?(msg, file, line)
	}

	open func logError(_ error: Error, file: String, line: UInt) {
		addInvocation(.m_logError__errorfile_fileline_line(Parameter<Error>.value(error), Parameter<String>.value(file), Parameter<UInt>.value(line)))
		let perform =
			methodPerformValue(.m_logError__errorfile_fileline_line(
				Parameter<Error>.value(error),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)) as? (Error, String, UInt) -> Void
		perform?(error, file, line)
	}

	open func success(_ msg: String, file: String, line: UInt) {
		addInvocation(.m_success__msgfile_fileline_line(Parameter<String>.value(msg), Parameter<String>.value(file), Parameter<UInt>.value(line)))
		let perform =
			methodPerformValue(.m_success__msgfile_fileline_line(
				Parameter<String>.value(msg),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)) as? (String, String, UInt) -> Void
		perform?(msg, file, line)
	}

	open func shouldLog(level: LoggingLevel) -> Bool {
		addInvocation(.m_shouldLog__level_level(Parameter<LoggingLevel>.value(level)))
		let perform = methodPerformValue(.m_shouldLog__level_level(Parameter<LoggingLevel>.value(level))) as? (LoggingLevel) -> Void
		perform?(level)
		var __value: Bool
		do {
			__value = try methodReturnValue(.m_shouldLog__level_level(Parameter<LoggingLevel>.value(level))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for shouldLog(level: LoggingLevel). Use given")
			Failure("Stub return value not specified for shouldLog(level: LoggingLevel). Use given")
		}
		return __value
	}

	open func log(
		_ level: LoggingLevel,
		_ msg: String,
		_ color: NamedColor? = nil,
		terminator: String = "\n",
		file: String = #file,
		line: UInt = #line
	) {
		addInvocation(.m_log__level_msg_colorterminator_terminatorfile_fileline_line(
			Parameter<LoggingLevel>.value(level),
			Parameter<String>.value(msg),
			Parameter<NamedColor?>.value(color),
			Parameter<String>.value(terminator),
			Parameter<String>.value(file),
			Parameter<UInt>.value(line)
		))
		let perform = methodPerformValue(.m_log__level_msg_colorterminator_terminatorfile_fileline_line(
			Parameter<LoggingLevel>.value(level),
			Parameter<String>.value(msg),
			Parameter<NamedColor?>.value(color),
			Parameter<String>.value(terminator),
			Parameter<String>.value(file),
			Parameter<UInt>.value(line)
		)) as? (LoggingLevel, String, NamedColor?, String, String, UInt) -> Void
		perform?(level, msg, color, terminator, file, line)
	}

	open func error(_ msg: String, file: String = #file, line: UInt = #line) {
		addInvocation(.m_error__msgfile_fileline_line(Parameter<String>.value(msg), Parameter<String>.value(file), Parameter<UInt>.value(line)))
		let perform =
			methodPerformValue(.m_error__msgfile_fileline_line(
				Parameter<String>.value(msg),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)) as? (String, String, UInt) -> Void
		perform?(msg, file, line)
	}

	open func warn(_ msg: String, file: String = #file, line: UInt = #line) {
		addInvocation(.m_warn__msgfile_fileline_line(Parameter<String>.value(msg), Parameter<String>.value(file), Parameter<UInt>.value(line)))
		let perform =
			methodPerformValue(.m_warn__msgfile_fileline_line(
				Parameter<String>.value(msg),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)) as? (String, String, UInt) -> Void
		perform?(msg, file, line)
	}

	open func important(_ msg: String, file: String = #file, line: UInt = #line) {
		addInvocation(.m_important__msgfile_fileline_line(Parameter<String>.value(msg), Parameter<String>.value(file), Parameter<UInt>.value(line)))
		let perform =
			methodPerformValue(.m_important__msgfile_fileline_line(
				Parameter<String>.value(msg),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)) as? (String, String, UInt) -> Void
		perform?(msg, file, line)
	}

	open func info(_ msg: String, file: String = #file, line: UInt = #line) {
		addInvocation(.m_info__msgfile_fileline_line(Parameter<String>.value(msg), Parameter<String>.value(file), Parameter<UInt>.value(line)))
		let perform =
			methodPerformValue(.m_info__msgfile_fileline_line(
				Parameter<String>.value(msg),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)) as? (String, String, UInt) -> Void
		perform?(msg, file, line)
	}

	open func debug(_ msg: String, file: String = #file, line: UInt = #line) {
		addInvocation(.m_debug__msgfile_fileline_line(Parameter<String>.value(msg), Parameter<String>.value(file), Parameter<UInt>.value(line)))
		let perform =
			methodPerformValue(.m_debug__msgfile_fileline_line(
				Parameter<String>.value(msg),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)) as? (String, String, UInt) -> Void
		perform?(msg, file, line)
	}

	open func verbose(_ msg: String, file: String = #file, line: UInt = #line) {
		addInvocation(.m_verbose__msgfile_fileline_line(Parameter<String>.value(msg), Parameter<String>.value(file), Parameter<UInt>.value(line)))
		let perform =
			methodPerformValue(.m_verbose__msgfile_fileline_line(
				Parameter<String>.value(msg),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)) as? (String, String, UInt) -> Void
		perform?(msg, file, line)
	}

	fileprivate enum MethodType {
		case m_uncheckedLog__level_msg_colorterminator_terminatorfile_fileline_line(
			Parameter<LoggingLevel>,
			Parameter<String>,
			Parameter<NamedColor?>,
			Parameter<String>,
			Parameter<String>,
			Parameter<UInt>
		)
		case m_logShellCommand__msgfile_fileline_line(Parameter<String>, Parameter<String>, Parameter<UInt>)
		case m_logError__errorfile_fileline_line(Parameter<Error>, Parameter<String>, Parameter<UInt>)
		case m_success__msgfile_fileline_line(Parameter<String>, Parameter<String>, Parameter<UInt>)
		case m_shouldLog__level_level(Parameter<LoggingLevel>)
		case m_log__level_msg_colorterminator_terminatorfile_fileline_line(
			Parameter<LoggingLevel>,
			Parameter<String>,
			Parameter<NamedColor?>,
			Parameter<String>,
			Parameter<String>,
			Parameter<UInt>
		)
		case m_error__msgfile_fileline_line(Parameter<String>, Parameter<String>, Parameter<UInt>)
		case m_warn__msgfile_fileline_line(Parameter<String>, Parameter<String>, Parameter<UInt>)
		case m_important__msgfile_fileline_line(Parameter<String>, Parameter<String>, Parameter<UInt>)
		case m_info__msgfile_fileline_line(Parameter<String>, Parameter<String>, Parameter<UInt>)
		case m_debug__msgfile_fileline_line(Parameter<String>, Parameter<String>, Parameter<UInt>)
		case m_verbose__msgfile_fileline_line(Parameter<String>, Parameter<String>, Parameter<UInt>)
		case p_logLevel_get

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (
				.m_uncheckedLog__level_msg_colorterminator_terminatorfile_fileline_line(lhsLevel, lhsMsg, lhsColor, lhsTerminator, lhsFile, lhsLine),
				.m_uncheckedLog__level_msg_colorterminator_terminatorfile_fileline_line(rhsLevel, rhsMsg, rhsColor, rhsTerminator, rhsFile, rhsLine)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLevel, rhs: rhsLevel, with: matcher), lhsLevel, rhsLevel, "_ level"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMsg, rhs: rhsMsg, with: matcher), lhsMsg, rhsMsg, "_ msg"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsColor, rhs: rhsColor, with: matcher), lhsColor, rhsColor, "_ color"))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsTerminator, rhs: rhsTerminator, with: matcher),
					lhsTerminator,
					rhsTerminator,
					"terminator"
				))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_logShellCommand__msgfile_fileline_line(lhsMsg, lhsFile, lhsLine),
				.m_logShellCommand__msgfile_fileline_line(rhsMsg, rhsFile, rhsLine)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMsg, rhs: rhsMsg, with: matcher), lhsMsg, rhsMsg, "_ msg"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_logError__errorfile_fileline_line(lhsError, lhsFile, lhsLine),
				.m_logError__errorfile_fileline_line(rhsError, rhsFile, rhsLine)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher), lhsError, rhsError, "_ error"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (.m_success__msgfile_fileline_line(lhsMsg, lhsFile, lhsLine), .m_success__msgfile_fileline_line(rhsMsg, rhsFile, rhsLine)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMsg, rhs: rhsMsg, with: matcher), lhsMsg, rhsMsg, "_ msg"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (.m_shouldLog__level_level(lhsLevel), .m_shouldLog__level_level(rhsLevel)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLevel, rhs: rhsLevel, with: matcher), lhsLevel, rhsLevel, "level"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_log__level_msg_colorterminator_terminatorfile_fileline_line(lhsLevel, lhsMsg, lhsColor, lhsTerminator, lhsFile, lhsLine),
				.m_log__level_msg_colorterminator_terminatorfile_fileline_line(rhsLevel, rhsMsg, rhsColor, rhsTerminator, rhsFile, rhsLine)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLevel, rhs: rhsLevel, with: matcher), lhsLevel, rhsLevel, "_ level"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMsg, rhs: rhsMsg, with: matcher), lhsMsg, rhsMsg, "_ msg"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsColor, rhs: rhsColor, with: matcher), lhsColor, rhsColor, "_ color"))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsTerminator, rhs: rhsTerminator, with: matcher),
					lhsTerminator,
					rhsTerminator,
					"terminator"
				))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (.m_error__msgfile_fileline_line(lhsMsg, lhsFile, lhsLine), .m_error__msgfile_fileline_line(rhsMsg, rhsFile, rhsLine)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMsg, rhs: rhsMsg, with: matcher), lhsMsg, rhsMsg, "_ msg"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (.m_warn__msgfile_fileline_line(lhsMsg, lhsFile, lhsLine), .m_warn__msgfile_fileline_line(rhsMsg, rhsFile, rhsLine)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMsg, rhs: rhsMsg, with: matcher), lhsMsg, rhsMsg, "_ msg"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (.m_important__msgfile_fileline_line(lhsMsg, lhsFile, lhsLine), .m_important__msgfile_fileline_line(rhsMsg, rhsFile, rhsLine)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMsg, rhs: rhsMsg, with: matcher), lhsMsg, rhsMsg, "_ msg"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (.m_info__msgfile_fileline_line(lhsMsg, lhsFile, lhsLine), .m_info__msgfile_fileline_line(rhsMsg, rhsFile, rhsLine)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMsg, rhs: rhsMsg, with: matcher), lhsMsg, rhsMsg, "_ msg"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (.m_debug__msgfile_fileline_line(lhsMsg, lhsFile, lhsLine), .m_debug__msgfile_fileline_line(rhsMsg, rhsFile, rhsLine)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMsg, rhs: rhsMsg, with: matcher), lhsMsg, rhsMsg, "_ msg"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (.m_verbose__msgfile_fileline_line(lhsMsg, lhsFile, lhsLine), .m_verbose__msgfile_fileline_line(rhsMsg, rhsFile, rhsLine)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMsg, rhs: rhsMsg, with: matcher), lhsMsg, rhsMsg, "_ msg"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)
			case (.p_logLevel_get, .p_logLevel_get): return Matcher.ComparisonResult.match
			default: return .none
			}
		}

		func intValue() -> Int {
			switch self {
			case let .m_uncheckedLog__level_msg_colorterminator_terminatorfile_fileline_line(p0, p1, p2, p3, p4, p5): return p0.intValue + p1
				.intValue + p2.intValue + p3.intValue + p4.intValue + p5.intValue
			case let .m_logShellCommand__msgfile_fileline_line(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case let .m_logError__errorfile_fileline_line(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case let .m_success__msgfile_fileline_line(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case let .m_shouldLog__level_level(p0): return p0.intValue
			case let .m_log__level_msg_colorterminator_terminatorfile_fileline_line(p0, p1, p2, p3, p4, p5): return p0.intValue + p1.intValue + p2
				.intValue + p3.intValue + p4.intValue + p5.intValue
			case let .m_error__msgfile_fileline_line(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case let .m_warn__msgfile_fileline_line(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case let .m_important__msgfile_fileline_line(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case let .m_info__msgfile_fileline_line(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case let .m_debug__msgfile_fileline_line(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case let .m_verbose__msgfile_fileline_line(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case .p_logLevel_get: return 0
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_uncheckedLog__level_msg_colorterminator_terminatorfile_fileline_line: return ".uncheckedLog(_:_:_:terminator:file:line:)"
			case .m_logShellCommand__msgfile_fileline_line: return ".logShellCommand(_:file:line:)"
			case .m_logError__errorfile_fileline_line: return ".logError(_:file:line:)"
			case .m_success__msgfile_fileline_line: return ".success(_:file:line:)"
			case .m_shouldLog__level_level: return ".shouldLog(level:)"
			case .m_log__level_msg_colorterminator_terminatorfile_fileline_line: return ".log(_:_:_:terminator:file:line:)"
			case .m_error__msgfile_fileline_line: return ".error(_:file:line:)"
			case .m_warn__msgfile_fileline_line: return ".warn(_:file:line:)"
			case .m_important__msgfile_fileline_line: return ".important(_:file:line:)"
			case .m_info__msgfile_fileline_line: return ".info(_:file:line:)"
			case .m_debug__msgfile_fileline_line: return ".debug(_:file:line:)"
			case .m_verbose__msgfile_fileline_line: return ".verbose(_:file:line:)"
			case .p_logLevel_get: return "[get] .logLevel"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func logLevel(getter defaultValue: LoggingLevel...) -> PropertyStub {
			return Given(method: .p_logLevel_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func shouldLog(level: Parameter<LoggingLevel>, willReturn: Bool...) -> MethodStub {
			return Given(method: .m_shouldLog__level_level(level), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func shouldLog(level: Parameter<LoggingLevel>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
			let willReturn: [Bool] = []
			let given = Given(method: .m_shouldLog__level_level(level), products: willReturn.map { StubProduct.return($0 as Any) })
			let stubber = given.stub(for: Bool.self)
			willProduce(stubber)
			return given
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func uncheckedLog(
			_ level: Parameter<LoggingLevel>,
			_ msg: Parameter<String>,
			_ color: Parameter<NamedColor?>,
			terminator: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>
		)
			-> Verify {
			return Verify(method: .m_uncheckedLog__level_msg_colorterminator_terminatorfile_fileline_line(level, msg, color, terminator, file, line))
		}

		public static func logShellCommand(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>
		) -> Verify { return Verify(method: .m_logShellCommand__msgfile_fileline_line(msg, file, line)) }
		public static func logError(
			_ error: Parameter<Error>,
			file: Parameter<String>,
			line: Parameter<UInt>
		) -> Verify { return Verify(method: .m_logError__errorfile_fileline_line(error, file, line)) }
		public static func success(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>
		) -> Verify { return Verify(method: .m_success__msgfile_fileline_line(msg, file, line)) }
		public static func shouldLog(level: Parameter<LoggingLevel>) -> Verify { return Verify(method: .m_shouldLog__level_level(level)) }
		public static func log(
			_ level: Parameter<LoggingLevel>,
			_ msg: Parameter<String>,
			_ color: Parameter<NamedColor?>,
			terminator: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>
		)
			-> Verify { return Verify(method: .m_log__level_msg_colorterminator_terminatorfile_fileline_line(level, msg, color, terminator, file, line))
		}

		public static func error(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>
		) -> Verify { return Verify(method: .m_error__msgfile_fileline_line(msg, file, line)) }
		public static func warn(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>
		) -> Verify { return Verify(method: .m_warn__msgfile_fileline_line(msg, file, line)) }
		public static func important(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>
		) -> Verify { return Verify(method: .m_important__msgfile_fileline_line(msg, file, line)) }
		public static func info(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>
		) -> Verify { return Verify(method: .m_info__msgfile_fileline_line(msg, file, line)) }
		public static func debug(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>
		) -> Verify { return Verify(method: .m_debug__msgfile_fileline_line(msg, file, line)) }
		public static func verbose(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>
		) -> Verify { return Verify(method: .m_verbose__msgfile_fileline_line(msg, file, line)) }
		public static var logLevel: Verify { return Verify(method: .p_logLevel_get) }
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func uncheckedLog(
			_ level: Parameter<LoggingLevel>,
			_ msg: Parameter<String>,
			_ color: Parameter<NamedColor?>,
			terminator: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (LoggingLevel, String, NamedColor?, String, String, UInt) -> Void
		) -> Perform {
			return Perform(
				method: .m_uncheckedLog__level_msg_colorterminator_terminatorfile_fileline_line(level, msg, color, terminator, file, line),
				performs: perform
			)
		}

		public static func logShellCommand(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (String, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_logShellCommand__msgfile_fileline_line(msg, file, line), performs: perform)
		}

		public static func logError(
			_ error: Parameter<Error>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (Error, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_logError__errorfile_fileline_line(error, file, line), performs: perform)
		}

		public static func success(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (String, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_success__msgfile_fileline_line(msg, file, line), performs: perform)
		}

		public static func shouldLog(level: Parameter<LoggingLevel>, perform: @escaping (LoggingLevel) -> Void) -> Perform {
			return Perform(method: .m_shouldLog__level_level(level), performs: perform)
		}

		public static func log(
			_ level: Parameter<LoggingLevel>,
			_ msg: Parameter<String>,
			_ color: Parameter<NamedColor?>,
			terminator: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (LoggingLevel, String, NamedColor?, String, String, UInt) -> Void
		) -> Perform {
			return Perform(
				method: .m_log__level_msg_colorterminator_terminatorfile_fileline_line(level, msg, color, terminator, file, line),
				performs: perform
			)
		}

		public static func error(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (String, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_error__msgfile_fileline_line(msg, file, line), performs: perform)
		}

		public static func warn(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (String, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_warn__msgfile_fileline_line(msg, file, line), performs: perform)
		}

		public static func important(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (String, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_important__msgfile_fileline_line(msg, file, line), performs: perform)
		}

		public static func info(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (String, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_info__msgfile_fileline_line(msg, file, line), performs: perform)
		}

		public static func debug(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (String, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_debug__msgfile_fileline_line(msg, file, line), performs: perform)
		}

		public static func verbose(
			_ msg: Parameter<String>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (String, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_verbose__msgfile_fileline_line(msg, file, line), performs: perform)
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

// MARK: - WinSizeReading

open class WinSizeReadingMock: WinSizeReading, Mock {
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

	open func winsize() -> Darwin.winsize? {
		addInvocation(.m_winsize)
		let perform = methodPerformValue(.m_winsize) as? () -> Void
		perform?()
		var __value: Darwin.winsize?
		do {
			__value = try methodReturnValue(.m_winsize).casted()
		} catch {
			// do nothing
		}
		return __value
	}

	fileprivate enum MethodType {
		case m_winsize

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case (.m_winsize, .m_winsize): return .match
			}
		}

		func intValue() -> Int {
			switch self {
			case .m_winsize: return 0
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_winsize: return ".winsize()"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func winsize(willReturn: Darwin.winsize?...) -> MethodStub {
			return Given(method: .m_winsize, products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func winsize(willProduce: (Stubber<Darwin.winsize?>) -> Void) -> MethodStub {
			let willReturn: [Darwin.winsize?] = []
			let given = Given(method: .m_winsize, products: willReturn.map { StubProduct.return($0 as Any) })
			let stubber = given.stub(for: (Darwin.winsize?).self)
			willProduce(stubber)
			return given
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func winsize() -> Verify { return Verify(method: .m_winsize) }
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func winsize(perform: @escaping () -> Void) -> Perform {
			return Perform(method: .m_winsize, performs: perform)
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
