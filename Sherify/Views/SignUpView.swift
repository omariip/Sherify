//
//  SignUpView.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                
                Spacer().frame(height: 100)
                
                VStack {
                    Image("sheridanLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Create Your Account")
                        .font(.system(size: 30, weight: .medium))
                }
                .padding(.bottom, 40)
                
                VStack(spacing: 16) {
                    TextField("First Name", text: $firstName)
                        .frame(maxWidth: 330)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(5)
                    
                    TextField("Last Name", text: $lastName)
                        .frame(maxWidth: 330)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(5)
                    
                    TextField("Sheridan Email", text: $email)
                        .frame(maxWidth: 330)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(5)
                    
                    SecureField("Password", text: $password)
                        .frame(maxWidth: 330)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(5)
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .frame(maxWidth: 330)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(5)
                }
                .padding(.top, 10)
                
                Spacer()
                
                VStack(spacing: 10) {
                    NavigationLink(destination: MainTabView().navigationBarBackButtonHidden(true)) {
                        Text("Sign Up")
                            .frame(maxWidth: 330)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                    
                    Button("Already have an account? Log in") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
                .padding(.bottom, 70)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color(hex: "#F2F2F7"))
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SignUpView()
}
