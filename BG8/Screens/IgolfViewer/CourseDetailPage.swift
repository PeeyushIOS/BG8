import SwiftUI

struct CourseDetailPage: View {
    let course: CourseData
    @StateObject private var courseData = CourseCall()
    @Environment(\.dismiss) var dismiss
    
//    private var whiteTeeYardage: String? {
//        guard let tees = courseData.teeDetails?.teesList,
//              let whiteTee = tees.first(where: { $0.teeName.lowercased() == "white" }) else {
//            return nil
//        }
//        return whiteTee.ydsTotal.formatted(.number)
//    }
    private var whiteTeeYardage: String? {
        guard let tees = courseData.teeDetails?.teesList,
              let firstTee = tees.first else {
            return nil
        }
        return firstTee.ydsTotal.formatted(.number)
    }
    
    private var totalPar: Int? {
        guard let parHole = courseData.scorecard?.menScorecardList.first?.parHole else {
            return nil
        }
        return parHole.reduce(0, +)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // ... (existing header)
            
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                
                Text("Course Details")
                    .font(.headline)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(uiColor: .systemBackground))
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(course.courseName)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                            Text("\(course.city), \(course.stateShort ?? ""), \(course.countryShort)")
                                .font(.headline)
                        }
                        .foregroundColor(.secondary)
                        
                        Text(course.address1)
                            .font(.subheadline)
                        
                        Divider()
                        
                        HStack(spacing: 40) {
                            VStack(alignment: .center) {
                                Text("Holes")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("\(course.layoutHoles)")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            
                            VStack(alignment: .center) {
                                Text("Rating")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                HStack(spacing: 4) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    Text("\((course.conditionRating ?? 0).formatted(.number.precision(.fractionLength(1))))")
                                }
                                .font(.title3)
                                .fontWeight(.semibold)
                            }
                            
                            VStack(alignment: .center) {
                                Text("Type")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(course.classification ?? "Public")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        
                        Divider()
                        
                        if whiteTeeYardage != nil || totalPar != nil {
                            HStack(spacing: 24) {
                                if let yardage = whiteTeeYardage {
                                    HStack(spacing: 4) {
                                        Text("Total Yardage:")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text("\(yardage)")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary)
                                    }
                                }
                                
                                if let par = totalPar {
                                    HStack(spacing: 4) {
                                        Text("Total Par:")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text("\(par)")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .padding(.vertical, 4)
                            
                            Divider()
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("About the Course")
                                .font(.headline)
                            Text("Welcome to \(course.courseName). This beautiful \(course.layoutHoles)-hole course is situated in \(course.city). Explore the course using our advanced 360 viewer.")
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer(minLength: 30)
                        
                        NavigationLink(destination: CourseView(
                            courseID: course.idCourse,
                            showBackButton: true,
                            scorecard: courseData.scorecard,
                            gpsData: courseData.gpsData,
                            vectorData: courseData.vectorData,
                            teeDetails: courseData.teeDetails,
                            totalHoles: course.layoutHoles
                        )
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        .toolbar(.hidden, for: .navigationBar)
                        ) {
                            if courseData.isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Text("Open iGolf Viewer")
                                    .font(.headline)
                            }
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(courseData.isLoading ? Color.blue.opacity(0.7) : Color.blue)
                        .cornerRadius(12)
                        .disabled(courseData.isLoading)
                        .padding(.bottom, 20)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .navigationTitle("")
        .task {
            courseData.isLoading = true
            async let scorecardTask: () = courseData.fetchScorecard(idCourse: course.idCourse)
            async let gpsTask: () = courseData.fetchGPS(idCourse: course.idCourse)
            async let vectorTask: () = courseData.fetchVectorGPS(idCourse: course.idCourse)
            async let teeDetailsTask: () = courseData.fetchTeeDetails(idCourse: course.idCourse)
            _ = await [scorecardTask, gpsTask, vectorTask, teeDetailsTask]
            courseData.isLoading = false
        }
    }
}
#Preview {
    CourseListScreen()
}
