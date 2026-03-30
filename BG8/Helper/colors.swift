//
//  colors.swift
//  IREP
//
//  Created by Mac HD on 03/07/2025.
//

import SwiftUI

extension Color {
    static let lightWhite = Color(hex: "#FCFCFC")
    static let green = Color(hex: "#04B44C")

}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // skip leading #
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
