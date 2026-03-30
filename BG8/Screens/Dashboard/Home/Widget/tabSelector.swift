//
//  tapSelector.swift
//  BG8
//
//  Created by Mac HD on 26/02/2025.
//

import SwiftUI
 
struct tabSelector: View {
    @Binding var selectedTab: Int  // Binding to return the value

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: { selectedTab = 0 }) {
                    Text("Scorecard")
                        .fontWeight(selectedTab == 0 ? .bold : .regular)
                        .foregroundColor(selectedTab == 0 ? .black : .gray)
                        .frame(maxWidth: .infinity)
                }
                
                Button(action: { selectedTab = 1 }) {
                    Text("Round Details")
                        .fontWeight(selectedTab == 1 ? .bold : .regular)
                        .foregroundColor(selectedTab == 1 ? .black : .gray)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 8)
            
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: geometry.size.width / 2, height: 3)
                    .foregroundColor(.black)
                    .offset(x: selectedTab == 0 ? 0 : geometry.size.width / 2)
                    .animation(.easeInOut(duration: 0.2), value: selectedTab)
            }
            .frame(height: 3)
        }}
}

//#Preview {
//    tabSelector()
//}
