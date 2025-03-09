//
//  SettingsView.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct SettingsView: View {
    @State private var darkMode = false
    @State private var textSize: Int = 14
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    // 1) Your Account Card
                    NavigationLink(destination: ProfilePageView()) {
                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.gray)
                                )
                            
                            Text("Your Account")
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
                    }
                    
                    // 2) Admin Page Card
                    NavigationLink(destination: Text("Admin Page")) {
                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.gray)
                                )
                            
                            Text("Admin Page")
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
                    }
                    
                    // 3) Dark Mode Card
                    HStack(spacing: 16) {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "moon.fill")
                                    .foregroundColor(.gray)
                            )
                        
                        Text("Dark Mode")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Toggle("", isOn: $darkMode)
                            .labelsHidden()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
                    
                    // 4) Text Size Card
                    HStack(spacing: 16) {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "textformat.size")
                                    .foregroundColor(.gray)
                            )
                        
                        Text("Text Size")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button {
                            textSize = max(textSize - 1, 1)
                        } label: {
                            Text("-")
                                .font(.headline)
                                .frame(width: 30, height: 30)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                        }
                        
                        // Show current text size
                        Text("\(textSize)")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Button {
                            textSize += 1
                        } label: {
                            Text("+")
                                .font(.headline)
                                .frame(width: 30, height: 30)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
                    
                }
                .padding(.horizontal)
                .padding(.top, 16)
            }
            .background(Color(.systemGray6))
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
