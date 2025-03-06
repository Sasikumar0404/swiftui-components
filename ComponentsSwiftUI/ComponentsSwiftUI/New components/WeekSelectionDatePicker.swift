import SwiftUI

struct WeekSelectionDatePicker: View {
    @State private var selectedDate: Date = Date()

    var selectedWeek: DateInterval {
        Calendar.current.dateInterval(of: .weekOfYear, for: selectedDate) ?? DateInterval()
    }

    var body: some View {
        VStack {
            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical) /// type
                .padding()

            Text("Week Start: \(formattedDate(selectedWeek.start))")
            Text("Week End: \(formattedDate(selectedWeek.end))")
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
