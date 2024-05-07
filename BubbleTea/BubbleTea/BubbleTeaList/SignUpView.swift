//
//  SignUpView.swift
//  BubbleTea
//
//  Created by 周灵婧 on 6/5/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var showEmailError = false
    @State private var showPasswordError = false
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if showEmailError {
                Text("Email already exists!")
                    .foregroundColor(.red)
                    .padding()
            }
            
            if showPasswordError {
                Text("Passwords do not match!")
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button(action: signUp) {
                Text("Sign Up")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(hex: "532e07"))
                    .cornerRadius(10)
            }
            .padding()
        }
    }
    
    func signUp() {
        // Validate if the email already exists
        let emailExists = checkEmailExists(email)
        
        // Validate if the passwords match
        let passwordsMatch = password == confirmPassword
        
        showEmailError = emailExists
        showPasswordError = !passwordsMatch
        
        // If the email doesn't exist and the passwords match, register the user
        if !emailExists && passwordsMatch {
            registerUser(email, password)
        }
    }
    
    func checkEmailExists(_ email: String) -> Bool {
        // Here, you need to implement the logic to check if the email already exists
        // For example, query the database or call an API
        // For simplicity, we assume that all emails ending with "@example.com" are already registered
        return email.hasSuffix("@example.com")
    }
    
    func registerUser(_ email: String, _ password: String) {
        // Here, you need to implement the logic to register the user
        // For example, save the user information to a database or call an API
        print("Registering user with email: \(email) and password: \(password)")
    }
}

#Preview {
    SignUpView()
}
