import UIKit
import CoreLocation

enum APIError: Error {
    case invalidData, parseError
}

protocol Service {
    func request(_ coordinate: CLLocationCoordinate2D, radius: Double, types: [String], callback: @escaping (Result<Data, APIError>) -> Void)
}

class WebService: Service {
    
    private let baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
    
    func request(_ coordinate: CLLocationCoordinate2D, radius: Double, types: [String], callback: @escaping (Result<Data, APIError>) -> Void) {
       // guard let url = URL(string: "(baseUrl)location=\(coordinate.latitude),\(coordinate.longitude)&radius=\(radius)&types=car_repair&key=\(googleApiKey)") else { return }
         guard let url = URL(string: "\(baseUrl)location=-23.6211766,-46.673661400000015&radius=500&types=car_repair&key=AIzaSyDciXEnQ8QlOC4c9XvdHpyMpQtqrTX7vWI") else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                callback(.error(.parseError))
            }
            
            guard let data = data else {
                callback(.error(.invalidData))
                return
            }
            
            callback(.success(data))
        }
        
        task.resume()
    }
}
