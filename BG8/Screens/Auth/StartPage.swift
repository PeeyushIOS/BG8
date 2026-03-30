//
//  StartPage.swift
//  BG8
//
//  Created by Mac HD on 20/02/2025.
//
import SwiftUI

struct startPage: View {
    @State private var showSignInSheet = false
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all) .navigationBarBackButtonHidden(true)
                VStack {
                    Spacer()
                    VStack(spacing: 15) {
                        CommonButton(
                            title: "Get Started",
                            action: {
                                showSignInSheet = true
                            },backgroundColor: Color.white,textColor: Color.black,
                            destination: { EmptyView() }
                        )
                        CommonButton(
                            title: "Skip",
                            action: { print("Skip tapped") },
                            backgroundColor: Color.clear,
                            textColor: Color.white,
                            borderColor: Color.white,
                            destination: { mainPage() }
                        )
                    }
                    .padding(.horizontal, 30)
                }
            }
            .sheet(isPresented: $showSignInSheet) {
                signInPage( ).presentationDetents([.fraction(0.63)]).presentationBackground(.white)
                    .presentationCornerRadius(50).background(Color.white)
            }
        }
    }
}

#Preview {
    startPage()
}
