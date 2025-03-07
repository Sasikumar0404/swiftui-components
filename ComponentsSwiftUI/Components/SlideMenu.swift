import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool

    var body: some View {
        ZStack(alignment: .leading) {
            if isShowing {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }
                
                /// Side Menu Content
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                        Text("Hello, User!")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 50)
                    
                    Divider()
                        .padding(.vertical, 10)

                    MenuButton(title: "Home", icon: "house.fill") {
                        withAnimation {
                            isShowing = false
                        }
                        print("Home Tapped")
                    }
                    MenuButton(title: "Profile", icon: "person.fill") {
                        withAnimation {
                            isShowing = false
                        }
                        print("Profile Tapped")
                    }
                    MenuButton(title: "Settings", icon: "gearshape.fill") {
                        withAnimation {
                            isShowing = false
                        }
                        print("Settings Tapped")
                    }
                    MenuButton(title: "Logout", icon: "arrow.backward.circle.fill") {
                        withAnimation {
                            isShowing = false
                        }
                        print("Logout Tapped")
                    }

                    Spacer()
                }
                .frame(width: 250)
                .background(Color.white)
                .edgesIgnoringSafeArea(.vertical)
                .transition(.move(edge: .leading))
                .shadow(radius: 5)
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
}

struct MenuButton: View {
    let title: String
    let icon: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .frame(width: 30)
                Text(title)
                    .font(.headline)
            }
            .foregroundColor(.black)
            .padding()
        }
    }
}

struct ContentViewWithMenu: View {
    @State private var showMenu = false

    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Text("Home")
                        .font(.largeTitle)
                    Spacer()
                }
                .navigationBarItems(leading: Button(action: {
                    withAnimation {
                        showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .foregroundColor(.blue)
                })
                .navigationTitle("")
            }
            .overlay(SideMenuView(isShowing: $showMenu))
        }
    }
}
