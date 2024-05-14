//
//  BubbleTeaMainView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 6/5/2024.
//

import SwiftUI

struct BubbleTeaMainView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Image("BubbleTeaLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500,height: 500)
                    .padding()
                Text("Welcome to Bubble Tea")
                    .font(.title)
                    .padding(20)
                Spacer()
                
                NavigationLink(
                    destination: MenuView(),
                    label: {
                        Text("Start Order")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 25)
                            .padding(.horizontal, 35)
                            .background(Color(hex: "532e07"))
                            .cornerRadius(10)
                    
                })
                .padding(.top, 10)
                Spacer()

            }
            
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