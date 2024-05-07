//
//  BubbleTea.swift
//  BubbleTea
//
//  Created by 周灵婧 on 6/5/2024.
//

import SwiftUI
import Foundation

// Define the data structures
struct BubbleTea: Codable {
    var name: String
    var prices: Prices
    var addOns: [AddOn]?
}

struct Prices: Codable {
    var Reg: String?
    var Large: String?
}

struct AddOn: Codable {
    var name: String
    var price: String
}
