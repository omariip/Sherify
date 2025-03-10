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
    @State private var isEditing = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                HStack(spacing: 60) {
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

                    Button(action: {
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

                VStack(spacing: 0) {
                    TextField("First Name", text: $firstName)
                        .padding()
                        .background(Color.white)

                    Divider()

                    TextField("Last Name", text: $lastName)
                        .padding()
                        .background(Color.white)

                    Divider()

                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .keyboardType(.emailAddress)
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.1), radius: 3, x: 0, y: 2)
                .padding(.horizontal, 16)

                Spacer()

         
                Button(action: {
                    // Handle save action (e.g., API call, local storage update)
                    isEditing = false
                }) {
                    Text("Save")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 30)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
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
