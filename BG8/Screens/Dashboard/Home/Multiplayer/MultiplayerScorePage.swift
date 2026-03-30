//
//  MultiplayerScorePage.swift
//  BG8
//
//  Created by Mac HD on 26/02/2025.
//

import SwiftUI

struct MultiplayerScorePage: View {
    @State private var selectedTab = 0
    var body: some View {
        VStack {
            Header()
            ScrollView{
                VStack {
                    VStack{
                        Spacer().frame(height: 17)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Monarch Bay Golf Club (Tony Lema)")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("Played from the Black Tees • 7015 Total Yards •")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text("3h 44m • 74 Total Gross")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            HStack {
                                Text("Nate’s Handicap:")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Spacer()
                                Text("-12")
                                    .foregroundColor(.black)
                                
                                Image("pencil").resizable()
                                    .frame(width: 18,height: 18)
                            }
                        }
                        .padding()
                        .background(selectedTab == 0 ? Color(UIColor.systemGray6) : Color.green.opacity(0.1))
                        .cornerRadius(8)
                        Spacer().frame(height: 10)
                        expandableView()
                        Spacer().frame(height: 28)
                        tabSelector(selectedTab: $selectedTab)
                        Divider().padding(.top,-10)
                    }.padding(.horizontal)                }
                if selectedTab == 0  {
                    multiScoreCardPage()
                }else{
                    roundDetailPage()
                }
                
                
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    MultiplayerScorePage()
}


