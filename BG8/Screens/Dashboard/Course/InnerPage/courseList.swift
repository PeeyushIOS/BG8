//
//  courseList.swift
//  BG8
//
//  Created by Mac HD on 25/02/2025.
//

import SwiftUI

struct courseList: View {
    
    var courseData: [CourseData]?
    var showBackBtn = false

 
    @State private var selectedOption = "Popular Courses"
    let options = ["Popular Courses", "Nearby Courses"]
    @State private var searchText = ""
    
    var filteredCourses: [CourseData] {
        guard let courseData else { return [] }
        
        if searchText.isEmpty {
            return courseData
        } else {
            return courseData.filter {
                $0.courseName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading){
                Header(showBackButton: showBackBtn)
                
                Text("Courses")
                    .bold()
                    .font(.system(size: 22))
                    .padding(.leading).padding(.bottom,10).padding(.top,5)
                searchBarView(searchText: $searchText).padding(.bottom,10)
                HStack {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                            .fontWeight(.medium)
                            .foregroundColor(selectedOption == option ? .white : .black)
                            .frame(maxWidth: .infinity, minHeight: 35)
                            .background(selectedOption == option ? Color.green : Color.clear)
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedOption = option
                            }
                    }
                }
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                .padding(.horizontal)
                ScrollView {
                    VStack {
                        ForEach(filteredCourses) { course in
                            courseCard(
                                course:course
                            )
                        }
                    }
                    .padding(.bottom,50)
                }
                
                
            } .navigationBarBackButtonHidden(true)
        }
    }
}
#Preview {
    coursePage()
}


