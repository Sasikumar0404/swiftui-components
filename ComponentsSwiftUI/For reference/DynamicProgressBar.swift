import SwiftUI

struct DynamicProgressBar: View {
    @State private var values: [CGFloat] = [30, 40, 30] // 3 segments

    var total: CGFloat {
        values.reduce(0, +) // Calculate total sum
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(0..<values.count, id: \.self) { index in
                    TextField("Value \(index + 1)", value: $values[index], formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 80)
                        .keyboardType(.numberPad)
                }
            }
            .padding()

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 10)

                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                        .frame(width: values[0] / total * 300, height: 10)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                        .frame(width: values[1] / total * 300, height: 10)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: values[2] / total * 300, height: 10)
                }
                .animation(.easeInOut, value: values)
            }
            .frame(width: 300, height: 10)
        }
        .padding()
    }
}
