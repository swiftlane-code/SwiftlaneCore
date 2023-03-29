//

import Foundation

public extension Result {
	var result: Success? {
		switch self {
		case .failure:
			return nil
		case let .success(output):
			return output
		}
	}
	
	var error: Failure? {
		switch self {
		case let .failure(error):
			return error
		case .success:
			return nil
		}
	}
}
