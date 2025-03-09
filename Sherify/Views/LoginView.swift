//
//  LoginView.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                
                Spacer().frame(height: 120)
                
                VStack {
                    Image("sheridanLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Sherify Login")
                        .font(.system(size: 30, weight: .medium))
                }
                .padding(.bottom, 70)
                
                VStack(spacing: 16) {
                    TextField("Username", text: $email)
                        .frame(maxWidth: 330)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(5)
                    
                    SecureField("Password", text: $password)
                        .frame(maxWidth: 330)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(5)
                }
                .padding(.top, 10)
                
                Spacer()
                
                VStack(spacing: 10) {
                    NavigationLink(destination: MainTabView().navigationBarBackButtonHidden(true)) {
                        Text("Login")
                            .frame(maxWidth: 330)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Create Account")
                            .foregroundColor(.blue)
                    }
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
    LoginView()
}

