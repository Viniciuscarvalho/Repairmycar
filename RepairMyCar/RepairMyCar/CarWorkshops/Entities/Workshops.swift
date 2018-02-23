import Foundation
import CoreLocation
import UIKit

struct WorkshopsList: Codable {
    var workshops: [Workshops]
    
    enum CodingKeys: String, CodingKey {
        case workshops = "results"
    }
}

public struct Workshops: Codable {
    let geometry: Geometry
    let name: String
    let id: String
    let icon: String
    let photos: [Photo]
    let placeID: String
    let rating: Double
    let reference, scope: String
    let types: [String]
    let vicinity: String
    
    enum CodingKeys: String, CodingKey {
        case geometry, icon, id, name
        case photos
        case placeID = "place_id"
        case rating, reference, scope, types, vicinity
    }
}

struct Geometry: Codable {
    let location: Location
}

struct Location: Codable {
    let lat, lng: Double
}

struct Photo: Codable {
    let photoReference: String
    
    enum CodingKeys: String, CodingKey {
        case photoReference = "photo_reference"
        
    }
}

