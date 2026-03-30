//
//  epicGolfClubView.swift
//  BG8
//
//  Created by Mac HD on 11/03/2025.
//

import SwiftUI

struct epicGolfClubView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                Text("Unlock Exclusive Perks with the Epic Golf Club Partnership!")
                    .font(.system(size: 20)).bold()
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.top)
                
       
                Image("egc")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                Text("EPIC GOLF CLUB")
                    .font(.system(size: 20)).bold()
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                // Description
                Text("A private golf society that allows people who share a passion for golf to play the best private golf courses in the world together. Members of Epic Golf Club have the opportunity to play at over a thousand private clubs around the world.")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .padding(.leading,16)
                    .padding(.trailing,16)
                    .foregroundColor(.white)
                  
                    .cornerRadius(20)
                
                // Statistics Section
                HStack() {
                    StatView(number: "9", label: "Countries")
                    Spacer()
                    StatView(number: "40+", label: "US States")
                    Spacer()
                    StatView(number: "1,000+", label: "Golf Clubs")
                }.padding(.horizontal,30)
      
    
                Text("Our Partners")
                    .font(.headline).bold().padding(.top,12)
                HStack(spacing: 15) {
                        PartnerLogoView(imageName: "black_circle")
                        PartnerLogoView(imageName: "noco")
                        PartnerLogoView(imageName: "another_partner")
                        PartnerLogoView(imageName: "money_maker")
                        PartnerLogoView(imageName: "revo")
                    }
              
             
                HStack {
                    Image(systemName: "info.circle").foregroundColor(Color.white)
                    Text("Must be a member of a private club to join.")
                        .font(.footnote).foregroundColor(Color.white)
                }.padding(.top)
                HStack(spacing: 20) {
                    CommonButton(title: "Learn More", action: {},backgroundColor: Color.clear, borderColor: Color.white,cornerRadius: 10, destination: {EmptyView()})
                    CommonButton(title: "Join Now", action: {},backgroundColor: Color.white,textColor: Color.green, borderColor: Color.white,cornerRadius: 10, destination: {EmptyView()})
                   
                }
                .padding() .padding(.leading,10).padding(.trailing,10).padding(.bottom,5)
            }
            .background(GlassBackground())
            .cornerRadius(30)
            .padding()
        }
    }
}


struct StatView: View {
    let number: String
    let label: String
    
    var body: some View {
        VStack {
            Text(number)
                .font(.system(size: 20))
                .bold().foregroundStyle(Color.white)
            Text(label)
                .font(.footnote)
                .foregroundStyle(Color.white)
        }
        .frame(width: 100, height: 66)
        .background(GlassBackground())
        .cornerRadius(10) .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}

struct PartnerLogoView: View {
    let imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
              
        
        }.frame(width: 60, height: 60).background(Color.white.opacity(0.1))    .cornerRadius(10)
    }
}




#Preview {
    partnerShipPage()
}
