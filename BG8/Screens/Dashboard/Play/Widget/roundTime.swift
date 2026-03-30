//
//  roundTime.swift
//  BG8
//
//  Created by Mac HD on 28/02/2025.
//

import SwiftUI

struct roundTime: View {
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Round")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                Text("2H 54M 58S")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .bold()
            }
            VStack{}.frame(width: 1,height: 40).background(Color.white)
            VStack(alignment: .trailing) {
                Text("Hole")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
                Text("8M 28S")
                    .font(.system(size: 15))
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .padding(.all,10)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color.black.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
        .padding(.horizontal)
        
    }
}
