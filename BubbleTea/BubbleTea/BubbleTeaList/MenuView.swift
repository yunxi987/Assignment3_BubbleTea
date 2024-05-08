//
//  MenuView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 8/5/2024.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selectedBubbleTea: BubbleTea?
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView {
            List(modelData.bubbleTeas, id: \.id) { bubbleTea in
                Button(action: {
                    self.selectedBubbleTea = bubbleTea
                }) {
                    BubbleTeaRow(bubbleTea: bubbleTea)
                }
                .padding(-20)
            }
            .navigationTitle("Menu")
            .sheet(item: $selectedBubbleTea) { tea in
                BubbleTeaDetailView(bubbleTea: tea)
            }
        }
    }
}




struct BubbleTeaList_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(ModelData())
    }
}

