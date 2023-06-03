import SwiftUI

extension View {

	func roundedRectangleOverlay(strokeColor: Color, lineWidth: CGFloat) -> some View {
		overlay(
			RoundedRectangle(cornerRadius: 8)
				.stroke(strokeColor, lineWidth: lineWidth)
		)
	}
}
