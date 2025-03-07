//
//  CustomSearchBar.swift
//  ComponentsSwiftUI
//
//  Created by Hubino on 14/02/25.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search...", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding(10)
        .background(Color(.systemGray))
        .cornerRadius(10)
    }
}
