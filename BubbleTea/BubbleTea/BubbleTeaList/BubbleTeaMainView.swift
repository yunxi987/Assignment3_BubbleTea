//
//  BubbleTeaMainView.swift
//  BubbleTea
//
//  Created by Lingjing Zhou on 6/5/2024.
//

import SwiftUI

// This SwiftUI view represents the main screen of a bubble tea shop app. 
// It features a centered image of a tea, a button to start an order, and a hex color extension for custom color settings.

struct BubbleTeaMainView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("KawaTea")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500,height: 500)
                    .padding()
   
                NavigationLink(
                    destination: MenuView(),
                    label: {
                        Text("Start Order")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 30)
                            .background(Color(hex: "8ba185"))
                            .cornerRadius(10)
                    
                })
                .padding()
                Spacer()
            }
            .background(.white)
            .edgesIgnoringSafeArea(.all)
            
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}



#Preview {
    BubbleTeaMainView()
}
