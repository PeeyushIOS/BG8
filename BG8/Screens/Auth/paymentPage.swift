//
//  payment.swift
//  BG8
//
//  Created by Mac HD on 30/04/2025.
//
import SwiftUI

struct PaymentPage: View {
    @State var isPresented: Bool
    @State private var selectedOption = "Monthly"
    let options = ["Monthly", "Annualy"]

    
    var body: some View {
    
            if isPresented {
            ScrollView {
                VStack{
                    ZStack {
                        
                        HStack {
                            Spacer()
                            Image("logo")
                                .resizable()
                                .frame(width: 100, height: 50)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Button(action: {
                                isPresented = false
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.primary)
                                    .font(.title2)
                                    .padding(8)
                            }
                        }
                    }
                    .padding(.top , 5)
                    .padding(.trailing , 5)
                    .navigationBarBackButtonHidden(true)
                    
                    Spacer().frame(height:25)
                    Text("Get The Most Out Of BG8").font(.system(size: 20)).foregroundColor(Color.black)
                    
                    Text("Upgrade Today!").font(.system(size: 17)).foregroundColor(Color.green)
                    Spacer().frame(height: 16)
                    Text("Thank You for Using the BG8 App!").font(.system(size: 22)).foregroundColor(Color.black)
                    Spacer().frame(height: 10)
                    Text("We hope you're enjoying the Free Version.").font(.system(size: 14)).foregroundColor(Color.black)
                    Spacer().frame(height: 30)
                    HStack {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                                .fontWeight(.medium)
                                .foregroundColor(selectedOption == option ? .white : .black)
                                .frame(maxWidth: .infinity, minHeight: 35)
                                .background(selectedOption == option ? Color.green : Color.clear)
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedOption = option
                                }
                        }
                    }
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    .padding(.horizontal)
                    Spacer().frame(height: 20)
                    SubscriptionCard(
                        title: "BG8 Member",
                        price: "$9.99",
                        buttonText: "Become a BG8 Member",
                        features: [
                            "Track your Ball Live",
                            "Shot by Shot Tracking",
                            "Exclusive Tips and Insights from a Scratch Golfer",
                            "Data Analysis on Your Play"
                        ],
                        accentColor: .green
                    ).padding()
                    SubscriptionCard(
                        title: "BG8X Premium Member",
                        price: "$29.99",
                        buttonText: "Unlock BG8X",
                        features: [
                            "All BG8 Member features",
                            "Easy Tee-Time Scheduling",
                            "Video Library",
                            "Advanced Analytics Tools to Improve Your Score",
                            "Nearby Restaurants and Hotels"
                        ],
                        accentColor: .green
                    )
                    .padding()
                    Text("Become a Member to Unlock Exclusive Features and Maximize Your Results!").font(.system(size: 15)).foregroundColor(Color.gray).multilineTextAlignment(.center).padding(.all)
                    CommonButton(title: "Unlock Exclusive Features", action: {},backgroundColor: Color.black,textColor: Color.white, destination: {EmptyView()}).padding(.horizontal,20)
                    Spacer()
                }
            }.background(.white)
        }
        
    }
}
struct SubscriptionCard: View {
    let title: String
    let price: String
    let buttonText: String
    let features: [String]
    let accentColor: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            HStack{
                VStack(alignment: .leading){
                    Text(title)
                        .font(.system(size: 22, weight: .light))
                        .foregroundColor(.black)
                    Spacer().frame(height: 8)
                    HStack {
                        Text(price)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.black)
                        Text("/ Month")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer().frame(height: 8)
                    Text(buttonText)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(accentColor)
                 
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Features:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    ForEach(features, id: \.self) { feature in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                            Text(feature)
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                }
                
            }
         

        
      
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}


#Preview {
    mainPage()
}

