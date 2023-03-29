//

import Foundation

public extension String {
	var pathComponents: [String] {
		NSString(string: self).pathComponents
	}
	
	var firstPathComponent: String? {
		NSString(string: self).pathComponents.first
	}
	
	var lastPathComponent: String {
		NSString(string: self).lastPathComponent
	}
	
	var deletingPathExtension: String {
		NSString(string: self).deletingPathExtension
	}
	
	var pathExtension: String {
		NSString(string: self).pathExtension
	}
	
	var deletingLastPathComponent: String {
		NSString(string: self).deletingLastPathComponent
	}
	
	func appendingPathComponent(_ str: String) -> String {
		NSString(string: self).appendingPathComponent(str)
	}
}
