import Foundation
import CoreLocation

struct WorkshopList: Codable {
    let workshops: [Workshop]
    
    enum CodingKeys: String, CodingKey {
        case workshops = "results"
    }
}

struct Workshop: Codable {
    let geometry: Geometry
    let name: String
    let openingHours: OpeningHours?
    let photos: [Photo]?
    let rating: Double?
    let reference: String
    let types: [String]
    let vicinity: String
    var placePhotos = [String]()
    
    enum CodingKeys: String, CodingKey {
        case geometry, name
        case openingHours = "opening_hours"
        case photos
        case rating, reference, types, vicinity
    }
}

