import SwiftUI

struct SliderView: View {
    @State private var sliderValue: Double = 50

    var body: some View {
        VStack {
            Text("Value: \(Int(sliderValue))")
                .font(.headline)

            Slider(value: $sliderValue, in: 0...100, step: 1)
                .padding()
        }
    }
}
