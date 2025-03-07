//
//  LoaderView.swift
//  ComponentsSwiftUI
//
//  Created by Hubino on 14/02/25.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(1.5)
    }
}
