import SwiftUI

struct EnhancedSliderView: View {
    @State private var sliderValue: Double = 50
    @State private var feedback = UIImpactFeedbackGenerator(style: .medium)

    var body: some View {
        VStack(spacing: 20) {
            Text("Value: \(Int(sliderValue))")
                .font(.title)
                .bold()

            Slider(value: $sliderValue, in: 0...100, step: 10, onEditingChanged: { editing in
                if !editing {
                    feedback.impactOccurred() // Haptic feedback when releasing
                }
            })
            .accentColor(.blue)
            .padding()

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(colors: [.gray.opacity(0.3), .gray.opacity(0.1)], startPoint: .leading, endPoint: .trailing))
                        .frame(height: 10)

                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geometry.size.width * CGFloat(sliderValue / 100), height: 10)
                        .animation(.easeInOut, value: sliderValue)
                }
            }
            .frame(height: 10)
            .padding(.horizontal)

            HStack {
                ForEach(0..<11) { index in
                    Text("\(index * 10)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
        }
        .padding()
    }
}
