//

@testable import SwiftlaneCoreServices

import Foundation
import XCTest

class StringMatcherTests: XCTestCase {
	func test_hasSuffix_isMatching() throws {
		// given
		let matcher = StringMatcher.hasSuffix("suf")
		
		// when & then
		XCTAssertTrue(matcher.isMatching("1suf"))
		XCTAssertTrue(matcher.isMatching("1sufsuf"))
		XCTAssertTrue(matcher.isMatching("suf"))
		XCTAssertTrue(matcher.isMatching("sufsuf"))
		
		XCTAssertFalse(matcher.isMatching("suf1"))
		XCTAssertFalse(matcher.isMatching("sufSUF"))
		XCTAssertFalse(matcher.isMatching("1suf1"))
		XCTAssertFalse(matcher.isMatching("1suf "))
		XCTAssertFalse(matcher.isMatching("1suff"))
	}
	
	func test_hasPrefix_isMatching() throws {
		// given
		let matcher = StringMatcher.hasPrefix("pref")
		
		// when & then
		XCTAssertTrue(matcher.isMatching("pref1"))
		XCTAssertTrue(matcher.isMatching("prefpref1"))
		XCTAssertTrue(matcher.isMatching("pref"))
		XCTAssertTrue(matcher.isMatching("prefpref"))
		
		XCTAssertFalse(matcher.isMatching("1pref"))
		XCTAssertFalse(matcher.isMatching("PREFpref"))
		XCTAssertFalse(matcher.isMatching("1pref1"))
		XCTAssertFalse(matcher.isMatching(" pref"))
		XCTAssertFalse(matcher.isMatching("spref"))
	}
	
	func test_regex_isMatching() throws {
		// given
		let matcher = try StringMatcher.regex("abc")
		let realRegexMatcher = try StringMatcher.regex(#"\d"#)
		
		// when & then
		XCTAssertTrue(matcher.isMatching("abc"))
		XCTAssertTrue(matcher.isMatching(" abc"))
		XCTAssertTrue(matcher.isMatching("abc "))
		XCTAssertTrue(matcher.isMatching(" abc "))
		XCTAssertTrue(matcher.isMatching("abcabc"))
		XCTAssertTrue(matcher.isMatching("123\nabc\n456"))
		
		XCTAssertFalse(matcher.isMatching("a b c"))
		XCTAssertFalse(matcher.isMatching("a1bc"))
		XCTAssertFalse(matcher.isMatching("Abc"))
		XCTAssertFalse(matcher.isMatching("ABC"))
		
		XCTAssertTrue(realRegexMatcher.isMatching("1"))
		XCTAssertTrue(realRegexMatcher.isMatching("2"))
		XCTAssertTrue(realRegexMatcher.isMatching("a3a"))
		
		XCTAssertFalse(realRegexMatcher.isMatching("ABC"))
	}
	
	func test_equals_isMatching() throws {
		// given
		let matcher = StringMatcher.equals("const")
		
		// when & then
		XCTAssertTrue(matcher.isMatching("const"))
		
		XCTAssertFalse(matcher.isMatching("const "))
		XCTAssertFalse(matcher.isMatching(" const "))
		XCTAssertFalse(matcher.isMatching(" const"))
		XCTAssertFalse(matcher.isMatching("\nconst"))
		XCTAssertFalse(matcher.isMatching("consT"))
		XCTAssertFalse(matcher.isMatching("CONST"))
		XCTAssertFalse(matcher.isMatching("cons"))
	}
}
