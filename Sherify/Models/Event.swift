//
//  Event.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import Foundation

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let dateLine1: String
    let dateLine2: String
    let description: String
    let imageName: String
}
