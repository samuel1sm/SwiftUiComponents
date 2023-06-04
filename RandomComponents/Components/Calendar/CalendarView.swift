import Foundation
import SwiftUI


struct CalendarView: View {
	
	@StateObject var viewModel = CalendarViewModel()
	
    var body: some View {
		HStack(spacing: 12) {
			ForEach(0..<viewModel.daysOfWeek.count, id: \.self) { day in
				VStack(spacing: 12){
					Text(viewModel.daysOfWeek[day].capitalized).foregroundStyle(.white)
					ForEach(0..<(5), id: \.self) { week in
						Text("\(viewModel.daysOfMonth[week][day])")
							.frame(width: 22, height: 22)
							.padding(.all, 8)
							.background(.gray.opacity(0.8))
							.clipShape(Capsule())
					}
				}
			}
		}
		.padding(.all)
		.background(.black.opacity(0.9))
		.cornerRadius(20, corners: .allCorners)
	}
}

#Preview {
	CalendarView()
}
