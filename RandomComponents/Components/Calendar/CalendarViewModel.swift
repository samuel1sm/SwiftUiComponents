import Foundation

class CalendarViewModel: ObservableObject {
	
	lazy var calendar: Calendar = {
		var calendar = Calendar.current
		let userPreferredLanguage = Locale.preferredLanguages.first ?? "en"
		calendar.locale = Locale(identifier: userPreferredLanguage)
		return calendar
	}()

	lazy var daysOfWeek: [String] = {
		return calendar.shortWeekdaySymbols
	}()
	
	lazy var firstDayOfMonth: Date = {
		let components = calendar.dateComponents([.year, .month], from: Date.now)
		return calendar.date(from: components)!
	}()
	
	lazy var lastDayOfMonth: Date = {
		var components = DateComponents()
		components.month = 1
		components.second = -1
		return calendar.date(byAdding: components, to: firstDayOfMonth)!
	}()
	
	lazy var daysOfMonth: [[Int]] = {
		let weekDayNumber = calendar.component(.weekday, from: firstDayOfMonth)
		let lastDateDay = calendar.component(.day, from: lastDayOfMonth)
		var result: [[Int]] = []
		result.append(Array(repeating: 0, count: weekDayNumber - 1))
		for i in 1...lastDateDay {
			let position = i / 7
			if result.contains(index: position) {
				result[position].append(i)
			} else {
				result.append([i])
			}
		}
		
		while result[result.endIndex - 1].count < 7 {
			result[result.endIndex - 1].append(0)
		}
		return result
	}()
}
