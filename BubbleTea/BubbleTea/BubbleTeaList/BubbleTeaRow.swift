//
//  BubbleTeaRow.swift
//  BubbleTea
//
//  Created by Lingjing Zhou on 8/5/2024.
//

import SwiftUI

struct BubbleTeaRow: View {
    var bubbleTea: BubbleTea

    var body: some View {
        HStack {
            Image(bubbleTea.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(bubbleTea.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("$\(bubbleTea.price["Reg"]!, specifier: "%.2f") - $\(bubbleTea.price["Large"]!, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 8)
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}
struct BubbleTeaRow_Previews: PreviewProvider {
    static var previews: some View {
        BubbleTeaRow(bubbleTea: sampleBubbleTea())
            .previewLayout(.sizeThatFits)
            .padding()
    }

    static func sampleBubbleTea() -> BubbleTea {
        return BubbleTea(
            id: "1",
            name: "Jasmine Tea",
            price: ["Reg": 5.00, "Large": 7.00],
            imageName: "JasmineTea",
            category: "Flower Tea"
        )
    }
}
