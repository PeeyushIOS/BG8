//
//  playerPage.swift
//  BG8
//
//  Created by Mac HD on 26/02/2025.
//

import SwiftUI

struct playerPage: View {
    @State private var searchText = ""
    var body: some View {
        VStack{
            Header().padding(.bottom,10)
searchBarView(searchText: $searchText)
            Spacer().frame(height: 20)
       playerList()
            CommonButton(title: "Play", action: {}, destination: {mainPage()}).padding(15)
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    playerPage()
}
