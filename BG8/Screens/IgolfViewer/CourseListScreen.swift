import SwiftUI

struct CourseListScreen: View {
    @StateObject private var courseData = CourseCall()
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(courseData.courses) { course in
                    NavigationLink(destination: CourseDetailPage(course: course)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        .toolbar(.hidden, for: .navigationBar)
                    ) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(course.courseName)
                                .font(.headline)
                            Text("\(course.address1), \(course.city), \(course.otherState ?? ""), \(course.countryShort)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack(spacing: 16) {
                                Label(
                                    "Condition: \((course.conditionRating ?? 0).formatted(.number.precision(.fractionLength(1))))",
                                    systemImage: "star"
                                )
                                    .font(.caption)
                                Label(
                                    "Recommended: \((course.recommendRating ?? 0).formatted(.number.precision(.fractionLength(1))))",
                                    systemImage: "star.fill"
                                ) .font(.caption)
                           
                            }
                        }.padding(.vertical, 8)
                    }
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                    .toolbar(.hidden, for: .navigationBar)
                    .onAppear {
                        if course == courseData.courses.last {
                            Task {
                                await courseData.fetchCourses()
                            }
                        }
                    }
                }
                
                if courseData.isLoading {
                    VStack {
                        Spacer()
                        ProgressView(courseData.courses.isEmpty ? "Loading Courses..." : "Loading More...")
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                        if courseData.courses.isEmpty { Spacer() }
                    }
                }
            }
            .navigationTitle("Courses")
            .task {
                await courseData.fetchCourses()
            }
            .alert("Error", isPresented: .init(get: { courseData.errorMessage != nil }, set: { _ in courseData.errorMessage = nil })) {
                Button("OK", role: .cancel) { }
            } message: {
                if let message = courseData.errorMessage {
                    Text(message)
                }
            }
        }
    }
}

#Preview {
    CourseListScreen()
}
