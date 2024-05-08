//
//  BubbleTea.swift
//  BubbleTea
//
//  Created by 周灵婧 on 6/5/2024.
//

import Foundation

struct BubbleTea: Identifiable {
    var id: String
    var name: String
    var price: [String: Double]  // Prices for 'Reg' and 'Large'
    var imageName: String
}

struct AddOn: Identifiable, Equatable {
    var id: String
    var name: String
    var price: Double
    
    
    static func == (lhs: AddOn, rhs: AddOn) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.price == rhs.price
    }
}


class CartItem: Identifiable, ObservableObject {
    var id: String = UUID().uuidString
    @Published var bubbleTea: BubbleTea
    @Published var size: String
    @Published var quantity: Int
    @Published var addOns: [AddOn]

    init(bubbleTea: BubbleTea, size: String, quantity: Int = 1, addOns: [AddOn] = []) {
        self.bubbleTea = bubbleTea
        self.size = size
        self.quantity = quantity
        self.addOns = addOns
    }
}

class CartManager: ObservableObject {
    @Published var items: [CartItem] = []
    @Published var addOns: [AddOn] = [  // Now managing available add-ons directly in CartManager
            AddOn(id: "jelly", name: "Jelly", price: 1.00),
            AddOn(id: "pearl", name: "Pearl", price: 1.00),
            AddOn(id: "taroBall", name: "Taro Ball", price: 1.00)
        ]
    func addToCart(bubbleTea: BubbleTea, size: String, addOns: [AddOn]) {
        if let index = items.firstIndex(where: { $0.bubbleTea.id == bubbleTea.id && $0.size == size && $0.addOns == addOns }) {
            items[index].quantity += 1
        } else {
            let newItem = CartItem(bubbleTea: bubbleTea, size: size, addOns: addOns)
            items.append(newItem)
        }
    }
    
    func removeFromCart(cartItem: CartItem) {
        if let index = items.firstIndex(where: { $0.id == cartItem.id }) {
            items.remove(at: index)
        }
    }
    
    func total() -> Double {
        return items.reduce(0) { total, item in
            total + (item.bubbleTea.price[item.size] ?? 0) * Double(item.quantity) +
            item.addOns.reduce(0) { $0 + $1.price * Double(item.quantity) }
        }
    }
}

