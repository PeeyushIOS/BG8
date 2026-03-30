//
//  scoreCard.swift
//  BG8
//
//  Created by Mac HD on 24/02/2025.
//

import SwiftUI

struct scoreCard: View {
    var body: some View {
        VStack{
            HStack(spacing : 0) {
                    Text("Hole1")
                    .font(.system(size: 20))
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                    Text("Hole2")
                    .font(.system(size: 20))
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                    Text("Hole3")
                    .font(.system(size: 20))
                        .foregroundColor(.white)
                        .bold()
       
                }
            Divider()
                .frame(height: 0.8)
                .background(Color.gray.opacity(0.3))
                .padding(.top, -5)

            HStack() {
                VStack {
                    Text("Par")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    .bold()
                    Text("4")
   
                        .foregroundColor(.white)
                    .bold()
                }
                Spacer()
                VStack {
                    Text("HCP")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    .bold()
                    Text("4")
   
                        .foregroundColor(.white)
                    .bold()
                }
                Spacer()
                VStack {
                    Text("Tee")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    .bold()
                    Text("44y")
   
                        .foregroundColor(.white)
                    .bold()
                }
            }.padding(.top,-5)
            
            
        }.padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
            .padding(.horizontal)
    }
}


#Preview {
    mainPage()
}
