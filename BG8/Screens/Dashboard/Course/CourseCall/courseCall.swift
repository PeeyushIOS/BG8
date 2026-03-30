//
//  courseCall.swift
//  BG8
//
//  Created by Mac HD on 10/03/2026.
//

import SwiftUI

class CourseCall: ObservableObject {
    @Published var courses: [CourseData] = []
    @Published var scorecard: ScorecardModel? = nil
    @Published var gpsData: GPSModel? = nil
    @Published var vectorData: VectorGPSModel? = nil
    @Published var teeDetails: TeeDetailsModel? = nil
    @Published var isLoading = false
    @Published var isLoadingDelete = false
    @Published var errorMessage: String? = nil

    private var currentPage = 1
    private let itemsPerPage = 100
    private let maxPages = 5
    private var totalPages = 1
    var isFetching = false
    private var isResetting = false
    private var fetchTask: Task<Void, Never>? = nil
    var searchQuery: String = ""

    @MainActor
    func fetchCourses(reset: Bool = false) async {
        if isFetching { return }

        if reset {
            currentPage = 1
            totalPages = 1
            courses = []
            isResetting = true
        }

        guard currentPage <= min(totalPages, maxPages) else { return }

        isFetching = true
        isLoading = true
        errorMessage = nil
        
        let body = getCourseBody(
            active: 1,
            id_country: 840,
            page: currentPage,
            resultsPerPage: itemsPerPage,
            countryFormat: 4,
            stateFormat: 4,
     
        )

        fetchTask = Task {
            do {
                print("DO task")
//                let encodedQuery =
//                    searchQuery.addingPercentEncoding(
//                        withAllowedCharacters: .urlQueryAllowed
//                    ) ?? ""
                let endpoint = IGolfSignatureHelper.generateSignedPath(for: "CourseList")

                let response = try await HTTPClient.request(
                    endPoint: endpoint,
                    method: .POST,
                    body: body,
                    responseType: CourseModel.self
                )
                
                print(response)

                if isResetting {
                    courses = response.courseList
                    isResetting = false
                } else {
                    courses.append(contentsOf: response.courseList)
                }

                currentPage += 1
                totalPages = response.totalpages
                isLoading = false
                isFetching = false
            } catch {
                errorMessage = error.localizedDescription
                isLoading = false
                isFetching = false
                isResetting = false
            }
        }
    }

    @MainActor
    func fetchScorecard(idCourse: String) async {
//        isLoading = true
        errorMessage = nil
        
        let body = CourseDetailBody(id_course: idCourse)

        do {
            let endpoint = IGolfSignatureHelper.generateSignedPath(for: "CourseScorecardDetails")

            let response = try await HTTPClient.request(
                endPoint: endpoint,
                method: .POST,
                body: body,
                responseType: ScorecardModel.self
            )
            
            self.scorecard = response
//            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    @MainActor
    func fetchGPS(idCourse: String) async {
//        isLoading = true
        errorMessage = nil
        
        let body = CourseDetailBody(id_course: idCourse)

        do {
            let endpoint = IGolfSignatureHelper.generateSignedPath(for: "CourseGPSDetails")

            let response = try await HTTPClient.request(
                endPoint: endpoint,
                method: .POST,
                body: body,
                responseType: GPSModel.self
            )
            
            self.gpsData = response
//            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    @MainActor
    func fetchVectorGPS(idCourse: String) async {
//        isLoading = true
        errorMessage = nil
        
        let body = CourseDetailBody(id_course: idCourse)

        do {
            let endpoint = IGolfSignatureHelper.generateSignedPath(for: "CourseGPSVectorDetails")

            let response = try await HTTPClient.request(
                endPoint: endpoint,
                method: .POST,
                body: body,
                responseType: VectorGPSModel.self
            )
            
            self.vectorData = response
//            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    @MainActor
    func fetchTeeDetails(idCourse: String) async {
        errorMessage = nil
        
        let body = TeeDetailsBody(id_course: idCourse, detailLevel: 2)

        do {
            let endpoint = IGolfSignatureHelper.generateSignedPath(for: "CourseTeeDetails")

            let response = try await HTTPClient.request(
                endPoint: endpoint,
                method: .POST,
                body: body,
                responseType: TeeDetailsModel.self
            )
            
            self.teeDetails = response
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}

struct getCourseBody: Codable {
    let active: Int
    let id_country: Int
    let page: Int
    let resultsPerPage: Int
    let countryFormat: Int
    let stateFormat: Int
}

struct CourseDetailBody: Codable {
    let id_course: String
}

struct TeeDetailsBody: Codable {
    let id_course: String
    let detailLevel: Int
}
