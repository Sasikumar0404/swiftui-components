import SwiftUI

struct ProgressViewExample: View {
    @State private var progress: Double = 0.4

    var body: some View {
        VStack {
            Text("Progress: \(Int(progress * 100))%")
                .font(.headline)

            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .padding()
        }
    }
}
