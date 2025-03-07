//
//  Floating button.swift
//  ComponentsSwiftUI
//
//  Created by Hubino on 14/02/25.
//

import SwiftUI

struct FloatingActionButton: View {
    var icon: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
        .padding()
    }
}
