//
//  BubbleTeaMainView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 6/5/2024.
//

import SwiftUI

struct BubbleTeaMainView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showMenuView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("BubbleTeaLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400,height: 400)
                    .padding()
                
                NavigationLink(destination: MenuView(), isActive: $showMenuView){
                    Button(action: {
                        showMenuView = true
                    }) {
                        Text("Start Order")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 8)  // Reduce vertical padding
                            .padding(.horizontal, 20)  // Slightly increase horizontal padding for better touch area
                            .background(Color(hex: "532e07"))
                            .cornerRadius(10)
                    }
                }
                
                .padding(.top, 10)  // Add slight padding on top of the button
                Spacer()

            }
            
        }
    }
}
    


#Preview {
    BubbleTeaMainView()
}
