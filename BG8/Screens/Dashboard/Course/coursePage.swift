//
//  coursePage.swift
//  BG8
//
//  Created by Mac HD on 25/02/2025.
//

import SwiftUI

struct coursePage: View {
    @StateObject private var courseData = CourseCall()
  @State  var showList = false
    
    
    var body: some View {

            ZStack(alignment:.bottom){
                if showList == false{
                    mapPage()
//                    courseList(courseData: courseData.courses)
                }else{
                    courseList(courseData: courseData.courses)
                }
              
                HStack {
                    Spacer().frame(width: 20)
                    Text(showList == false ? "Show List" : "Show Map")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                    Spacer()
                    Image(showList == false ? "menu" : "map1")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Spacer().frame(width: 20)
                }
                .frame(width: 160, height: 50)
                .background(Color(red: 4/255, green: 180/255, blue: 76/255))
                .cornerRadius(25).padding(.bottom,showList ? 40 : 240)
                .onTapGesture {
                    
                    showList.toggle()
                }

            }.onAppear {
//                if account == accountData.accounts.last
//                    && !accountData.isFetching
//                {
//                    Task {
//                        await accountData.fetchAccounts()
//                    }
//                }
                Task {
                    print("Hello")
                    await courseData.fetchCourses()
                }
            }
    }
}

#Preview {
    mainPage()
}


