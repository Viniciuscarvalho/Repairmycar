import Foundation

struct Geometry: Codable {
    let location: Location
}

struct Location: Codable {
    let lat, lng: Double
}
