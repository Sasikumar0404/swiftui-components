import SwiftUI

struct CardView: View {
    var title: String
    var subtitle: String
    var icon: String = "star.fill"

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.yellow)
                Text(title)
                    .font(.headline)
            }
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
