//
//  radioButton.swift
//  BG8
//
//  Created by Mac HD on 26/02/2025.
//

import SwiftUI

struct radioButton: View {
    var text: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                Text(text)
                    .font(.body)
                    .foregroundColor(.black)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

