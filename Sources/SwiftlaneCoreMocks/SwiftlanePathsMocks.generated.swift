// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0

import Foundation
import PerfectRainbow
import SwiftlaneExtensions
import SwiftlaneLogging
@testable import SwiftlanePaths
import SwiftyMocky
import XCTest

// MARK: - FSManaging

open class FSManagingMock: FSManaging, Mock {
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

	open func fileExists(_ path: AbsolutePath) -> Bool {
		addInvocation(.m_fileExists__path(Parameter<AbsolutePath>.value(path)))
		let perform = methodPerformValue(.m_fileExists__path(Parameter<AbsolutePath>.value(path))) as? (AbsolutePath) -> Void
		perform?(path)
		var __value: Bool
		do {
			__value = try methodReturnValue(.m_fileExists__path(Parameter<AbsolutePath>.value(path))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for fileExists(_ path: AbsolutePath). Use given")
			Failure("Stub return value not specified for fileExists(_ path: AbsolutePath). Use given")
		}
		return __value
	}

	open func directoryExists(_ path: AbsolutePath) -> Bool {
		addInvocation(.m_directoryExists__path(Parameter<AbsolutePath>.value(path)))
		let perform = methodPerformValue(.m_directoryExists__path(Parameter<AbsolutePath>.value(path))) as? (AbsolutePath) -> Void
		perform?(path)
		var __value: Bool
		do {
			__value = try methodReturnValue(.m_directoryExists__path(Parameter<AbsolutePath>.value(path))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for directoryExists(_ path: AbsolutePath). Use given")
			Failure("Stub return value not specified for directoryExists(_ path: AbsolutePath). Use given")
		}
		return __value
	}

	open func fileSize(_ path: AbsolutePath) throws -> UInt64 {
		addInvocation(.m_fileSize__path(Parameter<AbsolutePath>.value(path)))
		let perform = methodPerformValue(.m_fileSize__path(Parameter<AbsolutePath>.value(path))) as? (AbsolutePath) -> Void
		perform?(path)
		var __value: UInt64
		do {
			__value = try methodReturnValue(.m_fileSize__path(Parameter<AbsolutePath>.value(path))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for fileSize(_ path: AbsolutePath). Use given")
			Failure("Stub return value not specified for fileSize(_ path: AbsolutePath). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func readData(_ path: AbsolutePath, log: Bool) throws -> Data {
		addInvocation(.m_readData__pathlog_log(Parameter<AbsolutePath>.value(path), Parameter<Bool>.value(log)))
		let perform = methodPerformValue(.m_readData__pathlog_log(Parameter<AbsolutePath>.value(path), Parameter<Bool>.value(log))) as? (
			AbsolutePath,
			Bool
		) -> Void
		perform?(path, log)
		var __value: Data
		do {
			__value = try methodReturnValue(.m_readData__pathlog_log(Parameter<AbsolutePath>.value(path), Parameter<Bool>.value(log))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for readData(_ path: AbsolutePath, log: Bool). Use given")
			Failure("Stub return value not specified for readData(_ path: AbsolutePath, log: Bool). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func readText(_ path: AbsolutePath, log: Bool) throws -> String {
		addInvocation(.m_readText__pathlog_log(Parameter<AbsolutePath>.value(path), Parameter<Bool>.value(log)))
		let perform = methodPerformValue(.m_readText__pathlog_log(Parameter<AbsolutePath>.value(path), Parameter<Bool>.value(log))) as? (
			AbsolutePath,
			Bool
		) -> Void
		perform?(path, log)
		var __value: String
		do {
			__value = try methodReturnValue(.m_readText__pathlog_log(Parameter<AbsolutePath>.value(path), Parameter<Bool>.value(log))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for readText(_ path: AbsolutePath, log: Bool). Use given")
			Failure("Stub return value not specified for readText(_ path: AbsolutePath, log: Bool). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func decode<T: Decodable, D: AnyDecoder>(_ path: AbsolutePath, decoder: D) throws -> T {
		addInvocation(.m_decode__pathdecoder_decoder(Parameter<AbsolutePath>.value(path), Parameter<D>.value(decoder).wrapAsGeneric()))
		let perform =
			methodPerformValue(.m_decode__pathdecoder_decoder(
				Parameter<AbsolutePath>.value(path),
				Parameter<D>.value(decoder).wrapAsGeneric()
			)) as? (AbsolutePath, D) -> Void
		perform?(path, decoder)
		var __value: T
		do {
			__value =
				try methodReturnValue(.m_decode__pathdecoder_decoder(Parameter<AbsolutePath>.value(path), Parameter<D>.value(decoder).wrapAsGeneric()))
					.casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for decode<T: Decodable, D: AnyDecoder>(_ path: AbsolutePath, decoder: D). Use given")
			Failure("Stub return value not specified for decode<T: Decodable, D: AnyDecoder>(_ path: AbsolutePath, decoder: D). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func write(_ path: AbsolutePath, data: Data) throws {
		addInvocation(.m_write__pathdata_data(Parameter<AbsolutePath>.value(path), Parameter<Data>.value(data)))
		let perform = methodPerformValue(.m_write__pathdata_data(Parameter<AbsolutePath>.value(path), Parameter<Data>.value(data))) as? (
			AbsolutePath,
			Data
		) -> Void
		perform?(path, data)
		do {
			_ = try methodReturnValue(.m_write__pathdata_data(Parameter<AbsolutePath>.value(path), Parameter<Data>.value(data))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func write(_ path: AbsolutePath, text: String) throws {
		addInvocation(.m_write__pathtext_text(Parameter<AbsolutePath>.value(path), Parameter<String>.value(text)))
		let perform = methodPerformValue(.m_write__pathtext_text(Parameter<AbsolutePath>.value(path), Parameter<String>.value(text))) as? (
			AbsolutePath,
			String
		) -> Void
		perform?(path, text)
		do {
			_ = try methodReturnValue(.m_write__pathtext_text(Parameter<AbsolutePath>.value(path), Parameter<String>.value(text))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func delete(_ path: AbsolutePath) throws {
		addInvocation(.m_delete__path(Parameter<AbsolutePath>.value(path)))
		let perform = methodPerformValue(.m_delete__path(Parameter<AbsolutePath>.value(path))) as? (AbsolutePath) -> Void
		perform?(path)
		do {
			_ = try methodReturnValue(.m_delete__path(Parameter<AbsolutePath>.value(path))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func copy(_ source: AbsolutePath, to destination: AbsolutePath) throws {
		addInvocation(.m_copy__sourceto_destination(Parameter<AbsolutePath>.value(source), Parameter<AbsolutePath>.value(destination)))
		let perform =
			methodPerformValue(.m_copy__sourceto_destination(
				Parameter<AbsolutePath>.value(source),
				Parameter<AbsolutePath>.value(destination)
			)) as? (AbsolutePath, AbsolutePath) -> Void
		perform?(source, destination)
		do {
			_ = try methodReturnValue(.m_copy__sourceto_destination(Parameter<AbsolutePath>.value(source), Parameter<AbsolutePath>.value(destination)))
				.casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func find(_ path: AbsolutePath, file: String, line: UInt) throws -> [AbsolutePath] {
		addInvocation(.m_find__pathfile_fileline_line(
			Parameter<AbsolutePath>.value(path),
			Parameter<String>.value(file),
			Parameter<UInt>.value(line)
		))
		let perform =
			methodPerformValue(.m_find__pathfile_fileline_line(
				Parameter<AbsolutePath>.value(path),
				Parameter<String>.value(file),
				Parameter<UInt>.value(line)
			)) as? (AbsolutePath, String, UInt) -> Void
		perform?(path, file, line)
		var __value: [AbsolutePath]
		do {
			__value =
				try methodReturnValue(.m_find__pathfile_fileline_line(
					Parameter<AbsolutePath>.value(path),
					Parameter<String>.value(file),
					Parameter<UInt>.value(line)
				)).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for find(_ path: AbsolutePath, file: String, line: UInt). Use given")
			Failure("Stub return value not specified for find(_ path: AbsolutePath, file: String, line: UInt). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func mkdir(_ path: AbsolutePath) throws {
		addInvocation(.m_mkdir__path(Parameter<AbsolutePath>.value(path)))
		let perform = methodPerformValue(.m_mkdir__path(Parameter<AbsolutePath>.value(path))) as? (AbsolutePath) -> Void
		perform?(path)
		do {
			_ = try methodReturnValue(.m_mkdir__path(Parameter<AbsolutePath>.value(path))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func createSymlink(_ path: AbsolutePath, pointingTo: AbsolutePath) throws {
		addInvocation(.m_createSymlink__pathpointingTo_pointingTo(Parameter<AbsolutePath>.value(path), Parameter<AbsolutePath>.value(pointingTo)))
		let perform =
			methodPerformValue(.m_createSymlink__pathpointingTo_pointingTo(
				Parameter<AbsolutePath>.value(path),
				Parameter<AbsolutePath>.value(pointingTo)
			)) as? (AbsolutePath, AbsolutePath) -> Void
		perform?(path, pointingTo)
		do {
			_ =
				try methodReturnValue(.m_createSymlink__pathpointingTo_pointingTo(
					Parameter<AbsolutePath>.value(path),
					Parameter<AbsolutePath>.value(pointingTo)
				)).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func move(_ path: AbsolutePath, newPath: AbsolutePath) throws {
		addInvocation(.m_move__pathnewPath_newPath(Parameter<AbsolutePath>.value(path), Parameter<AbsolutePath>.value(newPath)))
		let perform =
			methodPerformValue(.m_move__pathnewPath_newPath(Parameter<AbsolutePath>.value(path), Parameter<AbsolutePath>.value(newPath))) as? (
				AbsolutePath,
				AbsolutePath
			) -> Void
		perform?(path, newPath)
		do {
			_ = try methodReturnValue(.m_move__pathnewPath_newPath(Parameter<AbsolutePath>.value(path), Parameter<AbsolutePath>.value(newPath)))
				.casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func homeDirectoryForCurrentUser() throws -> AbsolutePath {
		addInvocation(.m_homeDirectoryForCurrentUser)
		let perform = methodPerformValue(.m_homeDirectoryForCurrentUser) as? () -> Void
		perform?()
		var __value: AbsolutePath
		do {
			__value = try methodReturnValue(.m_homeDirectoryForCurrentUser).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for homeDirectoryForCurrentUser(). Use given")
			Failure("Stub return value not specified for homeDirectoryForCurrentUser(). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func pwd() throws -> AbsolutePath {
		addInvocation(.m_pwd)
		let perform = methodPerformValue(.m_pwd) as? () -> Void
		perform?()
		var __value: AbsolutePath
		do {
			__value = try methodReturnValue(.m_pwd).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for pwd(). Use given")
			Failure("Stub return value not specified for pwd(). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func ls(_ path: AbsolutePath) throws -> [AbsolutePath] {
		addInvocation(.m_ls__path(Parameter<AbsolutePath>.value(path)))
		let perform = methodPerformValue(.m_ls__path(Parameter<AbsolutePath>.value(path))) as? (AbsolutePath) -> Void
		perform?(path)
		var __value: [AbsolutePath]
		do {
			__value = try methodReturnValue(.m_ls__path(Parameter<AbsolutePath>.value(path))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for ls(_ path: AbsolutePath). Use given")
			Failure("Stub return value not specified for ls(_ path: AbsolutePath). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func stat(_ path: AbsolutePath, keys: Set<URLResourceKey>) throws -> URLResourceValues {
		addInvocation(.m_stat__pathkeys_keys(Parameter<AbsolutePath>.value(path), Parameter<Set<URLResourceKey>>.value(keys)))
		let perform =
			methodPerformValue(.m_stat__pathkeys_keys(Parameter<AbsolutePath>.value(path), Parameter<Set<URLResourceKey>>.value(keys))) as? (
				AbsolutePath,
				Set<URLResourceKey>
			) -> Void
		perform?(path, keys)
		var __value: URLResourceValues
		do {
			__value = try methodReturnValue(.m_stat__pathkeys_keys(Parameter<AbsolutePath>.value(path), Parameter<Set<URLResourceKey>>.value(keys)))
				.casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for stat(_ path: AbsolutePath, keys: Set<URLResourceKey>). Use given")
			Failure("Stub return value not specified for stat(_ path: AbsolutePath, keys: Set<URLResourceKey>). Use given")
		} catch {
			throw error
		}
		return __value
	}

	fileprivate enum MethodType {
		case m_fileExists__path(Parameter<AbsolutePath>)
		case m_directoryExists__path(Parameter<AbsolutePath>)
		case m_fileSize__path(Parameter<AbsolutePath>)
		case m_readData__pathlog_log(Parameter<AbsolutePath>, Parameter<Bool>)
		case m_readText__pathlog_log(Parameter<AbsolutePath>, Parameter<Bool>)
		case m_decode__pathdecoder_decoder(Parameter<AbsolutePath>, Parameter<GenericAttribute>)
		case m_write__pathdata_data(Parameter<AbsolutePath>, Parameter<Data>)
		case m_write__pathtext_text(Parameter<AbsolutePath>, Parameter<String>)
		case m_delete__path(Parameter<AbsolutePath>)
		case m_copy__sourceto_destination(Parameter<AbsolutePath>, Parameter<AbsolutePath>)
		case m_find__pathfile_fileline_line(Parameter<AbsolutePath>, Parameter<String>, Parameter<UInt>)
		case m_mkdir__path(Parameter<AbsolutePath>)
		case m_createSymlink__pathpointingTo_pointingTo(Parameter<AbsolutePath>, Parameter<AbsolutePath>)
		case m_move__pathnewPath_newPath(Parameter<AbsolutePath>, Parameter<AbsolutePath>)
		case m_homeDirectoryForCurrentUser
		case m_pwd
		case m_ls__path(Parameter<AbsolutePath>)
		case m_stat__pathkeys_keys(Parameter<AbsolutePath>, Parameter<Set<URLResourceKey>>)

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (.m_fileExists__path(lhsPath), .m_fileExists__path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				return Matcher.ComparisonResult(results)

			case let (.m_directoryExists__path(lhsPath), .m_directoryExists__path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				return Matcher.ComparisonResult(results)

			case let (.m_fileSize__path(lhsPath), .m_fileSize__path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				return Matcher.ComparisonResult(results)

			case let (.m_readData__pathlog_log(lhsPath, lhsLog), .m_readData__pathlog_log(rhsPath, rhsLog)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLog, rhs: rhsLog, with: matcher), lhsLog, rhsLog, "log"))
				return Matcher.ComparisonResult(results)

			case let (.m_readText__pathlog_log(lhsPath, lhsLog), .m_readText__pathlog_log(rhsPath, rhsLog)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLog, rhs: rhsLog, with: matcher), lhsLog, rhsLog, "log"))
				return Matcher.ComparisonResult(results)

			case let (.m_decode__pathdecoder_decoder(lhsPath, lhsDecoder), .m_decode__pathdecoder_decoder(rhsPath, rhsDecoder)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsDecoder, rhs: rhsDecoder, with: matcher), lhsDecoder, rhsDecoder, "decoder"))
				return Matcher.ComparisonResult(results)

			case let (.m_write__pathdata_data(lhsPath, lhsData), .m_write__pathdata_data(rhsPath, rhsData)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsData, rhs: rhsData, with: matcher), lhsData, rhsData, "data"))
				return Matcher.ComparisonResult(results)

			case let (.m_write__pathtext_text(lhsPath, lhsText), .m_write__pathtext_text(rhsPath, rhsText)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsText, rhs: rhsText, with: matcher), lhsText, rhsText, "text"))
				return Matcher.ComparisonResult(results)

			case let (.m_delete__path(lhsPath), .m_delete__path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				return Matcher.ComparisonResult(results)

			case let (.m_copy__sourceto_destination(lhsSource, lhsDestination), .m_copy__sourceto_destination(rhsSource, rhsDestination)):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsSource, rhs: rhsSource, with: matcher), lhsSource, rhsSource, "_ source"))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsDestination, rhs: rhsDestination, with: matcher),
					lhsDestination,
					rhsDestination,
					"to destination"
				))
				return Matcher.ComparisonResult(results)

			case let (.m_find__pathfile_fileline_line(lhsPath, lhsFile, lhsLine), .m_find__pathfile_fileline_line(rhsPath, rhsFile, rhsLine)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFile, rhs: rhsFile, with: matcher), lhsFile, rhsFile, "file"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLine, rhs: rhsLine, with: matcher), lhsLine, rhsLine, "line"))
				return Matcher.ComparisonResult(results)

			case let (.m_mkdir__path(lhsPath), .m_mkdir__path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_createSymlink__pathpointingTo_pointingTo(lhsPath, lhsPointingto),
				.m_createSymlink__pathpointingTo_pointingTo(rhsPath, rhsPointingto)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsPointingto, rhs: rhsPointingto, with: matcher),
					lhsPointingto,
					rhsPointingto,
					"pointingTo"
				))
				return Matcher.ComparisonResult(results)

			case let (.m_move__pathnewPath_newPath(lhsPath, lhsNewpath), .m_move__pathnewPath_newPath(rhsPath, rhsNewpath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNewpath, rhs: rhsNewpath, with: matcher), lhsNewpath, rhsNewpath, "newPath"))
				return Matcher.ComparisonResult(results)

			case (.m_homeDirectoryForCurrentUser, .m_homeDirectoryForCurrentUser): return .match

			case (.m_pwd, .m_pwd): return .match

			case let (.m_ls__path(lhsPath), .m_ls__path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				return Matcher.ComparisonResult(results)

			case let (.m_stat__pathkeys_keys(lhsPath, lhsKeys), .m_stat__pathkeys_keys(rhsPath, rhsKeys)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsKeys, rhs: rhsKeys, with: matcher), lhsKeys, rhsKeys, "keys"))
				return Matcher.ComparisonResult(results)
			default: return .none
			}
		}

		func intValue() -> Int {
			switch self {
			case let .m_fileExists__path(p0): return p0.intValue
			case let .m_directoryExists__path(p0): return p0.intValue
			case let .m_fileSize__path(p0): return p0.intValue
			case let .m_readData__pathlog_log(p0, p1): return p0.intValue + p1.intValue
			case let .m_readText__pathlog_log(p0, p1): return p0.intValue + p1.intValue
			case let .m_decode__pathdecoder_decoder(p0, p1): return p0.intValue + p1.intValue
			case let .m_write__pathdata_data(p0, p1): return p0.intValue + p1.intValue
			case let .m_write__pathtext_text(p0, p1): return p0.intValue + p1.intValue
			case let .m_delete__path(p0): return p0.intValue
			case let .m_copy__sourceto_destination(p0, p1): return p0.intValue + p1.intValue
			case let .m_find__pathfile_fileline_line(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
			case let .m_mkdir__path(p0): return p0.intValue
			case let .m_createSymlink__pathpointingTo_pointingTo(p0, p1): return p0.intValue + p1.intValue
			case let .m_move__pathnewPath_newPath(p0, p1): return p0.intValue + p1.intValue
			case .m_homeDirectoryForCurrentUser: return 0
			case .m_pwd: return 0
			case let .m_ls__path(p0): return p0.intValue
			case let .m_stat__pathkeys_keys(p0, p1): return p0.intValue + p1.intValue
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_fileExists__path: return ".fileExists(_:)"
			case .m_directoryExists__path: return ".directoryExists(_:)"
			case .m_fileSize__path: return ".fileSize(_:)"
			case .m_readData__pathlog_log: return ".readData(_:log:)"
			case .m_readText__pathlog_log: return ".readText(_:log:)"
			case .m_decode__pathdecoder_decoder: return ".decode(_:decoder:)"
			case .m_write__pathdata_data: return ".write(_:data:)"
			case .m_write__pathtext_text: return ".write(_:text:)"
			case .m_delete__path: return ".delete(_:)"
			case .m_copy__sourceto_destination: return ".copy(_:to:)"
			case .m_find__pathfile_fileline_line: return ".find(_:file:line:)"
			case .m_mkdir__path: return ".mkdir(_:)"
			case .m_createSymlink__pathpointingTo_pointingTo: return ".createSymlink(_:pointingTo:)"
			case .m_move__pathnewPath_newPath: return ".move(_:newPath:)"
			case .m_homeDirectoryForCurrentUser: return ".homeDirectoryForCurrentUser()"
			case .m_pwd: return ".pwd()"
			case .m_ls__path: return ".ls(_:)"
			case .m_stat__pathkeys_keys: return ".stat(_:keys:)"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func fileExists(_ path: Parameter<AbsolutePath>, willReturn: Bool...) -> MethodStub {
			return Given(method: .m_fileExists__path(path), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func directoryExists(_ path: Parameter<AbsolutePath>, willReturn: Bool...) -> MethodStub {
			return Given(method: .m_directoryExists__path(path), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func fileSize(_ path: Parameter<AbsolutePath>, willReturn: UInt64...) -> MethodStub {
			return Given(method: .m_fileSize__path(path), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func readData(_ path: Parameter<AbsolutePath>, log: Parameter<Bool>, willReturn: Data...) -> MethodStub {
			return Given(method: .m_readData__pathlog_log(path, log), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func readText(_ path: Parameter<AbsolutePath>, log: Parameter<Bool>, willReturn: String...) -> MethodStub {
			return Given(method: .m_readText__pathlog_log(path, log), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func decode<T: Decodable, D: AnyDecoder>(
			_ path: Parameter<AbsolutePath>,
			decoder: Parameter<D>,
			willReturn: T...
		) -> MethodStub {
			return Given(
				method: .m_decode__pathdecoder_decoder(path, decoder.wrapAsGeneric()),
				products: willReturn.map { StubProduct.return($0 as Any) }
			)
		}

		public static func find(
			_ path: Parameter<AbsolutePath>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willReturn: [AbsolutePath]...
		) -> MethodStub {
			return Given(method: .m_find__pathfile_fileline_line(path, file, line), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func homeDirectoryForCurrentUser(willReturn: AbsolutePath...) -> MethodStub {
			return Given(method: .m_homeDirectoryForCurrentUser, products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func pwd(willReturn: AbsolutePath...) -> MethodStub {
			return Given(method: .m_pwd, products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func ls(_ path: Parameter<AbsolutePath>, willReturn: [AbsolutePath]...) -> MethodStub {
			return Given(method: .m_ls__path(path), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func stat(
			_ path: Parameter<AbsolutePath>,
			keys: Parameter<Set<URLResourceKey>>,
			willReturn: URLResourceValues...
		) -> MethodStub {
			return Given(method: .m_stat__pathkeys_keys(path, keys), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func fileExists(_ path: Parameter<AbsolutePath>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
			let willReturn: [Bool] = []
			let given = Given(method: .m_fileExists__path(path), products: willReturn.map { StubProduct.return($0 as Any) })
			let stubber = given.stub(for: Bool.self)
			willProduce(stubber)
			return given
		}

		public static func directoryExists(_ path: Parameter<AbsolutePath>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
			let willReturn: [Bool] = []
			let given = Given(method: .m_directoryExists__path(path), products: willReturn.map { StubProduct.return($0 as Any) })
			let stubber = given.stub(for: Bool.self)
			willProduce(stubber)
			return given
		}

		public static func fileSize(_ path: Parameter<AbsolutePath>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_fileSize__path(path), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func fileSize(_ path: Parameter<AbsolutePath>, willProduce: (StubberThrows<UInt64>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_fileSize__path(path), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: UInt64.self)
			willProduce(stubber)
			return given
		}

		public static func readData(_ path: Parameter<AbsolutePath>, log: Parameter<Bool>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_readData__pathlog_log(path, log), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func readData(_ path: Parameter<AbsolutePath>, log: Parameter<Bool>, willProduce: (StubberThrows<Data>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_readData__pathlog_log(path, log), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Data.self)
			willProduce(stubber)
			return given
		}

		public static func readText(_ path: Parameter<AbsolutePath>, log: Parameter<Bool>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_readText__pathlog_log(path, log), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func readText(
			_ path: Parameter<AbsolutePath>,
			log: Parameter<Bool>,
			willProduce: (StubberThrows<String>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_readText__pathlog_log(path, log), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: String.self)
			willProduce(stubber)
			return given
		}

		public static func decode<D: AnyDecoder>(_ path: Parameter<AbsolutePath>, decoder: Parameter<D>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_decode__pathdecoder_decoder(path, decoder.wrapAsGeneric()), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func decode<T: Decodable, D: AnyDecoder>(
			_ path: Parameter<AbsolutePath>,
			decoder: Parameter<D>,
			willProduce: (StubberThrows<T>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_decode__pathdecoder_decoder(path, decoder.wrapAsGeneric()), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: T.self)
			willProduce(stubber)
			return given
		}

		public static func write(_ path: Parameter<AbsolutePath>, data: Parameter<Data>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_write__pathdata_data(path, data), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func write(_ path: Parameter<AbsolutePath>, data: Parameter<Data>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_write__pathdata_data(path, data), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func write(_ path: Parameter<AbsolutePath>, text: Parameter<String>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_write__pathtext_text(path, text), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func write(_ path: Parameter<AbsolutePath>, text: Parameter<String>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_write__pathtext_text(path, text), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func delete(_ path: Parameter<AbsolutePath>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_delete__path(path), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func delete(_ path: Parameter<AbsolutePath>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_delete__path(path), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func copy(_ source: Parameter<AbsolutePath>, to destination: Parameter<AbsolutePath>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_copy__sourceto_destination(source, destination), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func copy(
			_ source: Parameter<AbsolutePath>,
			to destination: Parameter<AbsolutePath>,
			willProduce: (StubberThrows<Void>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_copy__sourceto_destination(source, destination), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func find(_ path: Parameter<AbsolutePath>, file: Parameter<String>, line: Parameter<UInt>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_find__pathfile_fileline_line(path, file, line), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func find(
			_ path: Parameter<AbsolutePath>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			willProduce: (StubberThrows<[AbsolutePath]>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_find__pathfile_fileline_line(path, file, line), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: [AbsolutePath].self)
			willProduce(stubber)
			return given
		}

		public static func mkdir(_ path: Parameter<AbsolutePath>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_mkdir__path(path), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func mkdir(_ path: Parameter<AbsolutePath>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_mkdir__path(path), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func createSymlink(_ path: Parameter<AbsolutePath>, pointingTo: Parameter<AbsolutePath>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_createSymlink__pathpointingTo_pointingTo(path, pointingTo), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func createSymlink(
			_ path: Parameter<AbsolutePath>,
			pointingTo: Parameter<AbsolutePath>,
			willProduce: (StubberThrows<Void>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_createSymlink__pathpointingTo_pointingTo(path, pointingTo), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func move(_ path: Parameter<AbsolutePath>, newPath: Parameter<AbsolutePath>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_move__pathnewPath_newPath(path, newPath), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func move(
			_ path: Parameter<AbsolutePath>,
			newPath: Parameter<AbsolutePath>,
			willProduce: (StubberThrows<Void>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_move__pathnewPath_newPath(path, newPath), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func homeDirectoryForCurrentUser(willThrow: Error...) -> MethodStub {
			return Given(method: .m_homeDirectoryForCurrentUser, products: willThrow.map { StubProduct.throw($0) })
		}

		public static func homeDirectoryForCurrentUser(willProduce: (StubberThrows<AbsolutePath>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_homeDirectoryForCurrentUser, products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: AbsolutePath.self)
			willProduce(stubber)
			return given
		}

		public static func pwd(willThrow: Error...) -> MethodStub {
			return Given(method: .m_pwd, products: willThrow.map { StubProduct.throw($0) })
		}

		public static func pwd(willProduce: (StubberThrows<AbsolutePath>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_pwd, products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: AbsolutePath.self)
			willProduce(stubber)
			return given
		}

		public static func ls(_ path: Parameter<AbsolutePath>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_ls__path(path), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func ls(_ path: Parameter<AbsolutePath>, willProduce: (StubberThrows<[AbsolutePath]>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_ls__path(path), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: [AbsolutePath].self)
			willProduce(stubber)
			return given
		}

		public static func stat(_ path: Parameter<AbsolutePath>, keys: Parameter<Set<URLResourceKey>>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_stat__pathkeys_keys(path, keys), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func stat(
			_ path: Parameter<AbsolutePath>,
			keys: Parameter<Set<URLResourceKey>>,
			willProduce: (StubberThrows<URLResourceValues>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_stat__pathkeys_keys(path, keys), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: URLResourceValues.self)
			willProduce(stubber)
			return given
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func fileExists(_ path: Parameter<AbsolutePath>) -> Verify { return Verify(method: .m_fileExists__path(path)) }
		public static func directoryExists(_ path: Parameter<AbsolutePath>) -> Verify { return Verify(method: .m_directoryExists__path(path)) }
		public static func fileSize(_ path: Parameter<AbsolutePath>) -> Verify { return Verify(method: .m_fileSize__path(path)) }
		public static func readData(
			_ path: Parameter<AbsolutePath>,
			log: Parameter<Bool>
		) -> Verify { return Verify(method: .m_readData__pathlog_log(path, log)) }
		public static func readText(
			_ path: Parameter<AbsolutePath>,
			log: Parameter<Bool>
		) -> Verify { return Verify(method: .m_readText__pathlog_log(path, log)) }
		public static func decode<D>(_ path: Parameter<AbsolutePath>, decoder: Parameter<D>) -> Verify
			where D: AnyDecoder { return Verify(method: .m_decode__pathdecoder_decoder(path, decoder.wrapAsGeneric())) }
		public static func write(
			_ path: Parameter<AbsolutePath>,
			data: Parameter<Data>
		) -> Verify { return Verify(method: .m_write__pathdata_data(path, data)) }
		public static func write(
			_ path: Parameter<AbsolutePath>,
			text: Parameter<String>
		) -> Verify { return Verify(method: .m_write__pathtext_text(path, text)) }
		public static func delete(_ path: Parameter<AbsolutePath>) -> Verify { return Verify(method: .m_delete__path(path)) }
		public static func copy(
			_ source: Parameter<AbsolutePath>,
			to destination: Parameter<AbsolutePath>
		) -> Verify { return Verify(method: .m_copy__sourceto_destination(source, destination)) }
		public static func find(
			_ path: Parameter<AbsolutePath>,
			file: Parameter<String>,
			line: Parameter<UInt>
		) -> Verify { return Verify(method: .m_find__pathfile_fileline_line(path, file, line)) }
		public static func mkdir(_ path: Parameter<AbsolutePath>) -> Verify { return Verify(method: .m_mkdir__path(path)) }
		public static func createSymlink(
			_ path: Parameter<AbsolutePath>,
			pointingTo: Parameter<AbsolutePath>
		) -> Verify { return Verify(method: .m_createSymlink__pathpointingTo_pointingTo(path, pointingTo)) }
		public static func move(
			_ path: Parameter<AbsolutePath>,
			newPath: Parameter<AbsolutePath>
		) -> Verify { return Verify(method: .m_move__pathnewPath_newPath(path, newPath)) }
		public static func homeDirectoryForCurrentUser() -> Verify { return Verify(method: .m_homeDirectoryForCurrentUser) }
		public static func pwd() -> Verify { return Verify(method: .m_pwd) }
		public static func ls(_ path: Parameter<AbsolutePath>) -> Verify { return Verify(method: .m_ls__path(path)) }
		public static func stat(
			_ path: Parameter<AbsolutePath>,
			keys: Parameter<Set<URLResourceKey>>
		) -> Verify { return Verify(method: .m_stat__pathkeys_keys(path, keys)) }
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func fileExists(_ path: Parameter<AbsolutePath>, perform: @escaping (AbsolutePath) -> Void) -> Perform {
			return Perform(method: .m_fileExists__path(path), performs: perform)
		}

		public static func directoryExists(_ path: Parameter<AbsolutePath>, perform: @escaping (AbsolutePath) -> Void) -> Perform {
			return Perform(method: .m_directoryExists__path(path), performs: perform)
		}

		public static func fileSize(_ path: Parameter<AbsolutePath>, perform: @escaping (AbsolutePath) -> Void) -> Perform {
			return Perform(method: .m_fileSize__path(path), performs: perform)
		}

		public static func readData(
			_ path: Parameter<AbsolutePath>,
			log: Parameter<Bool>,
			perform: @escaping (AbsolutePath, Bool) -> Void
		) -> Perform {
			return Perform(method: .m_readData__pathlog_log(path, log), performs: perform)
		}

		public static func readText(
			_ path: Parameter<AbsolutePath>,
			log: Parameter<Bool>,
			perform: @escaping (AbsolutePath, Bool) -> Void
		) -> Perform {
			return Perform(method: .m_readText__pathlog_log(path, log), performs: perform)
		}

		public static func decode<D>(_ path: Parameter<AbsolutePath>, decoder: Parameter<D>, perform: @escaping (AbsolutePath, D) -> Void) -> Perform
			where D: AnyDecoder {
			return Perform(method: .m_decode__pathdecoder_decoder(path, decoder.wrapAsGeneric()), performs: perform)
		}

		public static func write(_ path: Parameter<AbsolutePath>, data: Parameter<Data>, perform: @escaping (AbsolutePath, Data) -> Void) -> Perform {
			return Perform(method: .m_write__pathdata_data(path, data), performs: perform)
		}

		public static func write(
			_ path: Parameter<AbsolutePath>,
			text: Parameter<String>,
			perform: @escaping (AbsolutePath, String) -> Void
		) -> Perform {
			return Perform(method: .m_write__pathtext_text(path, text), performs: perform)
		}

		public static func delete(_ path: Parameter<AbsolutePath>, perform: @escaping (AbsolutePath) -> Void) -> Perform {
			return Perform(method: .m_delete__path(path), performs: perform)
		}

		public static func copy(
			_ source: Parameter<AbsolutePath>,
			to destination: Parameter<AbsolutePath>,
			perform: @escaping (AbsolutePath, AbsolutePath) -> Void
		) -> Perform {
			return Perform(method: .m_copy__sourceto_destination(source, destination), performs: perform)
		}

		public static func find(
			_ path: Parameter<AbsolutePath>,
			file: Parameter<String>,
			line: Parameter<UInt>,
			perform: @escaping (AbsolutePath, String, UInt) -> Void
		) -> Perform {
			return Perform(method: .m_find__pathfile_fileline_line(path, file, line), performs: perform)
		}

		public static func mkdir(_ path: Parameter<AbsolutePath>, perform: @escaping (AbsolutePath) -> Void) -> Perform {
			return Perform(method: .m_mkdir__path(path), performs: perform)
		}

		public static func createSymlink(
			_ path: Parameter<AbsolutePath>,
			pointingTo: Parameter<AbsolutePath>,
			perform: @escaping (AbsolutePath, AbsolutePath) -> Void
		) -> Perform {
			return Perform(method: .m_createSymlink__pathpointingTo_pointingTo(path, pointingTo), performs: perform)
		}

		public static func move(
			_ path: Parameter<AbsolutePath>,
			newPath: Parameter<AbsolutePath>,
			perform: @escaping (AbsolutePath, AbsolutePath) -> Void
		) -> Perform {
			return Perform(method: .m_move__pathnewPath_newPath(path, newPath), performs: perform)
		}

		public static func homeDirectoryForCurrentUser(perform: @escaping () -> Void) -> Perform {
			return Perform(method: .m_homeDirectoryForCurrentUser, performs: perform)
		}

		public static func pwd(perform: @escaping () -> Void) -> Perform {
			return Perform(method: .m_pwd, performs: perform)
		}

		public static func ls(_ path: Parameter<AbsolutePath>, perform: @escaping (AbsolutePath) -> Void) -> Perform {
			return Perform(method: .m_ls__path(path), performs: perform)
		}

		public static func stat(
			_ path: Parameter<AbsolutePath>,
			keys: Parameter<Set<URLResourceKey>>,
			perform: @escaping (AbsolutePath, Set<URLResourceKey>) -> Void
		) -> Perform {
			return Perform(method: .m_stat__pathkeys_keys(path, keys), performs: perform)
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

// MARK: - FileManagerProtocol

open class FileManagerProtocolMock: FileManagerProtocol, Mock {
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

	public var currentDirectoryPath: String { invocations.append(.p_currentDirectoryPath_get); return __p_currentDirectoryPath ?? givenGetterValue(
		.p_currentDirectoryPath_get,
		"FileManagerProtocolMock - stub value for currentDirectoryPath was not defined"
	) }

	private var __p_currentDirectoryPath: String?

	public var homeDirectoryForCurrentUser: URL {
		invocations.append(.p_homeDirectoryForCurrentUser_get); return __p_homeDirectoryForCurrentUser ?? givenGetterValue(
			.p_homeDirectoryForCurrentUser_get,
			"FileManagerProtocolMock - stub value for homeDirectoryForCurrentUser was not defined"
		)
	}

	private var __p_homeDirectoryForCurrentUser: URL?

	open func fileExists(_ path: String) -> Bool {
		addInvocation(.m_fileExists__path(Parameter<String>.value(path)))
		let perform = methodPerformValue(.m_fileExists__path(Parameter<String>.value(path))) as? (String) -> Void
		perform?(path)
		var __value: Bool
		do {
			__value = try methodReturnValue(.m_fileExists__path(Parameter<String>.value(path))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for fileExists(_ path: String). Use given")
			Failure("Stub return value not specified for fileExists(_ path: String). Use given")
		}
		return __value
	}

	open func directoryExists(_ path: String) -> Bool {
		addInvocation(.m_directoryExists__path(Parameter<String>.value(path)))
		let perform = methodPerformValue(.m_directoryExists__path(Parameter<String>.value(path))) as? (String) -> Void
		perform?(path)
		var __value: Bool
		do {
			__value = try methodReturnValue(.m_directoryExists__path(Parameter<String>.value(path))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for directoryExists(_ path: String). Use given")
			Failure("Stub return value not specified for directoryExists(_ path: String). Use given")
		}
		return __value
	}

	open func createDirectory(
		atPath path: String,
		withIntermediateDirectories createIntermediates: Bool,
		attributes: [FileAttributeKey: Any]?
	) throws {
		addInvocation(.m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(
			Parameter<String>.value(path),
			Parameter<Bool>.value(createIntermediates),
			Parameter<[FileAttributeKey: Any]?>.value(attributes)
		))
		let perform = methodPerformValue(.m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(
			Parameter<String>.value(path),
			Parameter<Bool>.value(createIntermediates),
			Parameter<[FileAttributeKey: Any]?>.value(attributes)
		)) as? (String, Bool, [FileAttributeKey: Any]?) -> Void
		perform?(path, createIntermediates, attributes)
		do {
			_ = try methodReturnValue(.m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(
				Parameter<String>.value(path),
				Parameter<Bool>.value(createIntermediates),
				Parameter<[FileAttributeKey: Any]?>.value(attributes)
			)).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func removeItem(atPath path: String) throws {
		addInvocation(.m_removeItem__atPath_path(Parameter<String>.value(path)))
		let perform = methodPerformValue(.m_removeItem__atPath_path(Parameter<String>.value(path))) as? (String) -> Void
		perform?(path)
		do {
			_ = try methodReturnValue(.m_removeItem__atPath_path(Parameter<String>.value(path))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func copyItem(atPath srcPath: String, toPath dstPath: String) throws {
		addInvocation(.m_copyItem__atPath_srcPathtoPath_dstPath(Parameter<String>.value(srcPath), Parameter<String>.value(dstPath)))
		let perform =
			methodPerformValue(.m_copyItem__atPath_srcPathtoPath_dstPath(Parameter<String>.value(srcPath), Parameter<String>.value(dstPath))) as? (
				String,
				String
			) -> Void
		perform?(srcPath, dstPath)
		do {
			_ = try methodReturnValue(.m_copyItem__atPath_srcPathtoPath_dstPath(Parameter<String>.value(srcPath), Parameter<String>.value(dstPath)))
				.casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func subpathsOfDirectory(atPath path: String) throws -> [String] {
		addInvocation(.m_subpathsOfDirectory__atPath_path(Parameter<String>.value(path)))
		let perform = methodPerformValue(.m_subpathsOfDirectory__atPath_path(Parameter<String>.value(path))) as? (String) -> Void
		perform?(path)
		var __value: [String]
		do {
			__value = try methodReturnValue(.m_subpathsOfDirectory__atPath_path(Parameter<String>.value(path))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for subpathsOfDirectory(atPath path: String). Use given")
			Failure("Stub return value not specified for subpathsOfDirectory(atPath path: String). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func createSymbolicLink(atPath path: String, withDestinationPath destPath: String) throws {
		addInvocation(.m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(
			Parameter<String>.value(path),
			Parameter<String>.value(destPath)
		))
		let perform =
			methodPerformValue(.m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(
				Parameter<String>.value(path),
				Parameter<String>.value(destPath)
			)) as? (String, String) -> Void
		perform?(path, destPath)
		do {
			_ =
				try methodReturnValue(.m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(
					Parameter<String>.value(path),
					Parameter<String>.value(destPath)
				)).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func contents(atPath: String) throws -> Data? {
		addInvocation(.m_contents__atPath_atPath(Parameter<String>.value(atPath)))
		let perform = methodPerformValue(.m_contents__atPath_atPath(Parameter<String>.value(atPath))) as? (String) -> Void
		perform?(atPath)
		var __value: Data?
		do {
			__value = try methodReturnValue(.m_contents__atPath_atPath(Parameter<String>.value(atPath))).casted()
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
		return __value
	}

	open func moveItem(atPath: String, toPath: String) throws {
		addInvocation(.m_moveItem__atPath_atPathtoPath_toPath(Parameter<String>.value(atPath), Parameter<String>.value(toPath)))
		let perform =
			methodPerformValue(.m_moveItem__atPath_atPathtoPath_toPath(Parameter<String>.value(atPath), Parameter<String>.value(toPath))) as? (String, String)
				-> Void
		perform?(atPath, toPath)
		do {
			_ = try methodReturnValue(.m_moveItem__atPath_atPathtoPath_toPath(Parameter<String>.value(atPath), Parameter<String>.value(toPath)))
				.casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func contentsOfDirectory(atPath: String) throws -> [String] {
		addInvocation(.m_contentsOfDirectory__atPath_atPath(Parameter<String>.value(atPath)))
		let perform = methodPerformValue(.m_contentsOfDirectory__atPath_atPath(Parameter<String>.value(atPath))) as? (String) -> Void
		perform?(atPath)
		var __value: [String]
		do {
			__value = try methodReturnValue(.m_contentsOfDirectory__atPath_atPath(Parameter<String>.value(atPath))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for contentsOfDirectory(atPath: String). Use given")
			Failure("Stub return value not specified for contentsOfDirectory(atPath: String). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func attributesOfItem(atPath path: String) throws -> [FileAttributeKey: Any] {
		addInvocation(.m_attributesOfItem__atPath_path(Parameter<String>.value(path)))
		let perform = methodPerformValue(.m_attributesOfItem__atPath_path(Parameter<String>.value(path))) as? (String) -> Void
		perform?(path)
		var __value: [FileAttributeKey: Any]
		do {
			__value = try methodReturnValue(.m_attributesOfItem__atPath_path(Parameter<String>.value(path))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for attributesOfItem(atPath path: String). Use given")
			Failure("Stub return value not specified for attributesOfItem(atPath path: String). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func contentsOfDirectory(
		at url: URL,
		includingPropertiesForKeys keys: [URLResourceKey]?,
		options mask: FileManager.DirectoryEnumerationOptions
	) throws -> [URL] {
		addInvocation(.m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(
			Parameter<URL>.value(url),
			Parameter<[URLResourceKey]?>.value(keys),
			Parameter<FileManager.DirectoryEnumerationOptions>.value(mask)
		))
		let perform = methodPerformValue(.m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(
			Parameter<URL>.value(url),
			Parameter<[URLResourceKey]?>.value(keys),
			Parameter<FileManager.DirectoryEnumerationOptions>.value(mask)
		)) as? (URL, [URLResourceKey]?, FileManager.DirectoryEnumerationOptions) -> Void
		perform?(url, keys, mask)
		var __value: [URL]
		do {
			__value = try methodReturnValue(.m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(
				Parameter<URL>.value(url),
				Parameter<[URLResourceKey]?>.value(keys),
				Parameter<FileManager.DirectoryEnumerationOptions>.value(mask)
			)).casted()
		} catch MockError.notStubed {
			onFatalFailure(
				"Stub return value not specified for contentsOfDirectory(at url: URL, includingPropertiesForKeys keys: [URLResourceKey]?, options mask: FileManager.DirectoryEnumerationOptions). Use given"
			)
			Failure(
				"Stub return value not specified for contentsOfDirectory(at url: URL, includingPropertiesForKeys keys: [URLResourceKey]?, options mask: FileManager.DirectoryEnumerationOptions). Use given"
			)
		} catch {
			throw error
		}
		return __value
	}

	open func createDirectory(atPath path: String, withIntermediateDirectories createIntermediates: Bool) throws {
		addInvocation(.m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(
			Parameter<String>.value(path),
			Parameter<Bool>.value(createIntermediates)
		))
		let perform = methodPerformValue(.m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(
			Parameter<String>.value(path),
			Parameter<Bool>.value(createIntermediates)
		)) as? (String, Bool) -> Void
		perform?(path, createIntermediates)
		do {
			_ = try methodReturnValue(.m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(
				Parameter<String>.value(path),
				Parameter<Bool>.value(createIntermediates)
			)).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
			throw error
		}
	}

	open func contentsOfDirectory(at url: URL, includingPropertiesForKeys keys: [URLResourceKey]?) throws -> [URL] {
		addInvocation(.m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(
			Parameter<URL>.value(url),
			Parameter<[URLResourceKey]?>.value(keys)
		))
		let perform =
			methodPerformValue(.m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(
				Parameter<URL>.value(url),
				Parameter<[URLResourceKey]?>.value(keys)
			)) as? (URL, [URLResourceKey]?) -> Void
		perform?(url, keys)
		var __value: [URL]
		do {
			__value =
				try methodReturnValue(.m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(
					Parameter<URL>.value(url),
					Parameter<[URLResourceKey]?>.value(keys)
				)).casted()
		} catch MockError.notStubed {
			onFatalFailure(
				"Stub return value not specified for contentsOfDirectory(at url: URL, includingPropertiesForKeys keys: [URLResourceKey]?). Use given"
			)
			Failure("Stub return value not specified for contentsOfDirectory(at url: URL, includingPropertiesForKeys keys: [URLResourceKey]?). Use given")
		} catch {
			throw error
		}
		return __value
	}

	open func contentsOfDirectory(at url: URL) throws -> [URL] {
		addInvocation(.m_contentsOfDirectory__at_url(Parameter<URL>.value(url)))
		let perform = methodPerformValue(.m_contentsOfDirectory__at_url(Parameter<URL>.value(url))) as? (URL) -> Void
		perform?(url)
		var __value: [URL]
		do {
			__value = try methodReturnValue(.m_contentsOfDirectory__at_url(Parameter<URL>.value(url))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for contentsOfDirectory(at url: URL). Use given")
			Failure("Stub return value not specified for contentsOfDirectory(at url: URL). Use given")
		} catch {
			throw error
		}
		return __value
	}

	fileprivate enum MethodType {
		case m_fileExists__path(Parameter<String>)
		case m_directoryExists__path(Parameter<String>)
		case m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(
			Parameter<String>,
			Parameter<Bool>,
			Parameter<[FileAttributeKey: Any]?>
		)
		case m_removeItem__atPath_path(Parameter<String>)
		case m_copyItem__atPath_srcPathtoPath_dstPath(Parameter<String>, Parameter<String>)
		case m_subpathsOfDirectory__atPath_path(Parameter<String>)
		case m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(Parameter<String>, Parameter<String>)
		case m_contents__atPath_atPath(Parameter<String>)
		case m_moveItem__atPath_atPathtoPath_toPath(Parameter<String>, Parameter<String>)
		case m_contentsOfDirectory__atPath_atPath(Parameter<String>)
		case m_attributesOfItem__atPath_path(Parameter<String>)
		case m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(
			Parameter<URL>,
			Parameter<[URLResourceKey]?>,
			Parameter<FileManager.DirectoryEnumerationOptions>
		)
		case m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(Parameter<String>, Parameter<Bool>)
		case m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(Parameter<URL>, Parameter<[URLResourceKey]?>)
		case m_contentsOfDirectory__at_url(Parameter<URL>)
		case p_currentDirectoryPath_get
		case p_homeDirectoryForCurrentUser_get

		static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
			switch (lhs, rhs) {
			case let (.m_fileExists__path(lhsPath), .m_fileExists__path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				return Matcher.ComparisonResult(results)

			case let (.m_directoryExists__path(lhsPath), .m_directoryExists__path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "_ path"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(
					lhsPath,
					lhsCreateintermediates,
					lhsAttributes
				),
				.m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(
					rhsPath,
					rhsCreateintermediates,
					rhsAttributes
				)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "atPath path"))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsCreateintermediates, rhs: rhsCreateintermediates, with: matcher),
					lhsCreateintermediates,
					rhsCreateintermediates,
					"withIntermediateDirectories createIntermediates"
				))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsAttributes, rhs: rhsAttributes, with: matcher),
					lhsAttributes,
					rhsAttributes,
					"attributes"
				))
				return Matcher.ComparisonResult(results)

			case let (.m_removeItem__atPath_path(lhsPath), .m_removeItem__atPath_path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "atPath path"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_copyItem__atPath_srcPathtoPath_dstPath(lhsSrcpath, lhsDstpath),
				.m_copyItem__atPath_srcPathtoPath_dstPath(rhsSrcpath, rhsDstpath)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsSrcpath, rhs: rhsSrcpath, with: matcher), lhsSrcpath, rhsSrcpath, "atPath srcPath")
					)
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsDstpath, rhs: rhsDstpath, with: matcher), lhsDstpath, rhsDstpath, "toPath dstPath")
					)
				return Matcher.ComparisonResult(results)

			case let (.m_subpathsOfDirectory__atPath_path(lhsPath), .m_subpathsOfDirectory__atPath_path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "atPath path"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(lhsPath, lhsDestpath),
				.m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(rhsPath, rhsDestpath)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "atPath path"))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsDestpath, rhs: rhsDestpath, with: matcher),
					lhsDestpath,
					rhsDestpath,
					"withDestinationPath destPath"
				))
				return Matcher.ComparisonResult(results)

			case let (.m_contents__atPath_atPath(lhsAtpath), .m_contents__atPath_atPath(rhsAtpath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsAtpath, rhs: rhsAtpath, with: matcher), lhsAtpath, rhsAtpath, "atPath"))
				return Matcher.ComparisonResult(results)

			case let (.m_moveItem__atPath_atPathtoPath_toPath(lhsAtpath, lhsTopath), .m_moveItem__atPath_atPathtoPath_toPath(rhsAtpath, rhsTopath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsAtpath, rhs: rhsAtpath, with: matcher), lhsAtpath, rhsAtpath, "atPath"))
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsTopath, rhs: rhsTopath, with: matcher), lhsTopath, rhsTopath, "toPath"))
				return Matcher.ComparisonResult(results)

			case let (.m_contentsOfDirectory__atPath_atPath(lhsAtpath), .m_contentsOfDirectory__atPath_atPath(rhsAtpath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results
					.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsAtpath, rhs: rhsAtpath, with: matcher), lhsAtpath, rhsAtpath, "atPath"))
				return Matcher.ComparisonResult(results)

			case let (.m_attributesOfItem__atPath_path(lhsPath), .m_attributesOfItem__atPath_path(rhsPath)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "atPath path"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(lhsUrl, lhsKeys, lhsMask),
				.m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(rhsUrl, rhsKeys, rhsMask)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUrl, rhs: rhsUrl, with: matcher), lhsUrl, rhsUrl, "at url"))
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsKeys, rhs: rhsKeys, with: matcher), lhsKeys, rhsKeys, "includingPropertiesForKeys keys")
					)
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMask, rhs: rhsMask, with: matcher), lhsMask, rhsMask, "options mask"))
				return Matcher.ComparisonResult(results)

			case let (
				.m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(lhsPath, lhsCreateintermediates),
				.m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(rhsPath, rhsCreateintermediates)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher), lhsPath, rhsPath, "atPath path"))
				results.append(Matcher.ParameterComparisonResult(
					Parameter.compare(lhs: lhsCreateintermediates, rhs: rhsCreateintermediates, with: matcher),
					lhsCreateintermediates,
					rhsCreateintermediates,
					"withIntermediateDirectories createIntermediates"
				))
				return Matcher.ComparisonResult(results)

			case let (
				.m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(lhsUrl, lhsKeys),
				.m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(rhsUrl, rhsKeys)
			):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUrl, rhs: rhsUrl, with: matcher), lhsUrl, rhsUrl, "at url"))
				results
					.append(
						Matcher
							.ParameterComparisonResult(Parameter.compare(lhs: lhsKeys, rhs: rhsKeys, with: matcher), lhsKeys, rhsKeys, "includingPropertiesForKeys keys")
					)
				return Matcher.ComparisonResult(results)

			case let (.m_contentsOfDirectory__at_url(lhsUrl), .m_contentsOfDirectory__at_url(rhsUrl)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUrl, rhs: rhsUrl, with: matcher), lhsUrl, rhsUrl, "at url"))
				return Matcher.ComparisonResult(results)
			case (.p_currentDirectoryPath_get, .p_currentDirectoryPath_get): return Matcher.ComparisonResult.match
			case (.p_homeDirectoryForCurrentUser_get, .p_homeDirectoryForCurrentUser_get): return Matcher.ComparisonResult.match
			default: return .none
			}
		}

		func intValue() -> Int {
			switch self {
			case let .m_fileExists__path(p0): return p0.intValue
			case let .m_directoryExists__path(p0): return p0.intValue
			case let .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(p0, p1, p2): return p0
				.intValue + p1.intValue + p2.intValue
			case let .m_removeItem__atPath_path(p0): return p0.intValue
			case let .m_copyItem__atPath_srcPathtoPath_dstPath(p0, p1): return p0.intValue + p1.intValue
			case let .m_subpathsOfDirectory__atPath_path(p0): return p0.intValue
			case let .m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(p0, p1): return p0.intValue + p1.intValue
			case let .m_contents__atPath_atPath(p0): return p0.intValue
			case let .m_moveItem__atPath_atPathtoPath_toPath(p0, p1): return p0.intValue + p1.intValue
			case let .m_contentsOfDirectory__atPath_atPath(p0): return p0.intValue
			case let .m_attributesOfItem__atPath_path(p0): return p0.intValue
			case let .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(p0, p1, p2): return p0.intValue + p1.intValue + p2
				.intValue
			case let .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(p0, p1): return p0.intValue + p1.intValue
			case let .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(p0, p1): return p0.intValue + p1.intValue
			case let .m_contentsOfDirectory__at_url(p0): return p0.intValue
			case .p_currentDirectoryPath_get: return 0
			case .p_homeDirectoryForCurrentUser_get: return 0
			}
		}

		func assertionName() -> String {
			switch self {
			case .m_fileExists__path: return ".fileExists(_:)"
			case .m_directoryExists__path: return ".directoryExists(_:)"
			case .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes: return ".createDirectory(atPath:withIntermediateDirectories:attributes:)"
			case .m_removeItem__atPath_path: return ".removeItem(atPath:)"
			case .m_copyItem__atPath_srcPathtoPath_dstPath: return ".copyItem(atPath:toPath:)"
			case .m_subpathsOfDirectory__atPath_path: return ".subpathsOfDirectory(atPath:)"
			case .m_createSymbolicLink__atPath_pathwithDestinationPath_destPath: return ".createSymbolicLink(atPath:withDestinationPath:)"
			case .m_contents__atPath_atPath: return ".contents(atPath:)"
			case .m_moveItem__atPath_atPathtoPath_toPath: return ".moveItem(atPath:toPath:)"
			case .m_contentsOfDirectory__atPath_atPath: return ".contentsOfDirectory(atPath:)"
			case .m_attributesOfItem__atPath_path: return ".attributesOfItem(atPath:)"
			case .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask: return ".contentsOfDirectory(at:includingPropertiesForKeys:options:)"
			case .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates: return ".createDirectory(atPath:withIntermediateDirectories:)"
			case .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys: return ".contentsOfDirectory(at:includingPropertiesForKeys:)"
			case .m_contentsOfDirectory__at_url: return ".contentsOfDirectory(at:)"
			case .p_currentDirectoryPath_get: return "[get] .currentDirectoryPath"
			case .p_homeDirectoryForCurrentUser_get: return "[get] .homeDirectoryForCurrentUser"
			}
		}
	}

	open class Given: StubbedMethod {
		fileprivate var method: MethodType

		private init(method: MethodType, products: [StubProduct]) {
			self.method = method
			super.init(products)
		}

		public static func currentDirectoryPath(getter defaultValue: String...) -> PropertyStub {
			return Given(method: .p_currentDirectoryPath_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func homeDirectoryForCurrentUser(getter defaultValue: URL...) -> PropertyStub {
			return Given(method: .p_homeDirectoryForCurrentUser_get, products: defaultValue.map { StubProduct.return($0 as Any) })
		}

		public static func fileExists(_ path: Parameter<String>, willReturn: Bool...) -> MethodStub {
			return Given(method: .m_fileExists__path(path), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func directoryExists(_ path: Parameter<String>, willReturn: Bool...) -> MethodStub {
			return Given(method: .m_directoryExists__path(path), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func subpathsOfDirectory(atPath path: Parameter<String>, willReturn: [String]...) -> MethodStub {
			return Given(method: .m_subpathsOfDirectory__atPath_path(path), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func contents(atPath: Parameter<String>, willReturn: Data?...) -> MethodStub {
			return Given(method: .m_contents__atPath_atPath(atPath), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func contentsOfDirectory(atPath: Parameter<String>, willReturn: [String]...) -> MethodStub {
			return Given(method: .m_contentsOfDirectory__atPath_atPath(atPath), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func attributesOfItem(atPath path: Parameter<String>, willReturn: [FileAttributeKey: Any]...) -> MethodStub {
			return Given(method: .m_attributesOfItem__atPath_path(path), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func contentsOfDirectory(
			at url: Parameter<URL>,
			includingPropertiesForKeys keys: Parameter<[URLResourceKey]?>,
			options mask: Parameter<FileManager.DirectoryEnumerationOptions>,
			willReturn: [URL]...
		) -> MethodStub {
			return Given(
				method: .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(url, keys, mask),
				products: willReturn.map { StubProduct.return($0 as Any) }
			)
		}

		public static func contentsOfDirectory(
			at url: Parameter<URL>,
			includingPropertiesForKeys keys: Parameter<[URLResourceKey]?>,
			willReturn: [URL]...
		) -> MethodStub {
			return Given(
				method: .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(url, keys),
				products: willReturn.map { StubProduct.return($0 as Any) }
			)
		}

		public static func contentsOfDirectory(at url: Parameter<URL>, willReturn: [URL]...) -> MethodStub {
			return Given(method: .m_contentsOfDirectory__at_url(url), products: willReturn.map { StubProduct.return($0 as Any) })
		}

		public static func fileExists(_ path: Parameter<String>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
			let willReturn: [Bool] = []
			let given = Given(method: .m_fileExists__path(path), products: willReturn.map { StubProduct.return($0 as Any) })
			let stubber = given.stub(for: Bool.self)
			willProduce(stubber)
			return given
		}

		public static func directoryExists(_ path: Parameter<String>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
			let willReturn: [Bool] = []
			let given = Given(method: .m_directoryExists__path(path), products: willReturn.map { StubProduct.return($0 as Any) })
			let stubber = given.stub(for: Bool.self)
			willProduce(stubber)
			return given
		}

		public static func createDirectory(
			atPath path: Parameter<String>,
			withIntermediateDirectories createIntermediates: Parameter<Bool>,
			attributes: Parameter<[FileAttributeKey: Any]?>,
			willThrow: Error...
		) -> MethodStub {
			return Given(
				method: .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(
					path,
					createIntermediates,
					attributes
				),
				products: willThrow.map { StubProduct.throw($0) }
			)
		}

		public static func createDirectory(
			atPath path: Parameter<String>,
			withIntermediateDirectories createIntermediates: Parameter<Bool>,
			attributes: Parameter<[FileAttributeKey: Any]?>,
			willProduce: (StubberThrows<Void>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(
				method: .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(
					path,
					createIntermediates,
					attributes
				),
				products: willThrow.map { StubProduct.throw($0) }
			)
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func removeItem(atPath path: Parameter<String>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_removeItem__atPath_path(path), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func removeItem(atPath path: Parameter<String>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_removeItem__atPath_path(path), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func copyItem(atPath srcPath: Parameter<String>, toPath dstPath: Parameter<String>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_copyItem__atPath_srcPathtoPath_dstPath(srcPath, dstPath), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func copyItem(
			atPath srcPath: Parameter<String>,
			toPath dstPath: Parameter<String>,
			willProduce: (StubberThrows<Void>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_copyItem__atPath_srcPathtoPath_dstPath(srcPath, dstPath), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func subpathsOfDirectory(atPath path: Parameter<String>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_subpathsOfDirectory__atPath_path(path), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func subpathsOfDirectory(atPath path: Parameter<String>, willProduce: (StubberThrows<[String]>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_subpathsOfDirectory__atPath_path(path), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: [String].self)
			willProduce(stubber)
			return given
		}

		public static func createSymbolicLink(
			atPath path: Parameter<String>,
			withDestinationPath destPath: Parameter<String>,
			willThrow: Error...
		) -> MethodStub {
			return Given(
				method: .m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(path, destPath),
				products: willThrow.map { StubProduct.throw($0) }
			)
		}

		public static func createSymbolicLink(
			atPath path: Parameter<String>,
			withDestinationPath destPath: Parameter<String>,
			willProduce: (StubberThrows<Void>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(
				method: .m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(path, destPath),
				products: willThrow.map { StubProduct.throw($0) }
			)
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func contents(atPath: Parameter<String>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_contents__atPath_atPath(atPath), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func contents(atPath: Parameter<String>, willProduce: (StubberThrows<Data?>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_contents__atPath_atPath(atPath), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: (Data?).self)
			willProduce(stubber)
			return given
		}

		public static func moveItem(atPath: Parameter<String>, toPath: Parameter<String>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_moveItem__atPath_atPathtoPath_toPath(atPath, toPath), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func moveItem(atPath: Parameter<String>, toPath: Parameter<String>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_moveItem__atPath_atPathtoPath_toPath(atPath, toPath), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func contentsOfDirectory(atPath: Parameter<String>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_contentsOfDirectory__atPath_atPath(atPath), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func contentsOfDirectory(atPath: Parameter<String>, willProduce: (StubberThrows<[String]>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_contentsOfDirectory__atPath_atPath(atPath), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: [String].self)
			willProduce(stubber)
			return given
		}

		public static func attributesOfItem(atPath path: Parameter<String>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_attributesOfItem__atPath_path(path), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func attributesOfItem(
			atPath path: Parameter<String>,
			willProduce: (StubberThrows<[FileAttributeKey: Any]>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_attributesOfItem__atPath_path(path), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: [FileAttributeKey: Any].self)
			willProduce(stubber)
			return given
		}

		public static func contentsOfDirectory(
			at url: Parameter<URL>,
			includingPropertiesForKeys keys: Parameter<[URLResourceKey]?>,
			options mask: Parameter<FileManager.DirectoryEnumerationOptions>,
			willThrow: Error...
		) -> MethodStub {
			return Given(
				method: .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(url, keys, mask),
				products: willThrow.map { StubProduct.throw($0) }
			)
		}

		public static func contentsOfDirectory(
			at url: Parameter<URL>,
			includingPropertiesForKeys keys: Parameter<[URLResourceKey]?>,
			options mask: Parameter<FileManager.DirectoryEnumerationOptions>,
			willProduce: (StubberThrows<[URL]>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(
				method: .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(url, keys, mask),
				products: willThrow.map { StubProduct.throw($0) }
			)
			let stubber = given.stubThrows(for: [URL].self)
			willProduce(stubber)
			return given
		}

		public static func createDirectory(
			atPath path: Parameter<String>,
			withIntermediateDirectories createIntermediates: Parameter<Bool>,
			willThrow: Error...
		) -> MethodStub {
			return Given(
				method: .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(path, createIntermediates),
				products: willThrow.map { StubProduct.throw($0) }
			)
		}

		public static func createDirectory(
			atPath path: Parameter<String>,
			withIntermediateDirectories createIntermediates: Parameter<Bool>,
			willProduce: (StubberThrows<Void>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(
				method: .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(path, createIntermediates),
				products: willThrow.map { StubProduct.throw($0) }
			)
			let stubber = given.stubThrows(for: Void.self)
			willProduce(stubber)
			return given
		}

		public static func contentsOfDirectory(
			at url: Parameter<URL>,
			includingPropertiesForKeys keys: Parameter<[URLResourceKey]?>,
			willThrow: Error...
		) -> MethodStub {
			return Given(
				method: .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(url, keys),
				products: willThrow.map { StubProduct.throw($0) }
			)
		}

		public static func contentsOfDirectory(
			at url: Parameter<URL>,
			includingPropertiesForKeys keys: Parameter<[URLResourceKey]?>,
			willProduce: (StubberThrows<[URL]>) -> Void
		) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(
				method: .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(url, keys),
				products: willThrow.map { StubProduct.throw($0) }
			)
			let stubber = given.stubThrows(for: [URL].self)
			willProduce(stubber)
			return given
		}

		public static func contentsOfDirectory(at url: Parameter<URL>, willThrow: Error...) -> MethodStub {
			return Given(method: .m_contentsOfDirectory__at_url(url), products: willThrow.map { StubProduct.throw($0) })
		}

		public static func contentsOfDirectory(at url: Parameter<URL>, willProduce: (StubberThrows<[URL]>) -> Void) -> MethodStub {
			let willThrow: [Error] = []
			let given = Given(method: .m_contentsOfDirectory__at_url(url), products: willThrow.map { StubProduct.throw($0) })
			let stubber = given.stubThrows(for: [URL].self)
			willProduce(stubber)
			return given
		}
	}

	public struct Verify {
		fileprivate var method: MethodType

		public static func fileExists(_ path: Parameter<String>) -> Verify { return Verify(method: .m_fileExists__path(path)) }
		public static func directoryExists(_ path: Parameter<String>) -> Verify { return Verify(method: .m_directoryExists__path(path)) }
		public static func createDirectory(
			atPath path: Parameter<String>,
			withIntermediateDirectories createIntermediates: Parameter<Bool>,
			attributes: Parameter<[FileAttributeKey: Any]?>
		)
			-> Verify {
			return Verify(method: .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(
				path,
				createIntermediates,
				attributes
			))
		}

		public static func removeItem(atPath path: Parameter<String>) -> Verify { return Verify(method: .m_removeItem__atPath_path(path)) }
		public static func copyItem(
			atPath srcPath: Parameter<String>,
			toPath dstPath: Parameter<String>
		) -> Verify { return Verify(method: .m_copyItem__atPath_srcPathtoPath_dstPath(srcPath, dstPath)) }
		public static func subpathsOfDirectory(atPath path: Parameter<String>)
			-> Verify { return Verify(method: .m_subpathsOfDirectory__atPath_path(path)) }
		public static func createSymbolicLink(
			atPath path: Parameter<String>,
			withDestinationPath destPath: Parameter<String>
		)
			-> Verify { return Verify(method: .m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(path, destPath)) }
		public static func contents(atPath: Parameter<String>) -> Verify { return Verify(method: .m_contents__atPath_atPath(atPath)) }
		public static func moveItem(
			atPath: Parameter<String>,
			toPath: Parameter<String>
		) -> Verify { return Verify(method: .m_moveItem__atPath_atPathtoPath_toPath(atPath, toPath)) }
		public static func contentsOfDirectory(atPath: Parameter<String>)
			-> Verify { return Verify(method: .m_contentsOfDirectory__atPath_atPath(atPath)) }
		public static func attributesOfItem(atPath path: Parameter<String>) -> Verify { return Verify(method: .m_attributesOfItem__atPath_path(path))
		}

		public static func contentsOfDirectory(
			at url: Parameter<URL>,
			includingPropertiesForKeys keys: Parameter<[URLResourceKey]?>,
			options mask: Parameter<FileManager.DirectoryEnumerationOptions>
		) -> Verify { return Verify(method: .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(url, keys, mask)) }
		public static func createDirectory(
			atPath path: Parameter<String>,
			withIntermediateDirectories createIntermediates: Parameter<Bool>
		)
			-> Verify { return Verify(method: .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(path, createIntermediates))
		}

		public static func contentsOfDirectory(
			at url: Parameter<URL>,
			includingPropertiesForKeys keys: Parameter<[URLResourceKey]?>
		)
			-> Verify { return Verify(method: .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(url, keys)) }
		public static func contentsOfDirectory(at url: Parameter<URL>) -> Verify { return Verify(method: .m_contentsOfDirectory__at_url(url)) }
		public static var currentDirectoryPath: Verify { return Verify(method: .p_currentDirectoryPath_get) }
		public static var homeDirectoryForCurrentUser: Verify { return Verify(method: .p_homeDirectoryForCurrentUser_get) }
	}

	public struct Perform {
		fileprivate var method: MethodType
		var performs: Any

		public static func fileExists(_ path: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
			return Perform(method: .m_fileExists__path(path), performs: perform)
		}

		public static func directoryExists(_ path: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
			return Perform(method: .m_directoryExists__path(path), performs: perform)
		}

		public static func createDirectory(
			atPath path: Parameter<String>,
			withIntermediateDirectories createIntermediates: Parameter<Bool>,
			attributes: Parameter<[FileAttributeKey: Any]?>,
			perform: @escaping (String, Bool, [FileAttributeKey: Any]?) -> Void
		) -> Perform {
			return Perform(
				method: .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediatesattributes_attributes(
					path,
					createIntermediates,
					attributes
				),
				performs: perform
			)
		}

		public static func removeItem(atPath path: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
			return Perform(method: .m_removeItem__atPath_path(path), performs: perform)
		}

		public static func copyItem(
			atPath srcPath: Parameter<String>,
			toPath dstPath: Parameter<String>,
			perform: @escaping (String, String) -> Void
		) -> Perform {
			return Perform(method: .m_copyItem__atPath_srcPathtoPath_dstPath(srcPath, dstPath), performs: perform)
		}

		public static func subpathsOfDirectory(atPath path: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
			return Perform(method: .m_subpathsOfDirectory__atPath_path(path), performs: perform)
		}

		public static func createSymbolicLink(
			atPath path: Parameter<String>,
			withDestinationPath destPath: Parameter<String>,
			perform: @escaping (String, String) -> Void
		) -> Perform {
			return Perform(method: .m_createSymbolicLink__atPath_pathwithDestinationPath_destPath(path, destPath), performs: perform)
		}

		public static func contents(atPath: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
			return Perform(method: .m_contents__atPath_atPath(atPath), performs: perform)
		}

		public static func moveItem(atPath: Parameter<String>, toPath: Parameter<String>, perform: @escaping (String, String) -> Void) -> Perform {
			return Perform(method: .m_moveItem__atPath_atPathtoPath_toPath(atPath, toPath), performs: perform)
		}

		public static func contentsOfDirectory(atPath: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
			return Perform(method: .m_contentsOfDirectory__atPath_atPath(atPath), performs: perform)
		}

		public static func attributesOfItem(atPath path: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
			return Perform(method: .m_attributesOfItem__atPath_path(path), performs: perform)
		}

		public static func contentsOfDirectory(
			at url: Parameter<URL>,
			includingPropertiesForKeys keys: Parameter<[URLResourceKey]?>,
			options mask: Parameter<FileManager.DirectoryEnumerationOptions>,
			perform: @escaping (URL, [URLResourceKey]?, FileManager.DirectoryEnumerationOptions) -> Void
		) -> Perform {
			return Perform(method: .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keysoptions_mask(url, keys, mask), performs: perform)
		}

		public static func createDirectory(
			atPath path: Parameter<String>,
			withIntermediateDirectories createIntermediates: Parameter<Bool>,
			perform: @escaping (String, Bool) -> Void
		) -> Perform {
			return Perform(
				method: .m_createDirectory__atPath_pathwithIntermediateDirectories_createIntermediates(path, createIntermediates),
				performs: perform
			)
		}

		public static func contentsOfDirectory(
			at url: Parameter<URL>,
			includingPropertiesForKeys keys: Parameter<[URLResourceKey]?>,
			perform: @escaping (URL, [URLResourceKey]?) -> Void
		) -> Perform {
			return Perform(method: .m_contentsOfDirectory__at_urlincludingPropertiesForKeys_keys(url, keys), performs: perform)
		}

		public static func contentsOfDirectory(at url: Parameter<URL>, perform: @escaping (URL) -> Void) -> Perform {
			return Perform(method: .m_contentsOfDirectory__at_url(url), performs: perform)
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
