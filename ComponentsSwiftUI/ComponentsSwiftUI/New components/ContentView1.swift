import SwiftUI

struct ContentView1: View {
    var body: some View {
        NavigationStack {
            List {
//                NavigationLink("CustomSegmentedControl", destination: CustomSegmentedControl())
//                NavigationLink("Progress View", destination: ProgressViewExample())
//                NavigationLink("Custom Progress Bar", destination: CustomProgressBarView())
                
                NavigationLink("GaugeView", destination: GaugeView())
                NavigationLink("Enhanced Slider", destination: EnhancedSliderView())
                NavigationLink("Date Picker", destination: WeekSelectionDatePicker())
                NavigationLink("Circular Progress Bar", destination: CircularProgressBar())
                NavigationLink("Dynamic Progress Bar", destination: DynamicProgressBar())
                
            }
            .navigationTitle("SwiftUI Components")
        }
    }
}
