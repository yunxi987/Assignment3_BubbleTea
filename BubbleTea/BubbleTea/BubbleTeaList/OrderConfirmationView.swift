//
//  OrderConfirmationView.swift
//  BubbleTea
//
//  Created by Yunxi Li on 13/5/2024.
//

import Foundation
import SwiftUI
struct OrderConfirmationView: View {
    var orderNumber: String
    
    var body: some View {
        VStack {
            Text("Thank you for your order!")
                .font(.title)
                .padding()
            
            Text("Your order number is: \(orderNumber)")
                .font(.headline)
                .padding()
            
            Text("We will prepare your drinks as soon as possible.")
                .font(.subheadline)
                .padding()
        }
        
    }
}
