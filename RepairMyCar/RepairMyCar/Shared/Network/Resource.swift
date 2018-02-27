import Foundation
import UIKit
import CoreLocation

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
    private static let baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"    
    static func listCarWorkshops(by location: Location) -> Resource<WorkshopList> {
        let carWorkshopsUrl = URL(string: "\(baseUrl)location=-\(location.lat),\(location.lng)&radius=500&types=car_repair&key=\(googleApiKey)")!
        return Resource<WorkshopList>(url: carWorkshopsUrl)
    }
}


