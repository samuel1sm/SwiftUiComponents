import SwiftUI

struct AllComponentsView: View {

	   
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

struct AllComponentsView_Previews: PreviewProvider {
    static var previews: some View {
		AllComponentsView()
    }
}
