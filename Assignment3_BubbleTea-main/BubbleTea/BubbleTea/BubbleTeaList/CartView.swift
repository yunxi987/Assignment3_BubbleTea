//
//  CartView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 8/5/2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToPayment = false
    
    var body: some View {
        VStack {
            if cartManager.items.isEmpty {
                EmptyCartView()
            } else {
                List {
                    ForEach(cartManager.items) { cartItem in
                        CartItemView(cartItem: cartItem)
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            
            CartTotalView(navigateToPayment: $navigateToPayment)
        }
        .navigationTitle("Cart")
        .navigationBarItems(trailing: EditButton())
    }
    
    private func deleteItems(at offsets: IndexSet) {
        cartManager.items.remove(atOffsets: offsets)
    }
}

struct EmptyCartView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Your cart is empty")
                .font(.title)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct CartItemView: View {
    @ObservedObject var cartItem: CartItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(cartItem.bubbleTea.name)
                .font(.headline)
            
            HStack {
                Text("Size: \(cartItem.size)")
                Spacer()
                Text("Sweetness: \(cartItem.sweetness)")
                Spacer()
                Text("Ice: \(cartItem.iceLevel)")
            }
            .font(.subheadline)
            
            if !cartItem.addOns.isEmpty {
                Text("Add-ons: \(cartItem.addOns.map { $0.name }.joined(separator: ", "))")
                    .font(.subheadline)
            }
            
            HStack {
                Text("Quantity: \(cartItem.quantity)")
                Spacer()
                Text("$\(cartItem.totalPrice, specifier: "%.2f")")
            }
            .font(.subheadline)
        }
    }
}

struct CartTotalView: View {
    @EnvironmentObject var cartManager: CartManager
    @Binding var navigateToPayment: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Total:")
                    .font(.title)
                Spacer()
                Text("$\(cartManager.total(), specifier: "%.2f")")
                    .font(.title)
            }
            .padding()
            
            HStack {
                Button("Clear All") {
                    cartManager.items.removeAll()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                NavigationLink(destination: PayMethodView().environmentObject(cartManager), isActive: $navigateToPayment) {
                    Button("Check Out") {
                        navigateToPayment = true
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())  // Ensure this is provided
    }
}
