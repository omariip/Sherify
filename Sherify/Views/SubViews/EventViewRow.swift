//
//  EventViewRow.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct EventViewRow: View {
    let event: Event
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 1) Event Image at the top
            Image(event.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
            
            // 2) Content Section
            VStack(alignment: .leading, spacing: 8) {
                
                // Title, date lines, "Add To Calendar" button
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(event.title.uppercased())
                            .font(.headline)
                            .foregroundColor(.black)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .layoutPriority(1)
                        
                        
                        Text(event.dateLine1)
                            .font(.system(size: 9))
                            .foregroundColor(.gray)
                        
                        Text(event.dateLine2)
                            .font(.system(size: 9))
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                    
                    Spacer()
                    
                    Button(action: {
                        // Add to calendar action
                    }) {
                        Text("Add To Calendar")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                
                // Divider between top details and description
                Divider()
                    .padding(.vertical, 4)
                
                // Event description that is expandable
                Text(event.description)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .lineLimit(isExpanded ? nil : 3)
                    .animation(.easeInOut, value: isExpanded)
                
                // Toggle button for expanding/collapsing text
                Button(action: {
                    isExpanded.toggle()
                }) {
                    Text(isExpanded ? "Read less" : "Read more")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
        .padding(.vertical, 4)
    }
}

#Preview {
    //    EventViewRow(event: someSampleEvent)
}
