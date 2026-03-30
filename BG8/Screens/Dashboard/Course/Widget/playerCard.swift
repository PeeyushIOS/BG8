//
//  playerCard.swift
//  BG8
//
//  Created by Mac HD on 26/02/2025.
//

import SwiftUI
struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let imageName: String
    var isSelected: Bool
}
struct playerList: View {
    @State private var contacts: [Contact] = [
        Contact(name: "Theresa Webb", email: "theresea12@gmail.com", imageName: "profile", isSelected: false),
        Contact(name: "Eleanor Pena", email: "eleanor01@mail.com", imageName: "profile", isSelected: false),
        Contact(name: "Arlene McCoy", email: "arlena1@gmail.com", imageName: "profile", isSelected: false),
        Contact(name: "Bessie Cooper", email: "cooper1@mail.com", imageName: "profile", isSelected: false),

    ]
    var body: some View {
        List {
            ForEach($contacts) { $contact in
                VStack {
                    HStack {
                        ZStack(alignment:.bottomTrailing) {
                            Image(contact.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            if contact.isSelected {
                                Image("check").resizable().frame(width: 20,height: 20)
                                    .padding(.trailing,-3)
                            }
                        }
                        Spacer().frame(width: 15)
                        VStack(alignment: .leading) {
                            Text(contact.name)
                                .font(.headline)
                            Text(contact.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()                    }
                    .padding(.vertical, 8)
                    .background(contact.isSelected ? Color(.systemGray6) : Color.clear)
                    .cornerRadius(10)
                    .onTapGesture {
                        contact.isSelected.toggle()
                    }
                    Divider()
                }.listRowSeparator(.hidden)
            }.padding(.top,-20)
        }
        .listStyle(PlainListStyle())
    }
}


#Preview {
    playerPage()
}
