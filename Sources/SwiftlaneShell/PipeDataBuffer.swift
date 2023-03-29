//

import Foundation

class PipeDataBuffer {
	private(set) var data = Data()
	private var nextChunkStart = 0

	/// Append data to buffer.
	func append(data: Data) {
		self.data += data
	}

	/// Retreive next biggest available chunk of data from buffer sequentially until specified byte.
	func data(upToLast byte: UInt8, includingLastByte: Bool = true) -> Data? {
		guard let lastIndex = data.lastIndex(of: byte),
		      nextChunkStart <= lastIndex else {
			return nil
		}

		let lowerBound = nextChunkStart
		let upperBound = includingLastByte ? lastIndex : lastIndex - 1

		nextChunkStart = lastIndex + 1

		guard upperBound >= lowerBound else {
			return Data()
		}

		return data[lowerBound...upperBound]
	}

	/// Returns all data after the last byte retreived by `data(upToLast byte: UInt8, includingLastByte: Bool = true)`.
	func dataToTheEnd() -> Data? {
		guard nextChunkStart < data.count else {
			return nil
		}
		let lowerBound = nextChunkStart
		let upperBound = data.count - 1
		nextChunkStart = data.count
		return data[lowerBound...upperBound]
	}
}
