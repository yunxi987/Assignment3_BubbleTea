//
//  MenuView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 8/5/2024.
//

import SwiftUI

import SwiftUI

struct MenuView: View {
    var bubbleTeas: [BubbleTea] = [
        BubbleTea(id: "1", name: "Jasmine Tea", description: "Fragrant jasmine tea.", price: ["Reg": 5.00, "Large": 7.00], imageName: "JasmineTea"),
        BubbleTea(id: "2", name: "Bubble Milk Tea", description: "Classic bubble milk tea.", price: ["Reg": 5.00, "Large": 7.00], imageName: "BubbleMilkTea")
        // Add more teas here
    ]

    var body: some View {
        NavigationView {
            List(bubbleTeas, id: \.id) { bubbleTea in
                NavigationLink(destination: BubbleTeaDetailView(bubbleTea: bubbleTea)) {
                    VStack(alignment: .leading) {
                        BubbleImage(image: Image(bubbleTea.imageName))
                        Text(bubbleTea.name)
                            .font(.headline)
                        Text("From \(bubbleTea.price["Reg"]!, specifier: "%.2f") - \(bubbleTea.price["Large"]!, specifier: "%.2f")")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Menu")
        }
    }
}




#Preview {
    MenuView()
}
