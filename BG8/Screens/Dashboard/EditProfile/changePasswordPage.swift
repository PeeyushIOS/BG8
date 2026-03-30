//
//  changePasswordPage.swift
//  BG8
//
//  Created by Mac HD on 28/02/2025.
//

import SwiftUI

struct changePasswordPage: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Header().frame(height: 50)
            VStack(alignment:.leading){
                Text("Change Password").bold().font(.title2)
                Spacer().frame(height: 8)
                Text("Choose a strong, unique password to keep your information safe.").font(.system(size: 14)).foregroundStyle(Color.gray)
                Spacer().frame(height: 16)
                InputField(placeholder: "Old Password", text: .constant(""))
                InputField(placeholder: "New Password", text: .constant(""))
                InputField(placeholder: "Confirm New Password", text: .constant(""))
                Spacer()
                CommonButton(title: "Update", action: {
                    dismiss()
                }, destination: {EmptyView()})
            }.padding()
        }.navigationBarHidden(true)
    }
}

#Preview {
    changePasswordPage()
}
