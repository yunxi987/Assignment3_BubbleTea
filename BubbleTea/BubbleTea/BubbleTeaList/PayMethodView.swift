//
//  PayMethodView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 8/5/2024.
//

import SwiftUI

struct PayMethodView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        VStack {
            Text("Total: \(cartManager.total(), specifier: "%.2f")")
            Button("Pay Now") {
                // Payment logic goes here
            }
        }
        .navigationTitle("Checkout")
    }
}


#Preview {
    PayMethodView()
}
