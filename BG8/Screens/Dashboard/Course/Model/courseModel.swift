//
//  courseModel.swift
//  BG8
//
//  Created by Mac HD on 10/03/2026.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let courseModel = try? JSONDecoder().decode(CourseModel.self, from: jsonData)

import Foundation

// MARK: - CourseModel
struct CourseModel: Codable {
    let page, totalpages, totalCourses: Int
    let courseList: [CourseData]
    let status: Int
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case page, totalpages, totalCourses, courseList
        case status = "Status"
        case errorMessage = "ErrorMessage"
    }
}

// MARK: - CourseList
struct CourseData: Codable , Identifiable , Equatable{
    var id: String { idCourse }
    let idCourse: String
    let active: Int
    let address1: String
    let address2: String?
    let city: String
    let idCountry: Int
    let countryFull: String
    let countryShort: String
    let courseName: String
    let email: String?
    let gpsAvailable, layoutHoles, layoutTotalHoles: Int
    let layoutName: String
    let otherState: String?
    let idState: Int
    let stateFull: String
    let stateShort, zipCode: String?
    let scorecardAvailable, syncOutputAvailable, vectorAvailable, elevationAvailable: Int
    let greenHeatmapAvailable: Int
    let conditionRating, recommendRating: Double?
    let latitude, longitude: Double?
    let teeTimesAvailable: Int
    let classification: String?
    let idLanguage, favoriteCourse, the1MeterElevationAvailable, the3MetersElevationAvailable: Int

    enum CodingKeys: String, CodingKey {
        case idCourse = "id_course"
        case active, address1, address2, city
        case idCountry = "id_country"
        case countryFull, countryShort, courseName, email, gpsAvailable, layoutHoles, layoutTotalHoles, layoutName, otherState
        case idState = "id_state"
        case stateFull, stateShort, zipCode, scorecardAvailable, syncOutputAvailable, vectorAvailable, elevationAvailable, greenHeatmapAvailable, conditionRating, recommendRating, latitude, longitude, teeTimesAvailable, classification
        case idLanguage = "id_language"
        case favoriteCourse
        case the1MeterElevationAvailable = "1meterElevationAvailable"
        case the3MetersElevationAvailable = "3metersElevationAvailable"
    }
}
