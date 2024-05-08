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

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: bubbleTea.imageName))
                .frame(width: 100, height: 100)
            Text(bubbleTea.name).font(.title)
            Text(bubbleTea.description).font(.body)
            Picker("Size", selection: $selectedSize) {
                Text("Regular").tag("Reg")
                Text("Large").tag("Large")
            }
            .pickerStyle(SegmentedPickerStyle())
            Text("Price: \(bubbleTea.price[selectedSize]!, specifier: "%.2f")")
            Button("Add to Cart") {
                cartManager.addToCart(bubbleTea: bubbleTea, size: selectedSize, addOns: selectedAddOns)
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
        BubbleTea(id: "1", name: "Jasmine Tea", description: "Fragrant jasmine tea.", price: ["Reg": 5.00, "Large": 7.00], imageName: "JasmineTea")
    }
}
