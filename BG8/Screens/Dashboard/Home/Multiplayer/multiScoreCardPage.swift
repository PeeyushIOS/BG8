//
//  multiScoreCardPage.swift
//  BG8
//
//  Created by Mac HD on 26/02/2025.
//

import SwiftUI


struct Player: Identifiable {
    let id = UUID()
    let name: String
    let handicap: Int
    let image: String
    let scores: [Int]
    let par: [Int]
    let hcp: [Int]
}

struct multiScoreCardPage: View {
    @State private var expandedPlayer: UUID? = nil
    @State private var showScoreSheet = false
    let players: [Player] = [
        Player(name: "Nate", handicap: -12, image: "profile", scores: [9, 6, 7, 4, 5, 3, 1], par: [2, 4, 3, 3, 5, 4, 2], hcp: [1, 3, 4, 4, 5, 3, 2]),
        Player(name: "Simmons", handicap: -12, image: "p1", scores: [9, 6, 7, 4, 5, 3, 1], par: [2, 4, 3, 3, 5, 4, 2], hcp: [1, 3, 4, 4, 5, 3, 2]),
        Player(name: "Jane", handicap: -12, image: "p2", scores: [9, 6, 7, 4, 5, 3, 1], par: [2, 4, 3, 3, 5, 4, 2], hcp: [1, 3, 4, 4, 5, 3, 2]),
        Player(name: "Sophia", handicap: -12, image: "p3",scores: [9, 6, 7, 4, 5, 3, 1], par: [2, 4, 3, 3, 5, 4, 2], hcp: [1, 3, 4, 4, 5, 3, 2])
    ]
    


    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(players) { player in
                    VStack {
                        HStack {
                            Image(player.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())

                            VStack(alignment: .leading) {
                                Text(player.name)
                                    .font(.headline)

                                Text("Played from black tees")
                                    .font(.subheadline)
                                    .foregroundColor(.gray) + Text("• Handicap \(player.handicap)") .font(.subheadline)
                               
                            }
                            Image("pencil").resizable().frame(width: 20,height: 20).onTapGesture {
                                showScoreSheet.toggle()
                            }
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    expandedPlayer = expandedPlayer == player.id ? nil : player.id
                                }
                            }) {
                                Image(systemName: expandedPlayer == player.id ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.gray)
                            }
                          
                        }

                        if expandedPlayer == player.id {
                            HStack {
                                VStack {
                                    ScoreTextRow(title: "Hole", color: .black,width : 100)
                                    Divider().background(Color.green.opacity(0.5)).frame(width:100, )
                                    ScoreTextRow(title: "Par", color: .black,width : 100)
                                    Divider().background(Color.green.opacity(0.5)).frame(width:100, )
                                    ScoreTextRow(title: "HCP", color: .black,width : 100)
                                    Divider().background(Color.green.opacity(0.5)).frame(width:100, )
                                    ScoreTextRow(title: "Shot (Gross)", color: .black,width : 100)
                                    Divider().background(Color.green.opacity(0.5)).frame(width:100, )
                                    ScoreTextRow(title: "Net (w/HCP)", color: .black,width : 100)
                                }
                                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                                    VStack(alignment: .leading) {
                                        ScoreRow(
                                            values: [
                                                "1", "2", "3", "4", "5", "6", "7", "9", "10",
                                                "11", "12", "13", "14", "15", "16", "17", "18",
                                            ],
                                          color: .black,
                                        )
                                        Divider().background(Color.green.opacity(0.5))
                                        ScoreRow(values: [
                                            "1", "2", "3", "4", "5", "6", "7", "9", "10", "11",
                                            "12", "13", "14", "15", "16", "17", "18",
                                        ],  color: .black, )
                                        Divider().background(Color.green.opacity(0.5))
                                        ScoreRow(values: [
                                            "1", "2", "3", "4", "5", "6", "7", "9", "10", "11",
                                            "12", "13", "14", "15", "16", "17", "18",
                                        ],   color: .black,)
                                        Divider().background(Color.green.opacity(0.5))
                                        ScoreRow(values: [
                                            "1", "2", "3", "4", "5", "6", "7", "9", "10", "11",
                                            "12", "13", "14", "15", "16", "17", "18",
                                        ],  color: .black, )
                                        Divider().background(Color.green.opacity(0.5))
                                        ScoreRow(values: [
                                            "1", "2", "3", "4", "5", "6", "7", "9", "10", "11",
                                            "12", "13", "14", "15", "16", "17", "18",
                                        ],   color: .black,)
                                    }

                                }
                                
                
                            }
                          
//                            ScorecardView(player: player)
//                                .padding(.top, 5)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(expandedPlayer == player.id ? Color.green.opacity(0.1) : Color.gray.opacity(0.1))
                    .cornerRadius(8)

                    Divider()
                }
            }
            .padding(.horizontal)
        }.sheet(isPresented: $showScoreSheet) {
            editHandicap().presentationDetents([.fraction(0.4)]).presentationBackground(.white)
            .presentationCornerRadius(50).background(Color.white)}
    }
}

// MARK: - Scorecard View
struct ScorecardView: View {
    let player: Player

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Hole").bold() .frame(maxWidth: .infinity, alignment: .leading)
  
                ForEach(1...player.scores.count, id: \.self) { index in
                 
                        Text("\(index)") .frame(maxWidth: .infinity)
                    
                }
            }
            Divider().background(Color.green.opacity(0.5))
            HStack {
                Text("Par").bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(player.par, id: \.self) { score in
                    Text("\(score)")
                        .frame(maxWidth: .infinity)
                }}
            Divider()
            HStack {
                Text("HCP").bold().frame(maxWidth: .infinity, alignment: .leading)
             
                ForEach(player.hcp, id: \.self) { hcp in
                
                        Text("\(hcp)") .frame(maxWidth: .infinity)
                    
                }
            }
            Divider()
            HStack {
                Text("Shots").bold() .frame(maxWidth: .infinity, alignment: .leading)

                ForEach(player.scores, id: \.self) { score in
                
                        Text("\(score)") .frame(maxWidth: .infinity)
                    
                }
            }
        }

        
    }
}

#Preview {
    multiScoreCardPage()
}
