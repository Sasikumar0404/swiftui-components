import SwiftUI

struct PickerDemoView: View {
    // State variables for different pickers
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var selectedOption = "Option 1"
    @State private var showCustomDatePicker = false

    let options = ["Option 1", "Option 2", "Option 3"]

    var body: some View {
        VStack(spacing: 20) {
            // Standard Date Picker
            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            // Menu Picker
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selectedOption = option
                    }
                }
            } label: {
                HStack {
                    Text("Selected: \(selectedOption)")
                    Image(systemName: "chevron.down")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }

            // Time Picker
            DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            // Custom Date Picker inside a sheet
            Button(action: {
                showCustomDatePicker.toggle()
            }) {
                HStack {
                    Text("Custom Date Picker: \(formattedDate(selectedDate))")
                    Spacer()
                    Image(systemName: "calendar")
                }
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(8)
            }
            .sheet(isPresented: $showCustomDatePicker) {
                VStack {
                    DatePicker("Pick a Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .padding()

                    Button("Done") {
                        showCustomDatePicker = false
                    }
                    .padding()
                }
            }

            Spacer()
        }
        .padding()
    }

    // Helper function to format the date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct PickerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        PickerDemoView()
    }
}
