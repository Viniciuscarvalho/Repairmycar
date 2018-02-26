import Foundation
import CoreLocation
import UIKit

public protocol Workshops {
    var geometry: Geometry { get }
    var name: String { get }
    var id: String { get }
    var icon: String { get }
    var photos: [Photo] { get }
    var reference: String { get }
    var scope: String { get }
    var types: [String] { get }
    var vicinity: String { get }
    var openingHours: OpeningHours? { get }
}

public struct WorkshopsEntity: Workshops {
    public var geometry: Geometry
    public var name: String
    public var id: String
    public var icon: String
    public var photos: [Photo]
    public var reference, scope: String
    public var types: [String]
    public var vicinity: String
    public var openingHours: OpeningHours?
    
    public init(geometry: Geometry, name: String, id: String, icon: String, photos: [Photo], reference: String, scope: String, types: [String], vicinity: String, openingHours: OpeningHours) {
        self.geometry = geometry
        self.name = name
        self.id = id
        self.icon = icon
        self.photos = photos
        self.reference = reference
        self.scope = scope
        self.types = types
        self.vicinity = vicinity
        self.openingHours = openingHours
    }
    
    public init?(dictionary: JSONDictionary) {
        guard let geometry = dictionary["geometry"] as? Geometry,
            let name = dictionary["name"] as? String,
            let id = dictionary["id"] as? String,
            let icon = dictionary["icon"] as? String,
            let photos = dictionary["photos"] as? Photo,
            let reference = dictionary["reference"] as? String,
            let scope = dictionary["scope"] as? String,
            let types = dictionary["types"] as? [String],
            let vicinity = dictionary["vicinity"] as? String,
            let openingHours = dictionary["opening_hours"] as? String
            else { return nil }
        
        self.init(geometry: geometry, name: name, id: id, icon: icon, photos: photos, reference: reference, scope: scope, types: types, vicinity: vicinity, openingHours: openingHours)
    }
}

