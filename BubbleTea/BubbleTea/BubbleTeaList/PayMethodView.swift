//
//  PayMethodView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 8/5/2024.
//

import SwiftUI

import SwiftUI

struct PayMethodView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedMethod = "Cart Pay"

    var body: some View {
        VStack {
            Text("Total: \(cartManager.total(), specifier: "%.2f")")
                .onAppear {
                    print("Cart total: \(cartManager.total())")
                }
            Picker("Select Payment Method", selection: $selectedMethod) {
                Text("Cart Pay").tag("Cart Pay")
                Text("Alipay").tag("Alipay")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button("Confirm Payment") {
                processPayment()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .navigationTitle("Payment Methods")
        .onAppear {
            print("Payment View Loaded with \(selectedMethod)")
        }
    }

    private func processPayment() {
        print("Payment processed with \(selectedMethod)")
    }
}



struct PayMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PayMethodView()
            .environmentObject(CartManager())
    }
}

