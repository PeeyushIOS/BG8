//
//  courseCard.swift
//  BG8
//
//  Created by Mac HD on 25/02/2025.
//

import SwiftUI

struct courseCard: View {
    var course: CourseData
    
    let teeTimes = ["10:00 AM", "10:15 AM", "10:30 AM", "10:45 AM"]
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .topTrailing) {
                Image("image1")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedCorner(radius: 15, corners: [.topLeft, .topRight]))
                
                HStack {
                    Label("\(course.recommendRating ?? 0, specifier: "%.1f") (\(course.recommendRating))", systemImage: "star.fill")
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
            
            VStack(alignment: .leading, spacing: 8) {
                Text(course.courseName)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("\(course.address1), \(course.address2), \(course.city),")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    InfoBadge(icon: "courseIcon", text: "Par \("")")
                    InfoBadge(icon: "routPin", text: "Yards \("")")
                }
                HStack {
                    InfoBadge(icon: "clock", text: "Playtime \("")")
                    InfoBadge(icon: "pin", text: "\("") miles away")
                }
                
                HStack {
                    Text("All Tee Times")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Schedule a Round")
                            .foregroundColor(.green)
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(teeTimes, id: \.self) { time in
                            VStack {
                                Text(time)
                                    .fontWeight(.bold).font(.system(size: 14))
                                Text("$120-$90")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(width : 100, height: 50)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                        }
                    }
                }
                HStack {
                    CommonButton(title: "Course Details", action: {},backgroundColor: Color.clear,textColor: Color.black, destination: {courseDetailPage()})
                    CommonButton(title: "Play", action: {}, destination: {playerPage()})
               
                }.padding(.top,24)
            }
            .padding(.leading,20).padding(.trailing,20).padding(.bottom,20)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal).padding(.top,12)
    }
}


struct InfoBadge: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(icon).resizable().frame(width:18, height: 20)
            Spacer().frame(width:10)
            Text(text).font(.system(size: 14))
            Spacer()
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}


struct GolfCourse {
    var image: String
    var name: String
    var description: String
    var rating: Double
    var reviews: Int
    var par: Int
    var yards: Int
    var playtime: String
    var distance: Int
    var teeTimes: [String]
}

//#Preview {
//    courseList()
//}

#Preview {
    mainPage()
}
