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
        ZStack {
            // Full cell transparent NavigationLink:
            NavigationLink(destination: EventDetailsView(event: event)) {
                EmptyView()
            }
            .buttonStyle(PlainButtonStyle())
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(0)
            
            // Actual content of the cell
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
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    // Event description that is expandable
                    Text(event.description)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .lineLimit(isExpanded ? nil : 3)
                        .animation(.easeInOut, value: isExpanded)
                    
                    // "Read more/less" toggle button.
                    // Using PlainButtonStyle so its tap is handled by this button only.
                    Button(action: {
                        isExpanded.toggle()
                    }) {
                        Text(isExpanded ? "Read less" : "Read more")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(PlainButtonStyle())
                    // By default, buttons handle their own taps so this tap won’t fall through.
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
            .padding(.vertical, 4)
            .contentShape(Rectangle()) // Ensure the whole area is tappable.
        }
    }
}

//#Preview {
//    // Supply a sample event for preview testing
//    let sampleEvent = Event(
//        title: "Sample Event with a Very Long Title That Should Wrap",
//        dateLine1: "Friday, March 14th 2025 at 7:00pm",
//        dateLine2: "Friday, March 14th 2025 at 11:00pm",
//        description: "This is a long sample event description that is meant to show how the expandable text works. Tap 'Read more' to see the full description, and tap 'Read less' to collapse it back.",
//        imageName: "EventImage"
//    )
//    NavigationStack {
//        EventViewRow(event: sampleEvent)
//    }
//}
