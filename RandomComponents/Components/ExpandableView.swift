import SwiftUI

struct ExpandableView<Content: View>: View {
	@State var isShowing = false
	
	var content: Content
	
	init(@ViewBuilder content: () -> Content) {
		self.content = content()
	}
	
	var body: some View {
		VStack {
			ZStack {
				Button(action: {
					isShowing.toggle()
				}) {
					VStack {
						HStack {
							Text("Teste")
							Spacer()
							Image(systemName: "arrow.down")
								.rotationEffect(isShowing ? Angle(degrees: 180) : .zero)
							
						}
						.padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
					}
				}.background(.white)
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

	var body: some View {
		VStack {
			ExpandableView {
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
