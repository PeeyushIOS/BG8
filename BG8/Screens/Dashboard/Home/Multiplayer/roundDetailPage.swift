//
//  roundDetailPage.swift
//  BG8
//
//  Created by Mac HD on 26/02/2025.
//

import SwiftUI

struct roundDetailPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            DoubleText()
            Spacer().frame(height: 16)
            DoubleText(text1: "Putts", text2: "Bunker Shots")
            Spacer().frame(height: 16)
            DoubleText(text1: "Penalities", text2: "Chips")
            
            VStack(alignment: .leading){
                Text("Recommendation").font(.title2).bold()
                Text("Your driving was excellent and your approach shots were great on the Par 4’s. Although you putted quite well for the average golfer that is your biggest area of improvement. We recommend some videos to help you.").foregroundStyle(Color.gray)
                Image("image3").resizable().frame(height: 200).cornerRadius(12)
                
            }      .padding() .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3), lineWidth: 1))
        }
        .padding()
    }
}

struct DoubleText: View {
    var text1: String = "Fairways Hit"
    var text2: String = "Greens in Regulations"
    var dec1: String = "12"
    var dec2: String = "12"

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(text1)
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 18))
                Spacer().frame(height: 6)
                Text(dec1)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading) {
                Text(text2)
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 18))
                Spacer().frame(height: 6)
                Text(dec2)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    roundDetailPage()
}


