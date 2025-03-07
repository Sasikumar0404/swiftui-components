//
//  Item.swift
//  ComponentsSwiftUI
//
//  Created by Hubino on 14/02/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
