//
//  SectionCard.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct SectionCard<Content: View>: View {
    var title: String
    var showMore: Bool
    var content: Content
    
    init(title: String, showMore: Bool = false, @ViewBuilder content: () -> Content) {
        self.title = title
        self.showMore = showMore
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                if showMore {
                    Button("Show More >") {}
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
            }
            
            content
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 3)
    }
}

#Preview {
    SectionCard(title: "Test", showMore: true) {
        Text("Sample content goes here.")
            .padding()
    }
}

