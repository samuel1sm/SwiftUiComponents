import SwiftUI

struct ExpandableView<Content: View>: View {
	
	@Binding var isShowing: Bool
	var title: String
	var content: Content
	
	init(isShowing: Binding<Bool>,title: String, @ViewBuilder content: () -> Content) {
		self._isShowing = isShowing
		self.title = title
		self.content = content()
	}
	
	var body: some View {
		VStack {
			ZStack {
				Button(action: {
					isShowing.toggle()
				}) {
					HStack {
						Text(title)
						Spacer()
						Image(systemName: "arrow.down")
							.rotationEffect(isShowing ? Angle(degrees: 180) : .zero)
						
					}
					.padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
				}
				.backgroundColor(.white)
			}
			.foregroundColor(.black)
			.zIndex(1)
			
			if isShowing {
				content
					.transition(.move(edge: .top))
			}
		}
		.padding(.init(top: 0, leading: 0, bottom: isShowing ? 16 : 0 , trailing: 0))
		.clipped()
		.roundedRectangleOverlay(strokeColor: .black, lineWidth: 1)
		.animation(.linear)
	}
}


struct ExpandableViewTestView: View {
	
	@State var isShowing: Bool = true

	var body: some View {
		VStack {
			ExpandableView(isShowing: $isShowing, title: "Option 1") {
				VStack {
					Text("dasdas")
					Image(systemName: "globe")
						.imageScale(.large)
						.foregroundColor(.accentColor)
					Text("Hello, world!")
				}
			}
		}
		.padding()
	}
}

struct ExpandableViewTestView_Previews: PreviewProvider {
	static var previews: some View {
		AllComponentsView()
	}
}
