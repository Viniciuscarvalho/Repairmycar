import Foundation
import CoreLocation
import UIKit

struct Coordinate: Codable {
    var lat: Double
    var long: Double
    
    enum CodingKeys: String, CodingKey {
        case lat
        case long = "lng"
    }
}

struct Photos: Codable {
    var photoReference: String
    
    enum CodingKeys: String, CodingKey {
        case photoReference = "photo_reference"
    }
}

public struct Workshops: Codable {
    
    public var name: String
    public var address: String
    var coordinate: Coordinate
    public var placeType: [String]
    var photos: Photos
    
    enum CodingKeys: String, CodingKey {
        case name
        case address
        case coordinate = "location"
        case placeType = "types"
        case photos = "photo_reference"
    }
}

struct WorkshopsList: Codable {
    var workshops: [Workshops]
    
    enum CodingKeys: String, CodingKey {
        case workshops = "results"
    }
}
