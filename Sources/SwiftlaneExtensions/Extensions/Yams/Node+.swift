//

#if FALSE
import Yams

public extension Node {
	var yaml: String {
		try! Yams.dump(
			object: self,
			indent: 2,
			allowUnicode: true
		)
	}
}

public extension Node.Mapping {
	var yaml: String { Node.mapping(self).yaml }
}

public extension Node.Sequence {
	var yaml: String { Node.sequence(self).yaml }
}

public extension Node.Scalar {
	var yaml: String { Node.scalar(self).yaml }
}

public extension Node {
	enum MutationError: Error {
		case unknown(String)
	}
}

public extension Node {
	func updated(with source: Node?, skipKeys: [String] = []) throws -> Node {
		var result = self
		try result.update(with: source, skipKeys: skipKeys)
		return result
	}

	mutating func update(with source: Node?, skipKeys: [String] = []) throws {
		guard let source = source else {
			return
		}

		func shouldSkip(key: Node) -> Bool {
			(key.scalar?.string).map { skipKeys.contains($0) } ?? false
		}

		switch (source, self) {
		case let (.mapping(source), .mapping):
			try source.makeIterator().lazy
				.filter { !shouldSkip(key: $0.key) }
				.forEach { key, value in
					if self.mapping![key] != nil {
						try self.mapping![key]!.update(
							with: value,
							skipKeys: skipKeys
						)
					} else {
						self.mapping![key] = value
					}
				}
		case let (.sequence(source), .sequence):
			source.makeIterator().lazy
				.filter { !shouldSkip(key: $0) }
				.forEach { value in
					if !self.sequence!.contains(value) {
						self.sequence!.append(value)
					}
				}
		case let (.scalar(source), .scalar(target)):
			throw MutationError.unknown("Unexpected update of \"\(source)\" with \"\(target)\"")
		default:
			switch source {
			case let .mapping(source):
				guard !source.isEmpty else {
					throw MutationError.unknown("Invalid update of \"\(self)\" with non-empty mapping source \"\(source)\"")
				}
			case let .sequence(source):
				guard !source.isEmpty else {
					throw MutationError.unknown("Invalid update of \"\(self)\" with non-empty sequnce source \"\(source)\"")
				}
			case let .scalar(source):
				guard !source.string.isEmpty else {
					throw MutationError.unknown("Invalid update of \"\(self)\" with non-empty scalar source \"\(source)\"")
				}
			}
		}
	}
}
#endif
