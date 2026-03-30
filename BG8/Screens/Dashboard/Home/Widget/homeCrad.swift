//
//  homeCrad.swift
//  BG8
//
//  Created by Mac HD on 25/02/2025.

import SwiftUI

struct homeCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Monarch Bay Golf Club (Tony Lema)")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.white)

                    Text(
                        "Played from the Black Tees | 7015 Total Yards | 3h44m"
                    )
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.white.opacity(0.8))
                }
                Spacer()
                VStack {
                    Text("74")
                        .font(.system(size: 12, weight: .bold))

                        .foregroundColor(.white)
                    Text("Total")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(8)
                .background(Color.white.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }.padding(.top, 12).padding(.leading, 10)
                .padding(.trailing, 10)

            HStack {
                VStack {
                    ScoreTextRow(title: "Hole")
                    ScoreTextRow(title: "Pars")
                    ScoreTextRow(title: "Shots")
                    ScoreTextRow(title: "Score")
                }
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ScoreRow(
                            values: [
                                "1", "2", "3", "4", "5", "6", "7", "9", "10",
                                "11", "12", "13", "14", "15", "16", "17", "18",
                            ],
                            isHeader: true
                        )
                        ScoreRow(values: [
                            "1", "2", "3", "4", "5", "6", "7", "9", "10", "11",
                            "12", "13", "14", "15", "16", "17", "18",
                        ], )
                        ScoreRow(values: [
                            "1", "2", "3", "4", "5", "6", "7", "9", "10", "11",
                            "12", "13", "14", "15", "16", "17", "18",
                        ], )
                        ScoreRow(values: [
                            "1", "2", "3", "4", "5", "6", "7", "9", "10", "11",
                            "12", "13", "14", "15", "16", "17", "18",
                        ], )
                    }

                }
                VStack {
                    ScoreTotalRow(total: "72")
                    ScoreTotalRow(total: "72")
                    ScoreTotalRow(total: "72")
                    ScoreTotalRow(total: "72")
                }
            }.padding(.top, 0).padding(.leading, 20)
                .padding(.trailing, 20)

                .frame(height: 140)

        }
        .background(

            Color.white.opacity(0.0)
                .background(.ultraThinMaterial)
                .blur(radius: 0.3)
        )
        .frame(maxWidth: .infinity)

        .cornerRadius(10)
        .padding(.horizontal, 40).padding(.bottom, 15)

        //        ZStack {
        //
        //            RoundedRectangle(cornerRadius: 15)
        //                .fill(Color.white.opacity(0.2))
        //                .background(BlurEffect(style: .systemUltraThinMaterial))
        //                .clipShape(RoundedRectangle(cornerRadius: 15))
        //                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
        //                .padding(.horizontal)
        //                .frame(height:200)
        //                .padding(.horizontal, 20)
        //                .padding(.bottom, 10)
        //
        //            VStack(alignment: .leading, spacing: 2) {
        //                HStack {
        //                    VStack(alignment: .leading) {
        //                        Text("Monarch Bay Golf Club (Tony Lema)")
        //                            .font(.headline)
        //                            .bold()
        //                            .foregroundColor(.white)
        //
        //                        Text("Played from the Black Tees | 7015 Total Yards | 3h44m")
        //                            .font(.subheadline)
        //                            .foregroundColor(.white.opacity(0.8))
        //                    }
        //                    Spacer()
        //                    VStack {
        //                        Text("74")
        //                            .font(.title)
        //                            .bold()
        //                            .foregroundColor(.white)
        //                        Text("Total")
        //                            .font(.caption)
        //                            .foregroundColor(.white.opacity(0.8))
        //                    }
        //                    .padding(10)
        //                    .background(Color.white.opacity(0.2))
        //                    .clipShape(RoundedRectangle(cornerRadius: 10))
        //                }
        //
        //                ScrollView([.horizontal, .vertical], showsIndicators: true) {
        //                    VStack(alignment: .leading) {
        //                        ScoreRow(title: "Hole", values: ["1", "2", "3", "4", "5", "6", "7","9","10","11","12","13","14","15","16","17","18"], isHeader: true)
        //                        ScoreRow(title: "Pars", values: ["1", "2", "3", "4", "5", "6", "7","9","10","11","12","13","14","15","16","17","18"], total: "72")
        //                        ScoreRow(title: "Shots", values: ["1", "2", "3", "4", "5", "6", "7","9","10","11","12","13","14","15","16","17","18"], total: "71")
        //                        ScoreRow(title: "Score", values: ["1", "2", "3", "4", "5", "6", "7","9","10","11","12","13","14","15","16","17","18"], total: "-1")
        //                    }
        //                    .padding(.top, 1)
        //                }
        //            }
        //            .padding(.horizontal, 45)
        //        }
    }
}

struct ScoreRow: View {

    var values: [String]

    var isHeader: Bool = false
    var color: Color = .white
    

    var body: some View {
        HStack {
            ForEach(values, id: \.self) { value in
                Text(value)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(color)
                    .frame(minWidth: 25).padding(.top, 5)
            }

        }
    }
}

struct ScoreTextRow: View {
    var title: String
    var color: Color = .white
    var width: Double = 50
    var body: some View {
        Text(title)
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(color)
            .frame(width: width, alignment: .leading).padding(.top, 5)

    }
}
struct ScoreTotalRow: View {
    var total: String? = nil
    var body: some View {
        Text(total ?? "")
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 22, alignment: .trailing).padding(.top, 5)
    }
}

#Preview {
    homePage()
}
