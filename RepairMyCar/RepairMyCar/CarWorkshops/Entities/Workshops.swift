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
    //let photos: [Photo]
    let placeID: String
    let reference, scope: String
    let types: [String]
    let vicinity: String
    let openingHours: OpeningHours?
    
    enum CodingKeys: String, CodingKey {
        case geometry, icon, id, name
        //case photos
        case placeID = "place_id"
        case reference, scope, types, vicinity
        case openingHours = "opening_hours"
    }
}

struct OpeningHours: Codable {
    let openNow: Bool
    
    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
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

