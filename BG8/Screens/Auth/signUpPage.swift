//
//  signUpPage.swift
//  BG8
//
//  Created by Mac HD on 20/02/2025.
//

import SwiftUI

struct signUpPage: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack() {
            Rectangle()
                .frame(width: 71, height: 5)
                .foregroundColor(.gray.opacity(0.4))
                .padding(.top, 15)

            Text("Create your account")

                .font(.system(size: 24))
                .bold().padding(.top, 15)
            
            Text("Sign in to unlock your personalized golfing experience.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .font(.system(size: 16))
                .frame(maxWidth: .infinity)
                .padding(.top, 5)
                .padding(.horizontal, 25)

            

            
            VStack(alignment: .leading) {
              
                InputField(placeholder: "Name", text: .constant(""))
                InputField(placeholder: "User Name", text: .constant(""))
                InputField(placeholder: "Email", text: .constant(""))
                InputField(placeholder: "Password", text: .constant(""))
                
              
                CommonButton(title: "Sign up", action: {
                    print("Sign Up Pressed")
                }, backgroundColor: .black, textColor: .white,      destination: { EmptyView() } ).padding(.top,32)
                
                CommonButton(title: "Skip to Discover App", action: {
                    dismiss()
                }, backgroundColor: .clear, textColor: .black, borderColor: .black,      destination: { EmptyView() } ).padding(.top,8)
            }
            .padding(.horizontal, 20)
            
         
            
            Text("Already have an account? **Sign in**")
                .foregroundColor(.gray).onTapGesture {
                    dismiss()
                  
                }
        }

        .background(Color.clear)
        .cornerRadius(50)
        
    }
}



#Preview {
    signUpPage()
}
