import Foundation
import UIKit
import CoreLocation

public struct Resources {
    
    public func listCarWorkshops(_ coordinate: CLLocationCoordinate2D, radius: Double, types: [String], callback: @escaping ([Workshops]?) -> Void) {
        fetchData(coordinate, radius: radius, types: types) { (data) in
            guard let data = data,
                let carWorkshops = WorkshopsDecoder.addWorkshops(data: data) else {
                    callback(nil)
                    return
            }
            callback(carWorkshops)
        }
    }
}
