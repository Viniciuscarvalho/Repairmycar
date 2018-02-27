import Foundation
import CoreLocation

struct WorkshopList: Codable {
    let workshops: [Workshop]
    
    enum CodingKeys: String, CodingKey {
        case workshops = "results"
    }
}

struct CarWorkshopViewModel {
    let name: String
    let openingHours: OpeningHours
    let photos: Photo
    let placePhotos: String
    let rating: Double
    let vicinity: String
}

struct Workshop: Codable {
    let geometry: Geometry
    let name: String
    let openingHours: OpeningHours
    let photos: [Photo]
    let rating: Double
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

struct Geometry: Codable {
    let location: Location
}

struct Location: Codable {
    let lat, lng: Double
}

struct OpeningHours: Codable {
    let openNow: Bool
    
    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
}

struct Photo: Codable {
    let photoReference: String
    let height: Int
    let width: Int
    
    enum CodingKeys: String, CodingKey {
        case photoReference = "photo_reference"
        case height
        case width
    }
}

