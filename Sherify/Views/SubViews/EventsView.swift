//
//  EventsView.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct EventsView: View {
    @State private var searchText = ""
    
    // Filter events by search text
    private var filteredEvents: [Event] {
        if searchText.isEmpty {
            return allEvents
        } else {
            return allEvents.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                // Section header with custom search bar
                Section(header: EventsSearchBar(text: $searchText)) {
                    ForEach(filteredEvents) { event in
                        
                        EventViewRow(event: event)
                        
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Action: e.g., open AddEventView
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .background(Color(.systemGray6))
        }
    }
}
