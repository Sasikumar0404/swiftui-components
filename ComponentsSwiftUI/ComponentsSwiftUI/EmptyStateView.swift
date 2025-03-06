//
//  EmptyStateView.swift
//  ComponentsSwiftUI
//
//  Created by Hubino on 14/02/25.
//

import SwiftUI

struct EmptyStateView: View {
    var message: String = "No Data Available"
    var icon: String = "exclamationmark.triangle"

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.gray)
            Text(message)
                .font(.headline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
