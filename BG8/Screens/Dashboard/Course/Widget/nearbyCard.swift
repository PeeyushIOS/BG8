//
//  nearbyCard.swift
//  BG8
//
//  Created by Mac HD on 26/02/2025.
//

import SwiftUI

struct nearbyCard: View {
    var image  = "profile"
    var name  = "Chaak Bistro"
    var distance  = "432 m"
    var body: some View {
        VStack {
            Spacer().frame(height: 12)
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
            Spacer().frame(height: 12)
            HStack(spacing: 2) {
                ForEach(0..<5, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            Spacer().frame(height: 5)
            Text(name)
                .font(.headline)
                .foregroundColor(.black).padding(.bottom,2)
        
            HStack {
                Image("routPin").resizable()
                    .foregroundColor(.gray) .frame(width: 20, height: 20)
                Text(distance)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .frame(width: 150, height: 200)
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

#Preview {
    courseDetailPage()
}
