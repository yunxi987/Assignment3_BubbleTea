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
                Spacer()
                Text("Cart")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Spacer()
            } else {
                List {
                    ForEach(cartManager.items) { cartItem in
                        HStack {
                            Text(cartItem.bubbleTea.name)
                            Spacer()
                            Text("x\(cartItem.quantity)")
                            Spacer()
                            Text("\(cartItem.bubbleTea.price[cartItem.size]!, specifier: "%.2f")")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            
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
        .navigationTitle("Cart")
        .navigationBarItems(trailing: editButton)
    }

    private var editButton: some View {
        Button(action: {
            withAnimation {
                $cartManager.items.wrappedValue = []
            }
        }) {
            Text("Edit")
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            cartManager.items.remove(at: index)
        }
    }
}




struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())  // Ensure this is provided
    }
}

