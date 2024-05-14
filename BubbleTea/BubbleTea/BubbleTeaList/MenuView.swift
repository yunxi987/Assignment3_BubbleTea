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
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            BubbleTeaListView(category: "Fruit Tea")
                .tabItem {
                    Image(systemName: "leaf.fill")
                    Text("Fruit Tea")
                }
            
            BubbleTeaListView(category: "Milk Tea")
                .tabItem {
                    Image(systemName: "takeoutbag.and.cup.and.straw")
                    Text("Milk Tea")
                }
            
            BubbleTeaListView(category: "Flower Tea")
                .tabItem {
                    Image(systemName: "camera.macro")
                    Text("Flower Tea")
                }
            
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("View Cart")
                }
        }
        .environmentObject(modelData)
        .environmentObject(cartManager)
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                AllBubbleTeasView()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BubbleTeaListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selectedBubbleTea: BubbleTea?
    var category: String
    
    var filteredBubbleTeas: [BubbleTea] {
        modelData.bubbleTeas.filter { $0.category == category }
    }
    
    var body: some View {
        NavigationView {
            List(filteredBubbleTeas, id: \.id) { bubbleTea in
                Button(action: {
                    self.selectedBubbleTea = bubbleTea
                }) {
                    BubbleTeaRow(bubbleTea: bubbleTea)
                }
                .padding(-20)
            }
            .navigationTitle(category)
            .sheet(item: $selectedBubbleTea) { tea in
                BubbleTeaDetailView(bubbleTea: tea)
            }
        }
    }
}

struct AllBubbleTeasView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selectedBubbleTea: BubbleTea?

    var body: some View {
        NavigationView {
            List(modelData.allBubbleTeas, id: \.id) { bubbleTea in
                Button(action: {
                    self.selectedBubbleTea = bubbleTea
                }) {
                    BubbleTeaRow(bubbleTea: bubbleTea)
                }
                .padding(-20)
            }
            .navigationTitle("Home")
            .sheet(item: $selectedBubbleTea) { tea in
                BubbleTeaDetailView(bubbleTea: tea)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(ModelData())
            .environmentObject(CartManager())
    }
}
