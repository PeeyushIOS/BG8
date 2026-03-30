//
//  SignInPage.swift
//  BG8
//
//  Created by Mac HD on 20/02/2025.
//
import UIKit
import SwiftUI




struct signInPage: View { 
    @State private var showSignUpSheet = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack() {
                Rectangle()
                    .frame(width: 71, height: 5)
                    .foregroundColor(.gray.opacity(0.4))
                    .padding(.top, 15)
                
                Text("Sign in to your account")
                
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
                    
                    InputField(placeholder: "Email/Username", text: .constant(""))
                    InputField(placeholder: "Password", text: .constant(""))
                    
                    
                    CommonButton(title: "Log In", action: {
                        print("Sign Up Pressed")
                        showAlert  = true
                        dismiss()
                         DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                             UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: mainPage())
                         }
                        
                    }, backgroundColor: .black, textColor: .white,      destination: {
                      
                        
                        EmptyView() } ).padding(.top,32)
                    
                    CommonButton(title: "Skip to Discover App", action: {
                        dismiss()
                        
                        
                    }, backgroundColor: .clear, textColor: .black, borderColor: .black,      destination: { EmptyView() } ).padding(.top,8)
                }
                .padding(.horizontal, 20)
                
                
                
                Text("Don’t have an account? **Sign up**")
                    .foregroundColor(.gray).onTapGesture {
                        showSignUpSheet.toggle()
                    }
            }
            
            .background(Color.clear)
            .cornerRadius(50)
            
            .sheet(isPresented: $showSignUpSheet) {
                signUpPage().presentationDetents([.fraction(0.85)]).presentationBackground(.white)
                .presentationCornerRadius(50).background(Color.white)}
            
        }}
}

#Preview {
    startPage()
}


