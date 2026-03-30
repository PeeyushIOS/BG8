//
//  courseCardView.swift
//  BG8
//
//  Created by Mac HD on 25/02/2025.
//

import SwiftUI

import SwiftUI

struct courseCardView: View {
    var title : String =  ""
    var image : String =  ""
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)

                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black).bold()
                    
                    HStack(spacing: 5) {
                        Text("15 miles away • 27 Par • 1,800 yards")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    HStack(spacing: 10) {
                        TimeSlotView(time: "10:00 AM")
                        TimeSlotView(time: "10:15 AM")
                        TimeSlotView(time: "11:00 AM")
                    }

                    HStack(spacing: 3) {
                        Text("4.9")
                            .font(.subheadline)
                            .bold()
                        Text("(132)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.caption)
                        }
                    }
                }
                Spacer()
            }
            .padding(.bottom, 5)
            
            HStack {
                CommonButton(title: "Course Details", action: {},borderColor: Color.black,height: 40, destination:{courseDetailPage()})
                CommonButton(title: "Play", action: {}, backgroundColor:Color.black,textColor: Color.white,height: 40, destination:{playerPage()})

            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

struct TimeSlotView: View {
    var time: String
    
    var body: some View {
        Text(time)
            .font(.system(size: 12))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(.systemGray6))
            .cornerRadius(5)
    }
}

#Preview {
    mainPage()
}

