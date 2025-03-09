//
//  HomeView.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("Home")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)

                VStack {
                    HStack(spacing: 25) {
                        ActionButton(title: "Create New event", icon: "pencil")
                        ActionButton(title: "Past events", icon: "book")
                    }

                    HStack(spacing: 25) {
                        ActionButton(title: "Currents events", icon: "person.3.fill")
                        ActionButton(title: "Followed Events", icon: "person.2.fill")
                    }
                }

                // Announcements Section
                SectionCard(title: "Announcements:", showMore: true) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Basketball night moved:")
                            .font(.headline)
                            .foregroundColor(.blue)

                        Text("Zin high posted Jan 9th, 2025 3:38pm")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Text("Hello everyone i hope you are all doing well this afternoon, I am going to have to move our basketball night from 5:00 - 8:00 pm to 6:00 - 9:00pm. In the comments of this post can everyone let me know if they are able to attend the new session time so I know who is coming and who is not. Thank you again for your understanding, and next week's event should be at the regular scheduled time.")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 5)
                }

                // Upcoming Events Section
                SectionCard(title: "Upcoming Events", showMore: true) {
                    VStack(alignment: .leading, spacing: 8) {
                        EventRow(title: "Games and Ting", date: "Friday March 14th")
                        EventRow(title: "GDG on Campus: Sheridan College Mo..", date: "Monday March 17th")
                        EventRow(title: "Relay for Life’s Fundraising Event 2025", date: "Thursday March 20th")
                        EventRow(title: "How to LinkedIn: Build your best professi..", date: "Friday March 21st")
                        EventRow(title: "Igniters Food Drive", date: "Saturday March 22nd")
                    }
                    .padding(20)
                }

                Spacer()
            }
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .ignoresSafeArea(edges: .bottom)
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 50)
            }
        }
        .navigationTitle("Home") // Moves title to top bar
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView()
}
