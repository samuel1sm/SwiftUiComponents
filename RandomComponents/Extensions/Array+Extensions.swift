extension Array {
	subscript(safe index: Int) -> Element? {
		return indices.contains(index) ? self[index] : nil
	}
	
	func contains(index: Int) -> Bool {
		index >= 0 && index < count
	}
}

