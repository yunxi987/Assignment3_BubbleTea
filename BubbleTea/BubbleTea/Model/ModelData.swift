//
//  ModelData.swift
//  BubbleTea
//
//  Created by Lingjing Zhou on 6/5/2024.
//

import SwiftUI
import Combine

class ModelData: ObservableObject {
    @Published var bubbleTeas: [BubbleTea]
    @Published var addOns: [AddOn]
    
    var allBubbleTeas: [BubbleTea] {
        bubbleTeas
    }
    
    init() {
        bubbleTeas = [
            BubbleTea(id: "freshGrapeTea", name: "Fresh Grape Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "FreshGrapeTea", category: "Fruit Tea"),
            BubbleTea(id: "freshOrangeTea", name: "Fresh Orange Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "FreshOrangeTea", category: "Fruit Tea"),
            BubbleTea(id: "freshMangoTea", name: "Fresh Mango Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "FreshMangoTea", category: "Fruit Tea"),
            BubbleTea(id: "freshPeachTea", name: "Fresh Peach Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "FreshPeachTea", category: "Fruit Tea"),
            BubbleTea(id: "bubbleMilkTea", name: "Bubble Milk Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "BubbleMilkTea", category: "Milk Tea"),
            BubbleTea(id: "matchaMilkTea", name: "Matcha Milk Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "MatchaMilkTea", category: "Milk Tea"),
            BubbleTea(id: "taroMilkTea", name: "Taro Milk Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "TaroMilkTea", category: "Milk Tea"),
            BubbleTea(id: "chocolateMilkTea", name: "Chocolate Milk Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "ChocolateMilkTea", category: "Milk Tea"),
            BubbleTea(id: "lavenderTea", name: "Lavender Tea", price: ["Reg": 5.00, "Large": 7.00], imageName: "LavenderTea", category: "Flower Tea"),
            BubbleTea(id: "gardeniaTea", name: "Gardenia Tea", price: ["Reg": 5.00, "Large": 7.00], imageName: "GardeniaTea", category: "Flower Tea"),
            BubbleTea(id: "roseTea", name: "Rose Tea", price: ["Reg": 5.00, "Large": 7.00], imageName: "RoseTea", category: "Flower Tea"),
            BubbleTea(id: "jasmineTea", name: "Jasmine Tea", price: ["Reg": 5.00, "Large": 7.00], imageName: "JasmineTea", category: "Flower Tea")
        ]
        
        addOns = [
            AddOn(id: "jelly", name: "Jelly", price: 1.00),
            AddOn(id: "sago", name: "Sago", price: 1.00),
            AddOn(id: "boba", name: "Boba", price: 1.00),
            AddOn(id: "taro", name: "Taro", price: 1.00),
            AddOn(id: "aloe", name: "Aloe", price: 1.00),
            AddOn(id: "Ai Yu", name: "Ai Yu", price: 1.00),
        ]
    }
}

