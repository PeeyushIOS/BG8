import Foundation

// MARK: - VectorGPSModel
struct VectorGPSModel: Codable {
    let vectorGPSObject: VectorGPSObject?
    let lastModified: String?
    let idCourse: String?
    let status: Int?
    let errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case vectorGPSObject
        case lastModified
        case idCourse = "id_course"
        case status = "Status"
        case errorMessage = "ErrorMessage"
    }
}

// MARK: - VectorGPSObject
struct VectorGPSObject: Codable {
    let water, path, clubhouse, background, creek, tree, sand, road, bridge, greensideBunker, fairwayBunker: ShapeContainer?
    let holes: HolesContainer?

    enum CodingKeys: String, CodingKey {
        case water = "Water"
        case path = "Path"
        case clubhouse = "Clubhouse"
        case background = "Background"
        case creek = "Creek"
        case tree = "Tree"
        case sand = "Sand"
        case road = "Road"
        case bridge = "Bridge"
        case greensideBunker = "GreensideBunker"
        case fairwayBunker = "FairwayBunker"
        case holes = "Holes"
    }
}

// MARK: - ShapeContainer
struct ShapeContainer: Codable {
    let shapeCount: Int?
    let shapes: ShapeList?

    enum CodingKeys: String, CodingKey {
        case shapeCount = "ShapeCount"
        case shapes = "Shapes"
    }
}

// MARK: - ShapeList
struct ShapeList: Codable {
    let shape: [ShapeData]?

    enum CodingKeys: String, CodingKey {
        case shape = "Shape"
    }
}

// MARK: - ShapeData
struct ShapeData: Codable {
    let points: String?
    // Attributes are sometimes present, sometimes not, and vary in structure.
    // For now, we'll keep it simple as it's passed as a dictionary anyway.
    
    enum CodingKeys: String, CodingKey {
        case points = "Points"
    }
}

// MARK: - HolesContainer
struct HolesContainer: Codable {
    let hole: [VectorHoleData]?

    enum CodingKeys: String, CodingKey {
        case hole = "Hole"
    }
}

// MARK: - VectorHoleData
struct VectorHoleData: Codable {
    let greencenter, perimeter, teebox, fairway, centralpath, teeboxcenter, green, bunker: ShapeContainer?
    let holeNumber: Int?

    enum CodingKeys: String, CodingKey {
        case greencenter = "Greencenter"
        case perimeter = "Perimeter"
        case teebox = "Teebox"
        case fairway = "Fairway"
        case centralpath = "Centralpath"
        case teeboxcenter = "Teeboxcenter"
        case green = "Green"
        case bunker = "Bunker"
        case holeNumber = "HoleNumber"
    }
}
