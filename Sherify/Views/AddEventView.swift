//
//  AddEventView.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct AddEventView: View {
    @State private var eventTitle = ""
    @State private var eventDescription = ""
    @State private var eventLocation = ""
    @State private var eventCategories = ""
    
    @State private var startDate = Date()
    @State private var startTime = Date()
    @State private var endDate = Date()
    @State private var endTime = Date()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // Photos Button
                Button(action: {
                    // Photo picker action here
                }) {
                    HStack {
                        Image(systemName: "photo.on.rectangle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Photos")
                    }
                    .foregroundColor(.blue)
                    .padding()
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
                }
                .padding(.top, 20)
                
                // White Card
                VStack(spacing: 0) {
                    // 1) Event Title
                    TextField("Event Title", text: $eventTitle)
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                    
                    Divider()
                    
                    // 2) Event Description
                    TextField("Event Description", text: $eventDescription)
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                    
                    Divider()
                    
                    // 3) Event Location
                    TextField("Event Location", text: $eventLocation)
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                    
                    Divider()
                    
                    // 4) Event Categories
                    TextField("Event Categories", text: $eventCategories)
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                    
                    Divider()
                    
                    // 5) Start Date
                    HStack {
                        Text("Start Date")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        DatePicker(
                            "",
                            selection: $startDate,
                            displayedComponents: .date
                        )
                        .labelsHidden()
                        .datePickerStyle(.compact)
                        .padding(8)
                        .cornerRadius(8)
                        
                        DatePicker(
                            "",
                            selection: $startTime,
                            displayedComponents: .hourAndMinute
                        )
                        .labelsHidden()
                        .datePickerStyle(.compact)
                        .padding(1)
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    // 6) End Date
                    HStack {
                        Text("End Date")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        DatePicker(
                            "",
                            selection: $endDate,
                            displayedComponents: .date
                        )
                        .labelsHidden()
                        .datePickerStyle(.compact)
                        .padding(8)
                        .cornerRadius(8)
                        
                        DatePicker(
                            "",
                            selection: $endTime,
                            displayedComponents: .hourAndMinute
                        )
                        .labelsHidden()
                        .datePickerStyle(.compact)
                        .padding(1)
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
                .padding(.horizontal, 16)
                
                Button("Add Event") {
                    
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGray6))
            .navigationTitle("Add Event")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    AddEventView()
}
