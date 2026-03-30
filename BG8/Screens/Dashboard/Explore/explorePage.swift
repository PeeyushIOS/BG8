//
//  explorePage.swift
//  BG8
//
//  Created by Mac HD on 24/02/2025.
//

import SwiftUI

struct explorePage: View {
    @State private var searchText = ""
    let golfExperiences = [
        GolfExperience(image: "image1", title: "Unlock Exclusive", readTime: "4 min read", author: "John Carter"),
        GolfExperience(image: "image1", title: "Join Exclusive Golf", readTime: "4 min read", author: "John Carter"),
        GolfExperience(image: "image1", title: "Play With Golf Pros", readTime: "4 min read", author: "John Carter"),
        GolfExperience(image: "image1", title: "Unlock VIP Golf", readTime: "4 min read", author: "John Carter"),
        GolfExperience(image: "image1", title: "Discover New Golf", readTime: "4 min read", author: "John Carter"),
        GolfExperience(image: "image1", title: "Compete in Local", readTime: "4 min read", author: "John Carter"),
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    var filteredExperiences: [GolfExperience] {
        if searchText.isEmpty {
            return golfExperiences
        } else {
            return golfExperiences.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                Header(showBackButton: false)
                
                Text("Explore")
                    .bold()
                    .font(.system(size: 22))
                    .padding(.leading).padding(.bottom,10).padding(.top,5)
                searchBarView(searchText: $searchText).padding(.bottom,10)
                categoryList()
                Spacer().frame(height: 5)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(filteredExperiences) { experience in
                            NavigationLink(destination: exploreDetailPage()) {
                                VStack(alignment: .leading) {
                                    Image(experience.image)
                                        .resizable()
//                                        .scaledToFill()
                                        .frame(height: 210)
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
                                .padding(.bottom, 20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    
}

#Preview {
    explorePage()
}


struct GolfExperience: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let readTime: String
    let author: String
}
