import SwiftUI

struct CustomPopupView: View {
    @Binding var isPresented: Bool
    @State private var name: String = ""
    @State private var email: String = ""

    var confirmAction: ((String, String) -> Void)?

    var body: some View {
        ZStack {
            if isPresented {
                // Background overlay (optional, can re-enable tap to dismiss)
//                Color.black.opacity(0.4)
//                    .edgesIgnoringSafeArea(.all)
//                    .onTapGesture {
//                        isPresented = false
//                    }
                
                // Popup Content
                VStack(spacing: 20) {
                    Text("Enter Details")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)

                    VStack(spacing: 15) {
                        TextField("Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)

                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }

                    HStack {
                        Button("Cancel") {
                            isPresented = false
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)

                        Button("Confirm") {
                            confirmAction?(name, email)
                            isPresented = false
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)

                    Spacer().frame(height: 10)
                }
                .frame(width: 350, height: 250)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 15)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.bouncy, value: isPresented)
    }
}

struct ContentViewPopUp: View {
    @State private var showPopup = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Text("              ")
                    .font(.title)
                    .padding(.top, 50)
                
                Spacer()
            }

            // Profile Icon (Top-Right Corner)
            Button(action: {
                showPopup.toggle()
            }) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                    .padding()
            }
        }
        .overlay(
            CustomPopupView(
                isPresented: $showPopup,
                confirmAction: { name, email in
                    print("Name: \(name), Email: \(email)")
                }
            )
        )
    }
}

struct ContentViewPopUp_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewPopUp()
    }
}
