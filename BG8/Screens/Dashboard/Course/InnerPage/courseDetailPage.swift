//
//  courseDetailPage.swift
//  BG8
//
//  Created by Mac HD on 26/02/2025.
//

import SwiftUI

struct courseDetailPage: View {
    @Environment(\.isTabBarHidden) var isTabBarHidden
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)
    let restaurants: [Restaurant] = [
        Restaurant(name: "Chaak Bistro", image: "profile", rating: 5, distance: "432 m"),
        Restaurant(name: "Snake Bite", image: "profile", rating: 5, distance: "432 m"),
        Restaurant(name: "Khanda Nai", image: "profile", rating: 5, distance: "432 m")
    ]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Header(showBackButton: true)
                Spacer().frame(height: 16)
                ScrollView {
                    VStack(alignment: .leading) {
                        ZStack(alignment: .top) {
                            Image("image2")
                                .resizable()
                                .frame(height: 250)
                            HStack {
                                Label("4.9 (132)", systemImage: "star.fill")
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(BlurEffect(style: .systemUltraThinMaterial))
                                    .cornerRadius(10)
                                Spacer()
                                Button(action: {}) {
                                    Image("bookMark")
                                        .resizable()
                                        .frame(width:20,height: 20)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(BlurEffect(style: .systemUltraThinMaterial))
                                        .cornerRadius(10)
                                }
                                
                                Button(action: {}) {
                                    Image("shareRight").resizable()
                                        .frame(width:20,height: 20)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(BlurEffect(style: .systemUltraThinMaterial))
                                        .cornerRadius(10)
                                }
                            }
                            .padding()
                        }
                        Spacer().frame(height: 16)
                        VStack(alignment:.leading) {
                            Text("Pebble Beach Short Course")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer().frame(height: 8)
                            Text("Set along the rugged coastline of Pebble Beach, California, this short course offers breathtaking views of the Pacific Ocean. With 9 scenic holes covering 1,000 yards, the Pebble Beach Short Course combines beauty with precision, making every shot unforgettable. Designed to cater to golfers of all levels, the course features smooth greens, challenging bunkers, and ocean-side fairways. It’s a must-play experience for anyone visiting Pebble Beach, providing a quick yet memorable round in just 2 hours.")
                                .font(.system(size: 15))
                                .padding(.bottom, 16).foregroundColor(.gray)
                            HStack {
                                InfoBadge(icon: "courseIcon", text: "Par \("course.par")")
                                InfoBadge(icon: "routPin", text: "Yards \("course.yards")")
                            }
                            HStack {
                                InfoBadge(icon: "clock", text: "Playtime ")
                                InfoBadge(icon: "pin", text: "miles away")
                            }
                            Spacer().frame(height: 32)
                            Text("All Tee Times")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            ScrollView() {
                                LazyVGrid(columns: columns, spacing: 7) {
                                    ForEach(0..<12, id: \.self) { _ in
                                        VStack {
                                            Text("10:00 AM")
                                                .font(.headline)
                                                .foregroundColor(.black).padding(.leading,-12).padding(.trailing,-12)
                                            Text("$124-$90")
                                                .font(.subheadline)
                                                .foregroundColor(.gray).padding(.leading,-12).padding(.trailing,-12)
                                        }
                                        .frame(width: 60, height: 35)
                                        .padding(.all,17)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                    }
                                }
                                
                            }.padding(.top,-10)
                            Spacer().frame(height: 32)
                            Text("Nearby Restaurants")
                                .font(.title2)
                                .fontWeight(.bold)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(restaurants) { restaurant in
                                        nearbyCard(name: restaurant.name,
                                                   distance: restaurant.distance
                                                   
                                        )
                                    }
                                }
                                
                            }.padding(.top,-10)
                            
                            Spacer().frame(height: 32)
                            Text("Nearby Hotels")
                                .font(.title2)
                                .fontWeight(.bold)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(restaurants) { restaurant in
                                        nearbyCard(name: restaurant.name,
                                                   distance: restaurant.distance
                                                   
                                        )
                                    }
                                }
                                
                            }.padding(.top,-10)
                            Spacer().frame(height: 32)
                            HStack{
                                CommonButton(title: "Preview Course", action: {
                                    dismiss()
                                },backgroundColor: Color.clear,textColor: Color.black, destination: {EmptyView()})
                                CommonButton(title: "Play", action: {}, destination: {mainPage()})
                            }
                            Spacer().frame(height: 32)
                        }.padding(.horizontal, 16)
                        
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom).navigationBarBackButtonHidden()
        }
        //        .onAppear {
        //            isTabBarHidden.wrappedValue = true
        //        }
        //        .onDisappear {
        //            isTabBarHidden.wrappedValue = false
        //        }
    }}

#Preview {
    courseDetailPage()
}

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let rating: Int
    let distance: String
}
