//
//  ProfilePageView.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-09.
//

import SwiftUI

struct ProfilePageView: View {
       @State private var firstName = "Mathew"
       @State private var lastName = "Boyd"
       @State private var email = "someemail@sheridancollege.ca"
       
       // If you need to dismiss this view programmatically:
       @Environment(\.dismiss) var dismiss
       
       var body: some View {
           NavigationStack {
               VStack(spacing: 24) {
                   
                   // Profile Picture + Change Button
                   HStack(spacing: 60) {
                       // Circle with user icon
                       Circle()
                           .fill(Color.gray.opacity(0.2))
                           .frame(width: 80, height: 80)
                           .overlay(
                               Image(systemName: "person.fill")
                                   .resizable()
                                   .scaledToFit()
                                   .foregroundColor(.gray)
                                   .frame(width: 40, height: 40)
                           )
                       
                       // Change Profile Picture button
                       Button(action: {
                           // Handle changing profile picture
                       }) {
                           Text("Change Profile Picture")
                               .font(.system(size: 14))
                               .foregroundColor(.white)
                               .padding(.vertical, 8)
                               .padding(.horizontal, 16)
                               .background(Color.blue)
                               .cornerRadius(8)
                       }
                   }
                   .padding(.top, 40)
                   
                   // White card with first name, last name, and email
                   VStack(spacing: 0) {
                       HStack {
                           Text(firstName)
                               .font(.system(size: 16))
                               .foregroundColor(.black)
                           Spacer()
                       }
                       .padding()
                       
                       Divider()
                       
                       HStack {
                           Text(lastName)
                               .font(.system(size: 16))
                               .foregroundColor(.black)
                           Spacer()
                       }
                       .padding()
                       
                       Divider()
                       
                       HStack {
                           Text(email)
                               .font(.system(size: 16))
                               .foregroundColor(.black)
                           Spacer()
                       }
                       .padding()
                   }
                   .background(Color.white)
                   .cornerRadius(8)
                   .shadow(color: .gray.opacity(0.1), radius: 3, x: 0, y: 2)
                   .padding(.horizontal, 16)
                   
                   Spacer()
               }
               .frame(maxWidth: .infinity)
               .background(Color(.systemGray6))
               .navigationTitle("Account")
               .navigationBarTitleDisplayMode(.inline)
               .navigationBarBackButtonHidden(true)      // Hide default back button
               .toolbar {
                   // Custom "Settings" back button on the top-left
                   ToolbarItem(placement: .navigationBarLeading) {
                       Button {
                           dismiss()   // or handle your own navigation
                       } label: {
                           HStack(spacing: 4) {
                               Image(systemName: "chevron.left")
                               Text("Settings")
                           }
                       }
                   }
               }
           }
       }
}

#Preview {
    ProfilePageView()
}
