//
//  Comment.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import Foundation

struct Comment: Identifiable {
    let id = UUID()
    let name: String
    let postedTime: String
    let text: String
}
