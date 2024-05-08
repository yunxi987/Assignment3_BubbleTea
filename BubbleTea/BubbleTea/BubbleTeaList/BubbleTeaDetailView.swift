//
//  BubbleTeaDetailView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 8/5/2024.
//

import SwiftUI

struct BubbleTeaDetailView: View {
    @EnvironmentObject var cartManager: CartManager
    var bubbleTea: BubbleTea
    @State private var selectedSize = "Reg"
    @State private var selectedAddOns: [AddOn] = []
    @State private var navigateToCart = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Spacer()
            Image(bubbleTea.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 200)
                .padding()

            Text(bubbleTea.name)
                .font(.title)
                .padding()

            Picker("Size", selection: $selectedSize) {
                Text("Regular").tag("Reg")
                Text("Large").tag("Large")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Text("Price: $\(bubbleTea.price[selectedSize] ?? 0, specifier: "%.2f")")
                .padding()

            

            Spacer()

            Button("Add to Cart") {
                cartManager.addToCart(bubbleTea: bubbleTea, size: selectedSize, addOns: selectedAddOns)
                navigateToCart = true
            }
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding()
            
            Button("Back") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }

    private func toggleAddOn(_ addOn: AddOn) {
        if selectedAddOns.contains(addOn) {
            selectedAddOns.removeAll(where: { $0 == addOn })
        } else {
            selectedAddOns.append(addOn)
        }
    }
}

struct AddOnView: View {
    var addOn: AddOn
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .accentColor : .secondary)
                Text(addOn.name)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct BubbleTeaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleTeaDetailView(bubbleTea: sampleBubbleTea)
            .environmentObject(CartManager())
    }

    static var sampleBubbleTea: BubbleTea {
        return ModelData().bubbleTeas.first!
    }
}
