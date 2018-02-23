import Foundation
import UIKit
import CoreLocation

struct Resources {
    
    let webService: Service = WebService()

    private func fetchData(_ coordinate: CLLocationCoordinate2D, radius: Double, types: [String], callback: @escaping (Data?) -> Void) {
        webService.request(coordinate, radius: radius, types: types) { (result) in
            switch result {
            case .success(let data):
                callback(data)
            case .error:
                callback(nil)
            }
        }
    }
}

extension Resources: PlacesNearCoordinateNetwork {
    func loadPlacesNearCoordinate(_ coordinate: CLLocationCoordinate2D, radius: Double, types: [String], callback: @escaping ([Workshops]?) -> Void) {
        
        fetchData(coordinate, radius: radius, types: types) { (data) in
            guard let data = data,
                let carWorkshops = WorkshopsUseCase.addWorkshops(data: data) else {
                    callback(nil)
                    return
            }
            callback(carWorkshops)
        }
    }
}
