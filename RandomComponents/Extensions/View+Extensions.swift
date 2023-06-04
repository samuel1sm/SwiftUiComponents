import SwiftUI

extension View {

	func roundedRectangleOverlay(strokeColor: Color, lineWidth: CGFloat) -> some View {
		overlay(
			RoundedRectangle(cornerRadius: 8)
				.stroke(strokeColor, lineWidth: lineWidth)
		)
	}
	
	func backgroundColor(_ color: Color) -> some View {
		self.background(color)
	}
	
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape(RoundedCorner(radius: radius, corners: corners) )
	}
}
	
struct RoundedCorner: Shape {
	var radius: CGFloat = .infinity
	var corners: UIRectCorner = .allCorners
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(
			roundedRect: rect,
			byRoundingCorners: corners,
			cornerRadii: CGSize(width: radius, height: radius)
		)
		return Path(path.cgPath)
	}
}

