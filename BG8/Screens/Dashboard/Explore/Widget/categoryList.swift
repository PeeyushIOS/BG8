//
//  categoryList.swift
//  BG8
//
//  Created by Mac HD on 24/02/2025.
//

import SwiftUI

struct categoryList: View {
    @State private var selectedCategory = "Events" // Default selected category
    
    let categories = ["Events", "Nate’s Corner", "Pro Tips", "Tour News"] // List of categories
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .font(.system(size: 16, weight: .medium))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(selectedCategory == category ? Color.green : Color.green.opacity(0.2))
                        .foregroundColor(selectedCategory == category ? .white : .black)
                        .clipShape(Capsule()) // Makes it pill-shaped
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
            .padding(.horizontal) // Adds some space on the sides
        }
    }
}

#Preview {
    mainPage()
}
