//

public extension SignedInteger {
	/// Return result of `Double(self) / Double(against)`.
	func rate(against: Self) -> Double {
		Double(self) / Double(against)
	}

	func percentage(against: Self) -> Double {
		rate(against: against) * 100
	}
}
