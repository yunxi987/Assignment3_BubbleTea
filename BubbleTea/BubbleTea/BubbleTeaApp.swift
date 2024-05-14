//
//  BubbleTeaApp.swift
//  BubbleTea
//
//  Created by Lingjing Zhou on 6/5/2024.
//

import SwiftUI

@main
struct BubbleTeaApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
                .environmentObject(CartManager())
                
        }
    }
}
