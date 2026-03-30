//
//  homePage.swift
//  BG8
//
//  Created by Mac HD on 25/02/2025.
//

import SwiftUI

struct homePage: View {
    let golfExperiences = [
        GolfExperience(image: "image", title: "Unlock Exclusive", readTime: "4 min read", author: "John Carter"),
        GolfExperience(image: "image1", title: "Join Exclusive Golf", readTime: "4 min read", author: "John Carter"),
        GolfExperience(image: "image", title: "Play With Golf Pros", readTime: "4 min read", author: "John Carter"),
        GolfExperience(image: "image1", title: "Unlock VIP Golf", readTime: "4 min read", author: "John Carter"),
        GolfExperience(image: "image", title: "Discover New Golf", readTime: "4 min read", author: "John Carter"),
        GolfExperience(image: "image1", title: "Compete in Local", readTime: "4 min read", author: "John Carter"),
    ]
    let columns = [
        GridItem(.fixed(170))
    ]
    var body: some View {
        NavigationStack {
            VStack {
                Header(showBackButton: false)
                Spacer().frame(height: 16)
                ScrollView {
                    VStack {
                        ZStack(alignment: .bottomLeading) {
                            Image("image1")
                                .resizable()
                                .frame(height: 235)
                                .cornerRadius(12)
                                .padding(.horizontal, 26)
                            homeCard()
                        }.padding(.top, 10)
                        HStack {
                            NavigationLink(destination: mainPage())
                            {
                                InfoBadge(icon: "ball", text: "Play a Round")
                            }.buttonStyle(.plain)
                            NavigationLink(destination: mainPage(selectedTab: 1))
                            {
                            InfoBadge(icon: "courseIcon", text: "Golf Tips")
                            }.buttonStyle(.plain)
                        }.padding(.top, 20).padding(.leading, 20).padding(
                            .trailing,
                            20
                        )
                        HStack {
                            NavigationLink(destination: courseList(showBackBtn: true))
                            {
                                InfoBadge(icon: "routPin", text: "Courses ")}.buttonStyle(.plain)
                            
                            NavigationLink(destination: MultiplayerScorePage())
                            {
                            InfoBadge(icon: "ranking", text: "Previous Rounds")}.buttonStyle(.plain)
                        }.padding(.top, 5).padding(.leading, 20).padding(
                            .trailing,
                            20
                        )
                        HStack(alignment: .top, spacing: 16) {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Friends")
                                    .font(.headline)

                                FriendCard(
                                    image: "p2",
                                    name: "Sarah",
                                    course: "Torrey Pines",
                                    score: "81"
                                )

                                FriendCard(
                                    image: "p3",
                                    name: "Saif",
                                    course: "Torrey Pines",
                                    score: "81"
                                )

                                Spacer()
                            }

                            VStack(alignment: .leading, spacing: 12) {
                                Text("Recommended Course")
                                    .font(.headline)

                                VStack(alignment: .leading, spacing: 8) {
                                    Image("image1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 83)
                                        .clipped()
                                        .cornerRadius(12)

                                    Text("Pelican Hill")
                                        .font(
                                            .system(size: 14, weight: .semibold)
                                        )
                                    Divider().background(Color.green)
                                    Text("Available Tee Times")
                                        .font(
                                            .system(size: 12, weight: .medium)
                                        )
                                        .foregroundColor(.gray)

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("10:30 AM")
                                            .font(
                                                .system(
                                                    size: 12,
                                                    weight: .medium
                                                )
                                            )
                                        Text("11:00 AM")
                                            .font(
                                                .system(
                                                    size: 12,
                                                    weight: .medium
                                                )
                                            )
                                    }
                                }
                                .padding(8)
                                .background(Color.lightWhite)
                                .cornerRadius(16)

                                Spacer()
                            }
                        }.padding(.top, 15).padding(.leading, 20).padding(
                            .trailing,
                            20
                        )
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("News")
                                .font(.headline)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: columns, spacing: 15) {
                                    ForEach(golfExperiences) { experience in
                                        VStack(alignment: .leading) {
                                            Image(experience.image)
                                                .resizable()
                                                .frame(width: 170, height: 150) 
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                            
                                            Text(experience.title)
                                                .font(.headline)
                                                .foregroundColor(.black)
                                            
                                            HStack {
                                                Text(experience.readTime)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                                Text("•")
                                                    .foregroundColor(.gray)
                                                Text(experience.author)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        .frame(width: 170)
                                        .padding(.bottom, 20)
                                    }
                                }
                                .padding(.horizontal)
                            }
          
                        }.padding(.top, -15).padding(.leading, 20).padding(
                            .trailing,
                            20
                        ).padding(.bottom, 30)
                        Spacer().frame(height: 50)

                    }
                }
            }
        }
    }
}

struct FriendCard: View {
    let image: String
    let name: String
    let course: String
    let score: String

    var body: some View {
        HStack(spacing: 12) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack {
                Text(name)
                    .font(.system(size: 14, weight: .semibold))
                Divider().background(Color.green).padding(.top, -4)
                Text(course)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.gray).padding(.top, -8)
                Text(score)
                    .font(.system(size: 12, weight: .semibold)).padding(.top, 1)
            }

            Spacer()

        }
        .padding(6)
        .background(Color.lightWhite)
        .cornerRadius(12)
    }
}

#Preview {
mainPage()
}
