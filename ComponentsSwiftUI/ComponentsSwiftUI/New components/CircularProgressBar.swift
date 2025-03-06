import SwiftUI

struct CircularProgressBar: View {
    @State private var progress: CGFloat = 0.75

    var body: some View {
        VStack {
            Slider(value: $progress, in: 0...1)
                .padding()

            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 10)

                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(AngularGradient(gradient: Gradient(colors: [.green, .blue]), center: .center), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: progress)

                Text("\(Int(progress * 100))%")
                    .font(.title)
                    .bold()
            }
            .frame(width: 100, height: 100)
        }
    }
}
