//
//  ModelData.swift
//  BubbleTea
//
//  Created by 周灵婧 on 6/5/2024.
//

import SwiftUI
import Combine

class ModelData: ObservableObject {
    @Published var bubbleTeas: [BubbleTea]
    @Published var addOns: [AddOn]

    init() {
        bubbleTeas = [
           
            BubbleTea(id: "freshGrapeTea", name: "Fresh Grape Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "FreshGrapeTea"),
            BubbleTea(id: "freshOrangeTea", name: "Fresh Orange Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "FreshOrangeTea"),
            BubbleTea(id: "freshMangoTea", name: "Fresh Mango Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "FreshMangoTea"),
            BubbleTea(id: "freshPeachTea", name: "Fresh Peach Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "FreshPeachTea"),
            
            BubbleTea(id: "bubbleMilkTea", name: "Bubble Milk Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "BubbleMilkTea"),
            BubbleTea(id: "matchaMilkTea", name: "Matcha Milk Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "MatchaMilkTea"),
            BubbleTea(id: "taroMilkTea", name: "Taro Milk Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "TaroMilkTea"),
            BubbleTea(id: "chocolateMilkTea", name: "Chocolate Milk Tea", price: ["Reg": 8.00, "Large": 10.00], imageName: "ChocolateMilkTea"),
            
            BubbleTea(id: "lavenderTea", name: "Lavender Tea", price: ["Reg": 5.00, "Large": 7.00], imageName: "LavenderTea"),
            BubbleTea(id: "gardeniaTea", name: "Gardenia Tea", price: ["Reg": 5.00, "Large": 7.00], imageName: "GardeniaTea"),
            BubbleTea(id: "roseTea", name: "Rose Tea", price: ["Reg": 5.00, "Large": 7.00], imageName: "RoseTea"),
            BubbleTea(id: "jasmineTea", name: "Jasmine Tea", price: ["Reg": 5.00, "Large": 7.00], imageName: "JasmineTea")
        ]
        addOns = [
            AddOn(id: "jelly", name: "Jelly", price: 1.00),
            AddOn(id: "pearl", name: "Pearl", price: 1.00),
            AddOn(id: "taroBall", name: "Taro Ball", price: 1.00)
        ]
    }
}

