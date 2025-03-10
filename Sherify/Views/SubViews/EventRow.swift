//
//  EventRow.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct EventRow: View {
    var title: String
    var date: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.body)
                .foregroundColor(.black)
            Text(date)
                .font(.caption)
                .foregroundColor(.gray)
            Divider()
        }
    }
}

#Preview {
    EventRow(title: "test title", date: "Date")
}
