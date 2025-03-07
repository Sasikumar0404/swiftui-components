import SwiftUI

//struct ContentView1: View {
//    var body: some View {
//        NavigationStack {
//            List {
////                NavigationLink("CustomSegmentedControl", destination: CustomSegmentedControl())
////                NavigationLink("Progress View", destination: ProgressViewExample())
////                NavigationLink("Custom Progress Bar", destination: CustomProgressBarView())
//                
////                NavigationLink("GaugeView", destination: GaugeView())
////                NavigationLink("Enhanced Slider", destination: EnhancedSliderView())
////                NavigationLink("Date Picker", destination: WeekSelectionDatePicker())
////                NavigationLink("Circular Progress Bar", destination: CircularProgressBar())
////                NavigationLink("Dynamic Progress Bar", destination: DynamicProgressBar())
//                
//                NavigationLink("Drop down picker", destination: CustomDropdownPicker())
//                NavigationLink("Picker", destination: PickerDemoView())
//                NavigationLink("Drop down", destination: CustomPopupView())
//                NavigationLink("Side Menu", destination: SideMenuView())
//            }
//            .navigationTitle("SwiftUI Components")
//        }
//    }
//}


struct MainDemoView: View {
    @State private var showSideMenu = false
    @State private var showPopup = false

    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section(header: Text("Dropdown Picker")) {
                        CustomDropdownPicker()
                    }

                    Section(header: Text("Pickers Demo")) {
                        PickerDemoView()
                    }

                    Section(header: Text("Popup View")) {
                        Button("Show Popup") {
                            showPopup.toggle()
                        }
                    }
                }
                .navigationBarItems(leading: Button(action: {
                    withAnimation {
                        showSideMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .foregroundColor(.blue)
                })
                .navigationTitle("Demo View")
                .overlay(
                    CustomPopupView(isPresented: $showPopup, confirmAction: { name, email in
                        print("Name: \(name), Email: \(email)")
                    })
                )
            }
            
            SideMenuView(isShowing: $showSideMenu)
        }
    }
}

struct MainDemoView_Previews: PreviewProvider {
    static var previews: some View {
        MainDemoView()
    }
}

