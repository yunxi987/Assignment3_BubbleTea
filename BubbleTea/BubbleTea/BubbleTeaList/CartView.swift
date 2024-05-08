//
//  CartView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 8/5/2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        List {
            ForEach(cartManager.items) { cartItem in
                HStack {
                    Text(cartItem.bubbleTea.name)
                    Spacer()
                    Text("x\(cartItem.quantity)")
                    if let pricePerUnit = cartItem.bubbleTea.price[cartItem.size] {
                        Text("\(pricePerUnit * Double(cartItem.quantity), specifier: "%.2f")")
                    } else {
                        Text("Error: Price not found")
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }
        .navigationTitle("Cart")
    }
    
    private func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let cartItem = cartManager.items[index]
            cartManager.removeFromCart(cartItem: cartItem)
        }
    }
}



#Preview {
    CartView()
}
