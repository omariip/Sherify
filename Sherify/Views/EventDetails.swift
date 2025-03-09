//
//  EventDetails.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct EventDetailsView: View {
    let event: Event
    @State private var isAttending: Bool = false
    @State private var attendingCount: Int = 42
    
    // Sample comments to display under the event
    let comments: [Comment] = [
        Comment(name: "Mathew Boyd", postedTime: "12 hours", text: "This looks great : ) I am excited to come"),
        Comment(name: "Rodger", postedTime: "1 hour", text: "I was going to do this, however my grandma is sick so I don't think I can make it this time."),
        Comment(name: "Jack Sperrow", postedTime: "1 hour", text: "I am going to do a lot of fun : )")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Card for event details
                VStack(alignment: .center, spacing: 16) {
                    
                    // Top section: Image on the left, date/time & location on the right
                    HStack(alignment: .top, spacing: 16) {
                        // Event image
                        Image(event.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 120)
                            .clipped()
                            .cornerRadius(8)
                        
                        // Date/Time and Location details
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Date and Time")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text(event.dateLine1)
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                            
                            Text(event.dateLine2)
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                            
                            Spacer().frame(height: 8)
                            
                            Text("Location:")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text("Sheridan College - Oakville B104")
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // Event description
                    Text(event.description)
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        Text("Attending: \(attendingCount)")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("I am attending")
                            .font(.system(size: 12))
                        
                        Toggle("", isOn: $isAttending)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .scaleEffect(0.7)
                        
                    }
                    .onChange(of: isAttending) { newValue in
                        if newValue {
                            attendingCount += 1
                        } else {
                            attendingCount -= 1
                        }
                    }
                }
                .padding()
                .frame(maxWidth: 370)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.gray.opacity(0.1), radius: 4, x: 0, y: 2)
                
                // Comments Section
                VStack(spacing: 0) {
                    Divider()
                    ForEach(comments) { comment in
                        CommentRow(comment: comment)
                        Divider()
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGray6))
        .navigationTitle(event.title.uppercased())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // Share button on the top-right
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // Handle share action
                } label: {
                    Image(systemName: "pencil")
                }
            }
        }
    }
}

/// A single comment row
struct CommentRow: View {
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Top row: Name + "Reply" button
            HStack {
                Text(comment.name)
                    .font(.subheadline)
                    .bold()
                
                Spacer()
                
                Button("Reply") {
                    // Handle reply
                }
                .font(.caption)
                .foregroundColor(.blue)
            }
            
            // Posted time
            Text("Posted \(comment.postedTime) ago")
                .font(.caption)
                .foregroundColor(.gray)
            
            // Actual comment text
            Text(comment.text)
                .font(.body)
                .foregroundColor(.black)
        }
        .padding(.vertical, 8)
    }
}
