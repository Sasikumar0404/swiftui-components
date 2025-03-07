import SwiftUI

struct CustomDropdownPicker: View {
    let items = ["Apple", "Banana", "Cherry", "Date"]
    @State private var selectedItem = "Apple"
    @State private var isDropdownVisible = false

    var body: some View {
        VStack {
            // Dropdown Button
            Button(action: {
                withAnimation {
                    isDropdownVisible.toggle()
                }
            }) {
                HStack {
                    Text(selectedItem)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: isDropdownVisible ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }

            // Dropdown List
            if isDropdownVisible {
                VStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        Button(action: {
                            selectedItem = item
                            isDropdownVisible = false
                        }) {
                            Text(item)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .background(Color.white)
                        .overlay(Divider(), alignment: .top)
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 5)
            }

            Spacer()
        }
        .padding()
    }
}

struct CustomDropdownPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDropdownPicker()
    }
}
