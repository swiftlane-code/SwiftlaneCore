//

import Foundation
import SwiftlaneExtensions

public extension Bundle {
	/// Make a URL to a file inside folder defined by `stubsRootPath` parameter of your UnitTests target.
	/// - Parameters:
	///   - stubsRootPath: name of directory inside yout UnitTests target where a file is located.
	///   - path: name of file or a relative path to a file.
	///
	/// You can do this in your Package.swift:
	///
	///		.testTarget(
	///			name: ...,
	///			dependencies: ...,
	///			resources: [.copy("Stubs")]
	///		),
	///
	///	And then `Bundle.module.getStubURL(...)`
	func getStubURL(
		stubsRootPath: String = "Stubs",
		path: String,
		file: String = #file,
		line: UInt = #line
	) throws -> URL {
		let resourcePath = stubsRootPath.appendingPathComponent(path)
		let url = try self.url(
			forResource: resourcePath,
			withExtension: nil
		).unwrap(
			errorDescription: "Stub file at path \"\(path)\" not found",
			file: file,
			line: line
		)
		return url
	}
	
	/// Read data of a file inside folder defined by `stubsRootPath` parameter of your UnitTests target.
	/// - Parameters:
	///   - stubsRootPath: name of directory inside yout UnitTests target where a file is located.
	///   - path: name of file or a relative path to a file.
	///
	/// You can do this in your Package.swift:
	///
	///		.testTarget(
	///			name: ...,
	///			dependencies: ...,
	///			resources: [.copy("Stubs")]
	///		),
	///
	///	And then `Bundle.module.readStubData(...)`
	func readStubData(
		stubsRootPath: String = "Stubs",
		path: String,
		file: String = #file,
		line: UInt = #line
	) throws -> Data {
		let url = try getStubURL(
			stubsRootPath: stubsRootPath,
			path: path,
			file: file,
			line: line
		)
		return try Data(contentsOf: url)
	}
	
	/// Read text contents of a file inside folder defined by `stubsRootPath` parameter of your UnitTests target.
	/// - Parameters:
	///   - stubsRootPath: name of directory inside yout UnitTests target where a file is located.
	///   - path: name of file or a relative path to a file.
	///
	/// You can do this in your Package.swift:
	///
	///		.testTarget(
	///			name: ...,
	///			dependencies: ...,
	///			resources: [.copy("Stubs")]
	///		),
	///
	///	And then `Bundle.module.readStubText(...)`
	func readStubText(
		stubsRootPath: String = "Stubs",
		path: String,
		file: String = #file,
		line: UInt = #line
	) throws -> String {
		let data = try readStubData(stubsRootPath: stubsRootPath, path: path, file: file, line: line)
		return String(decoding: data, as: UTF8.self)
	}
}
