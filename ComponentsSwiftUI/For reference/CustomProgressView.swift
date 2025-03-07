import SwiftUI

struct CustomProgressBar: View {
    @Binding var progress: Double // Value between 0 and 1
    var barColor: Color = .blue
    var backgroundColor: Color = .gray.opacity(0.3)
    var height: CGFloat = 10

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background Bar
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(backgroundColor)
                    .frame(height: height)

                // Progress Bar
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(barColor)
                    .frame(width: geometry.size.width * CGFloat(progress), height: height)
                    .animation(.easeInOut(duration: 0.5), value: progress)
            }
        }
        .frame(height: height)
    }
}

struct CustomProgressBarView: View {
    @State private var progress = 0.3

    var body: some View {
        VStack(spacing: 20) {
            Text("Custom Progress: \(Int(progress * 100))%")
                .font(.headline)

            CustomProgressBar(progress: $progress, barColor: .green, height: 12)
                .frame(width: 200)

            Button("Increase Progress") {
                if progress < 1 {
                    progress += 0.1
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
