//
//  BubbleTeaDetailView.swift
//  BubbleTea
//
//  Created by Lingjing Zhou on 8/5/2024.
//

import SwiftUI

// Define a view that displays all the details about each bubble tea
struct BubbleTeaDetailView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var modelData: ModelData
    var bubbleTea: BubbleTea
    @State private var selectedSize = "Reg"
    @State private var selectedAddOns: [AddOn] = []
    @State private var selectedSweetness = "100%"
    @State private var selectedIce = "100%"
    @State private var navigateToCart = false
    @State private var quantity = 1
    @Environment(\.presentationMode) var presentationMode

    let sweetnessOptions = ["100%", "75%", "50%", "0%"]
    let iceOptions = ["Full", "Half", "Less", "No Ice"]
    let columns = [GridItem(.adaptive(minimum: 100))]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image(bubbleTea.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .padding()
                    
                    Text(bubbleTea.name)
                        .font(.title)
                        .padding(-10)
                    
                    Picker("Size", selection: $selectedSize) {
                        Text("Regular").tag("Reg")
                        Text("Large").tag("Large")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Sugar Level")
                            .font(.headline)
                        Picker("Sweetness", selection: $selectedSweetness) {
                            ForEach(sweetnessOptions, id: \.self) { sweetness in
                                Text(sweetness)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        Text("Ice Level")
                            .font(.headline)
                        Picker("Ice", selection: $selectedIce) {
                            ForEach(iceOptions, id: \.self) { ice in
                                Text(ice)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        Text("Add-ons（1$ each)")
                            .font(.headline)
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(modelData.addOns) { addOn in
                                AddOnView(addOn: addOn, isSelected: selectedAddOns.contains(addOn)) {
                                    toggleAddOn(addOn)
                                }
                            }
                        }
                        Spacer()
                        Text("Price: $\(calculateTotalPrice(), specifier: "%.2f")")
                            .font(.title)
                        
                    }
                    .padding()
                    
              
                    
                    Button("Add to Cart") {
                        // This block checks if the item is already in the cart with the exact same properties.
                        if let index = cartManager.items.firstIndex(where: {
                            $0.bubbleTea.id == bubbleTea.id &&
                            $0.size == selectedSize &&
                            $0.sweetness == selectedSweetness &&
                            $0.iceLevel == selectedIce &&
                            $0.addOns == selectedAddOns
                        }) {
                            // If the item is found with the same properties, it increments the quantity.
                            cartManager.items[index].quantity += quantity
                        } else {
                            // If the item is not found, it creates a new CartItem with the selected properties.
                            let newItem = CartItem(
                                bubbleTea: bubbleTea,
                                size: selectedSize,
                                sweetness: selectedSweetness,
                                iceLevel: selectedIce,
                                quantity: quantity,
                                addOns: selectedAddOns
                            )
                            cartManager.items.append(newItem)
                        }
                        navigateToCart = true
                    }
                    .bold()
                    .padding(.vertical)
                    .frame(width: 150)
                    .foregroundColor(.white)
                    .background(Color(hex: "8ba185"))
                    .cornerRadius(8)
                    
                    NavigationLink("", destination: CartView(), isActive: $navigateToCart)
                    Button("Back") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .bold()
                    .padding(.vertical)
                    .frame(width: 150)
                    .foregroundColor(.white)
                    .background(Color(hex: "8ba185"))
                    .cornerRadius(8)
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "fef9e6"), .white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
        

    private func toggleAddOn(_ addOn: AddOn) {
        if let index = selectedAddOns.firstIndex(of: addOn) {
            selectedAddOns.remove(at: index)
        } else {
            selectedAddOns.append(addOn)
        }
    }
    
    private func calculateTotalPrice() -> Double {
        let basePrice = bubbleTea.price[selectedSize] ?? 0
        let addOnsPrice = Double(selectedAddOns.count) * 1.00
        return basePrice + addOnsPrice
    }
}

struct AddOnView: View {
    var addOn: AddOn
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .accentColor : .secondary)
                    .font(.system(size: 24))

                Text(addOn.name)
                    .foregroundColor(.primary)
                    .font(.subheadline)
                    .padding(.leading, 5)
            }
        }
        .buttonStyle(.bordered)
        .tint(isSelected ? .blue : .gray)
    }
}


struct BubbleTeaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleTeaDetailView(bubbleTea: sampleBubbleTea())
            .environmentObject(ModelData())
            .environmentObject(CartManager(modelData: ModelData()))

    }

    static func sampleBubbleTea() -> BubbleTea {
        return ModelData().bubbleTeas.first ?? BubbleTea(id: "0", name: "Error", price: ["Reg": 0.0], imageName: "default_image", category: "Error")
    }

}
