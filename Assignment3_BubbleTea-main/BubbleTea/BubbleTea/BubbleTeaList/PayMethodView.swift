//
//  PayMethodView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 8/5/2024.
//

import SwiftUI

struct PayMethodView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedMethod = "Card Pay"
    @State private var showCardPayView = false
    @State private var showOrderConfirmation = false
    @State private var orderNumber = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(cartManager.items) { item in
                    HStack {
                        Text(item.bubbleTea.name)
                        Spacer()
                        Text("$\(item.totalPrice, specifier: "%.2f")")
                    }
                }
            }
            
            Text("Total: $\(cartManager.total(), specifier: "%.2f")")
                .font(.title)
                .padding()
            
            Picker("Select Payment Method", selection: $selectedMethod) {
                Text("Card Pay").tag("Card Pay")
                Text("Apple Pay").tag("Apple Pay")
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
        .sheet(isPresented: $showCardPayView) {
            CardPayView(showCardPayView: $showCardPayView, showOrderConfirmation: $showOrderConfirmation, orderNumber: $orderNumber)
        }
        .sheet(isPresented: $showOrderConfirmation) {
            OrderConfirmationView(orderNumber: orderNumber)
        }
    }
    
    private func processPayment() {
        if selectedMethod == "Card Pay" {
            showCardPayView = true
        } else {
            generateOrderNumber()
            showOrderConfirmation = true
        }
    }
    
    private func generateOrderNumber() {
        let letter = String(UnicodeScalar(Int.random(in: 65...90))!)
        let number = String(format: "%03d", Int.random(in: 0...999))
        orderNumber = letter + number
    }
}

struct CardPayView: View {
    @Binding var showCardPayView: Bool
    @Binding var showOrderConfirmation: Bool
    @Binding var orderNumber: String
    
    @State private var cardholderName = ""
    @State private var cardNumber = ""
    @State private var expirationDate = ""
    @State private var cvv = ""
    
    var body: some View {
        VStack {
            Image("card_pay_image") // Replace with your image name
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            TextField("Cardholder Name", text: $cardholderName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Card Number", text: $cardNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                TextField("Expiration Date", text: $expirationDate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("CVV", text: $cvv)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Button("Confirm Payment") {
                generateOrderNumber()
                showCardPayView = false
                showOrderConfirmation = true
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .disabled(cardholderName.isEmpty || cardNumber.isEmpty || expirationDate.isEmpty || cvv.isEmpty)
        }
    }
    
    private func generateOrderNumber() {
        let letter = String(UnicodeScalar(Int.random(in: 65...90))!)
        let number = String(format: "%03d", Int.random(in: 0...999))
        orderNumber = letter + number
    }
}

    
    
    struct PayMethodView_Previews: PreviewProvider {
        static var previews: some View {
            PayMethodView()
                .environmentObject(CartManager())
        }
    }
    
