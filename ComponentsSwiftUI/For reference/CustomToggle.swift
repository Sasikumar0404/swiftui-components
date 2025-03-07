//
//  CustomToggle.swift
//  ComponentsSwiftUI
//
//  Created by Hubino on 14/02/25.
//

import SwiftUI

struct CustomToggle: View {
    @Binding var isOn: Bool

    var body: some View {
        Toggle(isOn: $isOn) {
            Text(isOn ? "Enabled" : "Disabled")
        }
        .toggleStyle(SwitchToggleStyle(tint: .green))
    }
}
