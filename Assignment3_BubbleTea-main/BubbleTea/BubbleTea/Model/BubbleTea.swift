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
    var category: String
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
    @Published var sweetness: String
    @Published var iceLevel: String
    @Published var quantity: Int
    @Published var addOns: [AddOn]
    
    init(bubbleTea: BubbleTea, size: String, sweetness: String, iceLevel: String, quantity: Int = 1, addOns: [AddOn] = []) {
        self.bubbleTea = bubbleTea
        self.size = size
        self.sweetness = sweetness
        self.iceLevel = iceLevel
        self.quantity = quantity
        self.addOns = addOns
    }
    
    var totalPrice: Double {
        let basePrice = bubbleTea.price[size] ?? 0
        let addOnsPrice = addOns.reduce(0) { $0 + $1.price }
        return (basePrice + addOnsPrice) * Double(quantity)
    }
}

class CartManager: ObservableObject {
    @Published var items: [CartItem] = []
    @Published var addOns: [AddOn] = [  
        AddOn(id: "jelly", name: "Jelly", price: 1.00),
        AddOn(id: "sago", name: "Sago", price: 1.00),
        AddOn(id: "boba", name: "Boba", price: 1.00),
        AddOn(id: "taro", name: "Taro", price: 1.00),
        AddOn(id: "aloe", name: "Aloe", price: 1.00),
        AddOn(id: "Ai Yu", name: "Ai Yu", price: 1.00),     
    ]
    
    func addItem(_ item: CartItem) {
            if let index = items.firstIndex(where: { $0.bubbleTea.id == item.bubbleTea.id && $0.size == item.size && $0.sweetness == item.sweetness && $0.iceLevel == item.iceLevel && $0.addOns == item.addOns }) {
                items[index].quantity += item.quantity
            } else {
                items.append(item)
            }
        }
    
    func addToCart(bubbleTea: BubbleTea, size: String, sweetness: String, iceLevel: String, addOns: [AddOn], quantity: Int = 1) {

        if let index = items.firstIndex(where: {
            $0.bubbleTea.id == bubbleTea.id &&
            $0.size == size &&
            $0.sweetness == sweetness &&
            $0.iceLevel == iceLevel &&
            $0.addOns == addOns
        }) {
            
            items[index].quantity += quantity
        } else {
            
            let newItem = CartItem(
                bubbleTea: bubbleTea,
                size: size,
                sweetness: sweetness,
                iceLevel: iceLevel,
                quantity: quantity,
                addOns: addOns
            )
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

