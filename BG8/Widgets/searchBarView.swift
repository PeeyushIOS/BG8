//
//  searchBarView.swift
//  BG8
//
//  Created by Mac HD on 24/02/2025.
//

import SwiftUI

struct searchBarView: View {
    @Binding var searchText: String
    var backgroundColor: Color = Color(.systemGray6)
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
                    .foregroundColor(.black)
            }
            .padding(12)
            .background(backgroundColor)
            .cornerRadius(25)
            .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
            
            HStack {
                Button(action: {
                    print("Filter button tapped")
                }) {
                    Image("filter")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                }
            }
            .padding(12)
            .background(backgroundColor)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
        }
        .padding(.horizontal)
    }
}
