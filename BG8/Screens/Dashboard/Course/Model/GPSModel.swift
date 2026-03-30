import Foundation

// MARK: - GPSModel
struct GPSModel: Codable {
    let gpsList: [GPSHoleData]
    let lastModified: String
    let idCourse: String
    let status: Int
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case gpsList = "GPSList"
        case lastModified
        case idCourse = "id_course"
        case status = "Status"
        case errorMessage = "ErrorMessage"
    }
}

// MARK: - GPSHoleData
struct GPSHoleData: Codable {
    let holeNumber: Int
    let frontLat, frontLon, centerLat, centerLon, backLat, backLon: Double
    let teeLat1, teeLon1, teeLat2, teeLon2, teeLat3, teeLon3, teeLat4, teeLon4, teeLat5, teeLon5: Double
    let customLat1, customLon1: Double
    let customName1, customDesc1: String
    let customLat2, customLon2: Double
    let customName2, customDesc2: String
    let customLat3, customLon3: Double
    let customName3, customDesc3: String
    let customLat4, customLon4: Double
    let customName4, customDesc4: String
}
