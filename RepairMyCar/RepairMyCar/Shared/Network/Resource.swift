import Foundation
import UIKit
import CoreLocation

public typealias JSONDictionary = [String: AnyObject]

public struct Resource<T: Codable> {
    
    public let url: URL
    public let parse: (Data) -> T?
    
    public init(url: URL) {
        self.url = url
        self.parse = { data in
            let json = try? JSONDecoder().decode(T.self, from: data)
            return json
        }
    }
}

public struct Resources {
    
    private static let baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    // let url = URL(string: "(baseUrl)location=\(coordinate.latitude),\(coordinate.longitude)&radius=\(radius)&types=car_repair&key=\(googleApiKey)")
    let carWorkshopsUrl = URL(string: "\(baseUrl)location=-23.6211766,-46.673661400000015&radius=500&types=car_repair&key=\(googleApiKey)")
    
    static func listCarWorkshops() -> Resource<WorkshopList> {
        let carWorkshopsUrl = URL(string: "\(baseUrl)location=-23.6211766,-46.673661400000015&radius=500&types=car_repair&key=\(googleApiKey)")!
        return Resource<WorkshopList>(url: carWorkshopsUrl)
    }
}
