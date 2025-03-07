//
//  CustomButton.swift
//  ComponentsSwiftUI
//
//  Created by Hubino on 14/02/25.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color = .blue
    var foregroundColor: Color = .white

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(10)
        }
    }
}
