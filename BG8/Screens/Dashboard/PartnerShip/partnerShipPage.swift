//
//  partnerShipPage.swift
//  BG8
//
//  Created by Mac HD on 28/02/2025.
//

import SwiftUI


struct partnerShipPage: View {
    
    let features: [FeatureItem] = [
        FeatureItem(icon: "book.fill", title: "Elite Courses", description: "Access top golf courses worldwide."),
        FeatureItem(icon: "calendar", title: "VIP Events", description: "Invites to private tournaments."),
        FeatureItem(icon: "tag.fill", title: "Special Discount", description: "Lower fees for greens and gear."),
        
    ]
    
    let testimonials: [Testimonial] = [
        Testimonial(name: "Nathan Parkey", message: "My first golf trip with Epic exceeded all expectations. The concierge team made life so easy from a planning standpoint and they clearly have a great interview process for membership. Every member I met this week was a true pleasure to play golf with. Can't wait for next trip!"),
        Testimonial(name: "John Doe", message: "Epic golf trips are amazing! The organization, the courses, and the people made it a fantastic experience. Highly recommended for any golf lover."),
        Testimonial(name: "Sarah Lee", message: "From start to finish, the trip was flawless. The team at Epic knows how to create a luxurious and exciting experience. Already planning my next one!")
    ]
    var body: some View {
        ZStack{
            Image("image4").resizable().scaledToFill()
                .ignoresSafeArea()
            VStack {
                Spacer().frame(height: 70)
                Image("logo_white").resizable().frame(width: 80,height: 45) .scaledToFit()
                ScrollView {
                    VStack{
                                    epicGolfClubView()
                        Image("image3").resizable().frame(height: 200).padding()
                        VStack(alignment:.leading){
                            Text("Mambership Perks")
                                .font(.system(size: 20)).bold().padding(.top,12).foregroundColor(.white)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(features) { feature in
                                        VStack(alignment: .leading, spacing: 8) {
                                            Image(systemName: feature.icon)
                                                .font(.system(size: 24))
                                                .foregroundColor(.white)
                                            
                                            Text(feature.title)
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            
                                            Text(feature.description)
                                                .font(.subheadline)
                                                .foregroundColor(.white.opacity(0.8))
                                        }
                                        .padding()
                                        .background(GlassBackground())
                                        .cornerRadius(15)
                                        
                                    }
                                }
                            }
                            
                            Text("Testimonial")
                                .font(.system(size: 20)).bold().padding(.top,12).foregroundColor(.white)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(testimonials) { testimonials in
                                        VStack(alignment: .center, spacing: 8) {
                                            Image(systemName: "quote.opening") // Quote icon
                                                .font(.system(size: 24))
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity, alignment: .center)
                                            
                                            Text(testimonials.name)
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity, alignment: .center)
                                            
                                            Text("\"\(testimonials.message)\"")
                                                .font(.subheadline)
                                                .foregroundColor(.white.opacity(0.9))
                                                .italic()
                                                .multilineTextAlignment(.center)
                                        }
                                        .padding()
                                        .background(GlassBackground())
                                        .frame(width: 340, height: 200)
                                        .cornerRadius(15)
                                        
                                    }
                                }
                            }
                            
                        }.padding(.leading,16).padding(.bottom,100)
                        
                        
                    }
                }
            }
        }
    }
}


struct FeatureItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let description: String
}
struct Testimonial: Identifiable {
    let id = UUID()
    let name: String
    let message: String
}

#Preview {
    mainPage()
}

