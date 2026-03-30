import Foundation

// MARK: - TeeDetailsModel
struct TeeDetailsModel: Codable {
    let teesList: [TeeDetails]
    let courseNumHoles: Int
    let status: Int
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case teesList, courseNumHoles
        case status = "Status"
        case errorMessage = "ErrorMessage"
    }
}

// MARK: - TeeDetails
struct TeeDetails: Codable {
    let ratingMen, ratingWomen: Double
    let slopeMen, slopeWomen: Int
    let teeName: String
    let id_courseTeeType: Int
    let gender: String
    let id_courseTeeColor: Int
    let teeColorName, teeColorValue: String
    let ydsTotal, yds1to9, yds10to18, yds1to18: Int
    let ydsHole: [Int]
    let displayOrder: Int

    enum CodingKeys: String, CodingKey {
        case ratingMen, ratingWomen, slopeMen, slopeWomen, teeName, id_courseTeeType, gender, id_courseTeeColor, teeColorName, teeColorValue, ydsTotal, yds1to9, yds10to18, yds1to18, ydsHole, displayOrder
    }
}
