//
//  CartView.swift
//  BubbleTea
//
//  Created by Lingjing Zhou on 8/5/2024.
//

import SwiftUI

// CartView displays the shopping cart interface, showing a list of items added to the cart or a message if the cart is empty.
struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToPayment = false
    
    var body: some View {
        VStack {
            if cartManager.items.isEmpty {
                EmptyCartView() // Shows an empty cart view if there are no items.
            } else {
                List {
                    ForEach(cartManager.items) { cartItem in
                        CartItemView(cartItem: cartItem) // Displays each cart item.
                    }
                    .onDelete(perform: deleteItems) // Enables item deletion with a swipe gesture.
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

// EmptyCartView displays a message indicating that the cart is currently empty.
struct EmptyCartView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Your cart is empty")
                .font(.title)
                .foregroundColor(.gray)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "fef9e6"), .white]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

// CartItemView displays detailed information about each item in the shopping cart.
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
                    .bold()
            }
            .padding()
            
            HStack {
                Button(action: {
                    cartManager.items.removeAll()
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.gray)
                        .frame(maxWidth: 100)
                        .padding()
                }
                
                Spacer()
                
                NavigationLink(destination: PayMethodView().environmentObject(cartManager), isActive: $navigateToPayment) {
                    Button("Check Out") {
                        navigateToPayment = true
                    }
                    .bold()
                    .padding(.vertical)
                    .frame(width: 200)
                    .foregroundColor(.white)
                    .background(Color(hex: "8ba185"))
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
            .environmentObject(CartManager(modelData: ModelData()))
    }
}

