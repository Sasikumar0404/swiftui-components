import SwiftUI

struct GaugeView: View {
    @State private var speed: Double = 60

    var body: some View {
        VStack {
            Gauge(value: speed, in: 0...200) {
                Text("Speed")
            } currentValueLabel: {
                Text("\(Int(speed)) km/h")
                    .font(.title2)
                    .bold()
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(Gradient(colors: [.green, .yellow, .red]))

            Slider(value: $speed, in: 0...200, step: 5)
                .padding()
        }
    }
}
