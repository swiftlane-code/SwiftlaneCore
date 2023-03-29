//

@testable import SwiftlaneShell

import Foundation
import XCTest

class PipeDataBufferTests: XCTestCase {
	func test_nextChunkIsUpToTheLatestSeparatingByte() {
		// given
		let buffer = PipeDataBuffer()
		
		let chunk1 = Data([1, 2, 3, 4, 5, 32, 6, 7, 8, 9, 32, 11])
		buffer.append(data: chunk1)
		
		// when & then
		XCTAssertEqual(buffer.data(upToLast: 32), chunk1.dropLast())
	}
	
	func test_doubleReadingUntilSeparatingByte_secondReadingReturnsNil() {
		// given
		let buffer = PipeDataBuffer()
		
		let data = Data([1, 2, 3, 4, 5, 32, 6, 7, 8, 9, 32, 11])
		buffer.append(data: data)
		
		// when & then
		XCTAssertEqual(buffer.data(upToLast: 32), data.dropLast())
		XCTAssertEqual(buffer.data(upToLast: 32), nil)
	}
	
	func test_readingUntilNonExistingByte_returnNil_andDataToTheEndReturnsAllData() {
		// given
		let buffer = PipeDataBuffer()
		
		let data = Data([1, 2, 3, 4, 5, 32, 6, 7, 8, 9, 32, 11])
		buffer.append(data: data)
		
		// when & then
		XCTAssertNil(buffer.data(upToLast: 255))
		XCTAssertNil(buffer.data(upToLast: 255))
		
		XCTAssertEqual(buffer.dataToTheEnd(), data)
		XCTAssertEqual(buffer.data, data)
	}
	
	func test_multipleSeparatingBytesInARow() {
		// given
		let buffer = PipeDataBuffer()
		
		buffer.append(data: Data([1, 2, 3, 4, 5]))
		
		// when & then
		XCTAssertEqual(buffer.data(upToLast: 2), Data([1, 2]))
		XCTAssertEqual(buffer.data(upToLast: 3, includingLastByte: false), Data())
		XCTAssertEqual(buffer.data(upToLast: 4), Data([4]))
		XCTAssertEqual(buffer.data(upToLast: 5), Data([5]))
	}
	
	func test_wholeData() {
		// given
		let buffer = PipeDataBuffer()
		
		let chunk1 = Data([1, 2, 3, 4, 5, 32, 6, 7, 8, 9, 32, 11])
		buffer.append(data: chunk1)
		
		_ = buffer.data(upToLast: 32)
		
		let chunk2 = Data([6, 7, 8, 9])
		buffer.append(data: chunk2)
		
		let chunk3 = Data([10, 11, 12, 13])
		buffer.append(data: chunk3)
		
		// when & then
		XCTAssertEqual(buffer.dataToTheEnd(), Data([11]) + chunk2 + chunk3)
		XCTAssertEqual(buffer.data, chunk1 + chunk2 + chunk3)
	}
	
	func test_lastByteIsSeparating_dataToTheEndIsNil() {
		// given
		let buffer = PipeDataBuffer()
		
		let chunk1 = Data([1, 2, 3, 4, 5])
		buffer.append(data: chunk1)
		
		// when & then
		XCTAssertEqual(buffer.data(upToLast: 5), chunk1)
		XCTAssertEqual(buffer.dataToTheEnd(), nil)
	}
	
	func test_sequentialDataToTheEnd() {
		// given
		let buffer = PipeDataBuffer()
		
		// when & then
		buffer.append(data: Data([1]))
		XCTAssertEqual(buffer.dataToTheEnd(), Data([1]))
		
		buffer.append(data: Data([2]))
		XCTAssertEqual(buffer.dataToTheEnd(), Data([2]))
		
		buffer.append(data: Data([3]))
		XCTAssertEqual(buffer.dataToTheEnd(), Data([3]))
		
		buffer.append(data: Data([4, 5]))
		XCTAssertEqual(buffer.data(upToLast: 5), Data([4, 5]))
	}
	
	func test_typicalDataFlow() {
		// given
		let buffer = PipeDataBuffer()
		
		XCTAssertEqual(buffer.data, Data())
		XCTAssertEqual(buffer.dataToTheEnd(), nil)
		
		// Append data (not ending with 32 but containing it) to buffer
		let chunk1 = Data([1, 2, 3, 4, 5, 32])
		let chunk2 = Data([6, 7, 8, 9])
		buffer.append(data: chunk1 + chunk2)
		
		// Reading until 32 should return chunk1 as it ends with 32
		XCTAssertEqual(buffer.data(upToLast: 32), chunk1)
		
		// But we have chunk2 (after chunk1's byte 32) which is not ending with 32
		XCTAssertEqual(buffer.dataToTheEnd(), chunk2)
		
		// Append chunk3 ending with byte 32
		let chunk3 = Data([11, 22, 33, 44, 55, 32])
		buffer.append(data: chunk3)
		
		// Next data until byte 32 should be chunk2 + chunk3
		XCTAssertEqual(buffer.data(upToLast: 32), chunk3)
		XCTAssertEqual(buffer.dataToTheEnd(), nil)
	}
}
