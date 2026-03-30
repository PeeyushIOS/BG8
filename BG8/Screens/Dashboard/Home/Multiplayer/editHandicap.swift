//
//  editHandicap.swift
//  BG8
//
//  Created by Mac HD on 11/03/2025.
//

import SwiftUI

struct editHandicap: View {

    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack {
                Rectangle()
                    .frame(width: 71, height: 5)
                    .foregroundColor(.gray.opacity(0.4))
                    .padding(.top, 15)
                Spacer()
                VStack(alignment:.leading){
                  
                    Text("Edit your Handicap").font(.title2).bold()
                    Text("Update and manage your handicap score with ease.")
                                  .font(.subheadline)
                                  .foregroundColor(.gray)
                                  .cornerRadius(8)
                    Spacer().frame(height: 20)
                    InputField(placeholder: "Handicap", text: .constant(""))
                    Spacer().frame(height: 40)
                        CommonButton(title: "Save", action: {
                            dismiss()
                        }, destination: {EmptyView()})
                  
                }
            }
            .background(Color.clear).padding(.leading,16).padding(.trailing,16)

        }}
    

      

}

#Preview {
    multiScoreCardPage()
}
