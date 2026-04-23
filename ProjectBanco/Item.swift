//
//  Item.swift
//  ProjectBanco
//
//  Created by Éverton Alencar de Lima on 23/04/26.
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
