//

@testable import SwiftlaneCoreServices

import Foundation
import SwiftyMocky
import XCTest

protocol ResolverTestFaking {
    var id: String { get }
}

class ResolverTestingFake: ResolverTestFaking {
    let id: String
    
    init(id: String = UUID().uuidString) {
        self.id = id
    }
}

class DependencyResolverTests: XCTestCase {
	var dependencyResolver: DependencyResolver!
	
	override func setUp() {
		super.setUp()
		
        dependencyResolver = DependencyResolver(name: self.name)
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
    
    func test_overwriteProducer() throws {
        // given
        dependencyResolver.register(ResolverTestFaking.self) {
            ResolverTestingFake(id: "1")
        }
        
        // when
        let resolved1 = dependencyResolver.resolve(ResolverTestFaking.self, .shared)
        dependencyResolver.register(ResolverTestFaking.self) {
            ResolverTestingFake(id: "2")
        }
        dependencyResolver.register(ResolverTestFaking.self) {
            ResolverTestingFake(id: "3")
        }
        let resolved2 = dependencyResolver.resolve(ResolverTestFaking.self, .shared)
        let resolved3 = dependencyResolver.resolve(ResolverTestFaking.self, .unique)
        
        // then
        XCTAssertEqual(resolved1.id, "1")
        XCTAssertEqual(resolved2.id, "3")
        XCTAssertEqual(resolved3.id, "3")
    }
    
    func test_register_isRegistered_unregister() throws {
        let type = ResolverTestingFake.self
        
        // check not registered
        XCTAssertFalse(dependencyResolver.isRegistered(type))
        
        // register
        dependencyResolver.register(ResolverTestingFake.self) {
            ResolverTestingFake()
        }
        
        // check registered
        XCTAssertTrue(dependencyResolver.isRegistered(type))
        
        // unregister
        dependencyResolver.unregister(ResolverTestingFake.self)
        
        // check not registered
        XCTAssertFalse(dependencyResolver.isRegistered(type))
    }
}
