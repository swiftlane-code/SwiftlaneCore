//

@testable import SwiftlaneCoreServices

import Foundation
import SwiftyMocky
import XCTest

class DependencyResolverTests: XCTestCase {
	var dependencyResolver: DependencyResolver!
	
	override func setUp() {
		super.setUp()
		
		dependencyResolver = DependencyResolver()
	}
	
	override func tearDown() {
		super.tearDown()
		
		dependencyResolver.reset()
		dependencyResolver = nil
	}
	
	func test_resolvedTypeIsCorrect() throws {
		// given
		dependencyResolver.register(ResolverTestFaking.self) {
			ResolverTestingFake()
		}

		// when
		let resolved = dependencyResolver.resolve(ResolverTestFaking.self, .unique)

		// then
		XCTAssertTrue(resolved is ResolverTestingFake)
	}
	
	func test_resolvedUniqueInstancesAreDifferent() throws {
		// given
		dependencyResolver.register(ResolverTestFaking.self) {
			ResolverTestingFake()
		}

		// when
		let resolved1 = dependencyResolver.resolve(ResolverTestFaking.self, .unique)
		let resolved2 = dependencyResolver.resolve(ResolverTestFaking.self, .unique)

		// then
		XCTAssertFalse((resolved1 as AnyObject) === (resolved2 as AnyObject))
	}
	
	func test_resolvedSharedInstancesAreSame() throws {
		// given
		dependencyResolver.register(ResolverTestFaking.self) {
			ResolverTestingFake()
		}

		// when
		let resolved1 = dependencyResolver.resolve(ResolverTestFaking.self, .shared)
		let resolved2 = dependencyResolver.resolve(ResolverTestFaking.self, .shared)

		// then
		XCTAssertTrue((resolved1 as AnyObject) === (resolved2 as AnyObject))
	}
	
	func test_resolvedSharedAndUniqueInstancesAreDifferent() throws {
		// given
		dependencyResolver.register(ResolverTestFaking.self) {
			ResolverTestingFake()
		}
		 
		// when
		let resolved1 = dependencyResolver.resolve(ResolverTestFaking.self, .shared)
		let resolved2 = dependencyResolver.resolve(ResolverTestFaking.self, .unique)
		
		// then
		XCTAssertFalse((resolved1 as AnyObject) === (resolved2 as AnyObject))
	}
}
