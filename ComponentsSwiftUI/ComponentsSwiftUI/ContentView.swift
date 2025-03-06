//
//  ContentView.swift
//  ComponentsSwiftUI
//
//  Created by Hubino on 14/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    @State private var isOn = false

    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea() // Background
            
            VStack {
                Text("Main Content Here")
                    .font(.title)
                    .padding()
                
                Spacer()
            }
            
            VStack {
                Spacer()
                VStack {
                    EmptyStateView()
//                    CustomToggle(isOn: $isOn)
//                    HStack {
//                        Spacer()
//                        FloatingActionButton(icon: "plus") {
//                            print("FAB tapped!")
//                        }
//                        CustomButton(title: "Click Me") {
//                            print("Button tapped!")
//                        }
//                        
//                        .padding()
//                    }
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
