//
//  ActionButton.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI


struct ActionButton: View {
    var title: String
    var icon: String
    
    var body: some View {
        Button(action: {}) {
            HStack {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                Image(systemName: icon)
                    .foregroundColor(.black)
            }
            .frame(width: 160, height: 40)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 3)
        }
    }
}
