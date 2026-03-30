import Foundation

// MARK: - ScorecardModel
struct ScorecardModel: Codable {
    let menScorecardList: [ScorecardList]
    let wmnScorecardList: [ScorecardList]
    let idCourse: String
    let lastModified: String
    let status: Int
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case menScorecardList, wmnScorecardList
        case idCourse = "id_course"
        case lastModified
        case status = "Status"
        case errorMessage = "ErrorMessage"
    }
}

// MARK: - ScorecardList
struct ScorecardList: Codable {
    let hcpHole: [Int]
    let parHole: [Int]
    let parOut, parIn :  Int
}
