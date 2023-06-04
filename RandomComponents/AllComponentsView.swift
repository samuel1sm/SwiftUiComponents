import SwiftUI

struct AllComponentsView: View {

	@State var isShowing: Bool = true
	@State var isShowing2: Bool = false
	@State var isShowing3: Bool = true

    var body: some View {
        VStack {
			ExpandableView(isShowing: $isShowing, title: "Option 1") {
				VStack {
					Text("Test")
					Image(systemName: "globe")
						.imageScale(.large)
						.foregroundColor(.accentColor)
					Text("Hello, world!")
				}
			}
			ExpandableView(isShowing: $isShowing2, title: "Option 2") {
				VStack {
					ExpandableView(isShowing: $isShowing3, title: "Option 3") {
						VStack {
							Text("Test")
							Image(systemName: "globe")
								.imageScale(.large)
								.foregroundColor(.accentColor)
							Text("Hello, world!")
						}
					}.padding(.horizontal)
				}
			}
			
        }
        .padding()
    }
}

struct AllComponentsView_Previews: PreviewProvider {
    static var previews: some View {
		AllComponentsView()
    }
}
