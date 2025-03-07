import SwiftUI

struct CustomSegmentedControl: View {
    let segments: [SegmentItem] = [
        SegmentItem(title: "Day", icon: ""),
        SegmentItem(title: "Week", icon: ""),
        SegmentItem(title: "Month", icon: "")
    ]

    @State private var selectedIndex: Int = 0

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                ForEach(segments.indices, id: \.self) { index in
                    ZStack {
                        if selectedIndex == index {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                                .animation(.easeInOut(duration: 0.3), value: selectedIndex)
                        }

                        HStack {
                            Image(systemName: segments[index].icon)
                                .font(.system(size: 18, weight: .bold))
                            Text(segments[index].title)
                                .font(.system(size: 16, weight: .bold))
                        }
                        .foregroundColor(selectedIndex == index ? .white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedIndex = index
                        }
                    }
                }
            }
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.2)))
            .padding(.horizontal)

            Text("Selected: \(segments[selectedIndex].title)")
                .font(.title)
                .bold()
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct SegmentItem {
    let title: String
    let icon: String
}

// Preview
struct CustomSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedControl()
    }
}
