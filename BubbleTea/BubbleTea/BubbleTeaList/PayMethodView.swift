//
//  PayMethodView.swift
//  BubbleTea
//
//  Created by Lingjing Zhou on 8/5/2024.
//

import SwiftUI

struct PayMethodView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedMethod = "Card Pay"
    @State private var showCardPayView = false
    @State private var showOrderConfirmation = false
    @State private var orderNumber = ""
    
    // This view handles the display and interaction with the user's shopping cart, including payment processing.
    var body: some View {
        VStack {
            List {
                ForEach(cartManager.items) { item in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(item.bubbleTea.name)
                            .font(.headline)
                        
                        HStack {
                            Text("Size: \(item.size)")
                            Spacer()
                            Text("Sweetness: \(item.sweetness)")
                            Spacer()
                            Text("Ice: \(item.iceLevel)")
                        }
                        .font(.subheadline)
                        
                        if !item.addOns.isEmpty {
                            Text("Add-ons: \(item.addOns.map { $0.name }.joined(separator: ", "))")
                                .font(.subheadline)
                        }
                        
                        Text("$\(item.totalPrice, specifier: "%.2f")")
                            .font(.headline)
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
            .background(Color(hex: "8ba185"))
            .cornerRadius(10)
            
            .sheet(isPresented: $showCardPayView) {
                CardPayView(showCardPayView: $showCardPayView,
                            showOrderConfirmation: $showOrderConfirmation,
                            orderNumber: $orderNumber)
                .onAppear {
                    generateOrderNumber()
                }
            }
            .sheet(isPresented: $showOrderConfirmation) {
                OrderConfirmationView(orderNumber: orderNumber)
                    .onAppear {
                        generateOrderNumber()
                    }
            }
        }
        .navigationTitle("Payment Methods")
        
    }
    
    // Handles the payment process based on the selected method.
    private func processPayment() {
        generateOrderNumber()
        if selectedMethod == "Card Pay" {
            showCardPayView = true
        } else {
            showOrderConfirmation = true
        }
    }
    // Generates a random order number consisting of a letter and three numbers.
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
                showCardPayView = false
                showOrderConfirmation = true
            }
            .padding()
            .foregroundColor(.white)
            .background(Color(hex: "8ba185"))
            .cornerRadius(10)
            .bold()
            .disabled(cardholderName.isEmpty || cardNumber.isEmpty || expirationDate.isEmpty || cvv.isEmpty)
        }
    }
}


struct PayMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PayMethodView()
            .environmentObject(CartManager(modelData: ModelData()))
    }
}
