//
//  EventsSearchBar.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct EventsSearchBar: View {
    @Binding var text: String
    var placeholder: String = "Search"
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
                .foregroundColor(.primary)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(8)
        .background(Color(.systemGray5))
        .cornerRadius(8)
        .padding(.horizontal, 16)
    }
}
