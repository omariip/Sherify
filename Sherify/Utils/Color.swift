//
//  Color.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let red, green, blue, alpha: Double
        switch hex.count {
        case 6: // RGB (without alpha)
            red   = Double((int >> 16) & 0xFF) / 255
            green = Double((int >> 8) & 0xFF) / 255
            blue  = Double(int & 0xFF) / 255
            alpha = 1.0
        case 8: // RGBA (with alpha)
            red   = Double((int >> 24) & 0xFF) / 255
            green = Double((int >> 16) & 0xFF) / 255
            blue  = Double((int >> 8) & 0xFF) / 255
            alpha = Double(int & 0xFF) / 255
        default:
            red = 0; green = 0; blue = 0; alpha = 1
        }

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}

