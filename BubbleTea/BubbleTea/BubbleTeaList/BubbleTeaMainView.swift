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
    @State private var showSignUp: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("BubbleTeaLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400,height: 400)
                    .padding()
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)  // Limit padding to horizontal only
                    .frame(maxWidth: 350)
              
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)  // Limit padding to horizontal only
                    .frame(maxWidth: 350)
                
                Button(action: loginAction) {
                    Text("Sign In")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 8)  // Reduce vertical padding
                        .padding(.horizontal, 20)  // Slightly increase horizontal padding for better touch area
                        .background(Color(hex: "532e07"))
                        .cornerRadius(10)
                }
                .padding(.top, 10)  // Add slight padding on top of the button
                Spacer()
                
                // Toggle for sign in and sign up
                HStack {
                    Text(showSignUp ? "Already a member? " : "Not a member yet? ")
                        .foregroundColor(.black)
                    NavigationLink(destination: SignUpView()) { // Navigate to SignUpView
                        Text(showSignUp ? "Sign in" : "Sign up")
                            .foregroundColor(.blue)
                    }
                }
                
                Spacer()
                
            }
            
        }
    }
    private func loginAction() {
        // Handle the login logic here
        print("Login attempted with username: \(username) and password: \(password)")
    }
}
    


#Preview {
    BubbleTeaMainView()
}
