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


    let comments: [Comment] = [
        Comment(name: "Mathew Boyd", postedTime: "12 hours", text: "This looks great : ) I am excited to come"),
        Comment(name: "Rodger", postedTime: "1 hour", text: "I was going to do this, however my grandma is sick so I don't think I can make it this time."),
        Comment(name: "Jack Sperrow", postedTime: "1 hour", text: "I am going to do a lot of fun : )")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .center, spacing: 16) {
                    
                    HStack(alignment: .top, spacing: 16) {
                        Image(event.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 120)
                            .cornerRadius(8)

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Date and Time")
                                .font(.headline)
                                .foregroundColor(.black)

                            Text(event.dateLine1)
                                .font(.footnote)
                                .foregroundColor(.gray)

                            Text(event.dateLine2)
                                .font(.footnote)
                                .foregroundColor(.gray)

                            Spacer().frame(height: 8)

                            Text("Location:")
                                .font(.headline)
                                .foregroundColor(.black)

                            Text(event.location ?? "Location not specified")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }

                    Text(event.description)
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)

                    HStack {
                        Text("Attending: \(attendingCount)")
                            .font(.footnote)
                            .foregroundColor(.black)

                        Spacer()

                        Text("I am attending")
                            .font(.footnote)

                        Toggle("", isOn: $isAttending)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                    }
                    .onChange(of: isAttending) { newValue in
                        attendingCount += newValue ? 1 : -1
                    }
                }
                .padding()
                .frame(maxWidth: 370)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.gray.opacity(0.1), radius: 4, x: 0, y: 2)

                
                VStack(spacing: 0) {
                    Divider()
                    if comments.isEmpty {
                        Text("No comments yet")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ForEach(comments) { comment in
                            CommentRow(comment: comment)
                            Divider()
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGray6))
        .navigationTitle(event.title.uppercased())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    shareEvent()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }
    
    func shareEvent() {
        let items = [event.title, event.description]
        let avc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(avc, animated: true)
    }
}

struct CommentRow: View {
    let comment: Comment

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(comment.name)
                    .font(.subheadline)
                    .bold()

                Spacer()

                Button("Reply") {}
                    .font(.caption)
                    .foregroundColor(.blue)
            }

            Text("Posted \(comment.postedTime) ago")
                .font(.caption)
                .foregroundColor(.gray)

            Text(comment.text)
                .font(.body)
                .foregroundColor(.black)
                .padding(.vertical, 4)
                .background(Color(.systemGray5))
                .cornerRadius(8)
        }
        .padding(.vertical, 8)
    }
}



#Preview {
    let sampleEvent = Event(
        title: "Tech Networking Night",
        dateLine1: "Friday, March 15, 2025",
        dateLine2: "6:00 PM - 9:00 PM",
        description: """
    Join us for an exciting evening of networking with tech professionals, students, and industry leaders.
    This event will feature keynote speakers, panel discussions, and plenty of opportunities to connect with others in the tech community.

    Food and drinks will be provided. Don't miss this opportunity to expand your network and gain insights into the tech industry!
    """,
        location: "Sheridan College - Oakville B104",
        imageName: "networking_event"
    )
    
    EventDetailsView(event: sampleEvent)
}
