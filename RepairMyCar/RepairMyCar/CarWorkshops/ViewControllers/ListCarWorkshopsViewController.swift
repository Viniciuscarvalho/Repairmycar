import UIKit
import CoreLocation
import GoogleMaps

class ListCarWorkshopsViewController: UIViewController {

    var locationManager = CLLocationManager()
    private let searchRadius: Double = 500
    private let types = ["car_repair"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationServices()
    }
    
    func locationServices() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    private func fetchNearbyWorkshops(coordinate: CLLocationCoordinate2D) {
       
    }
}

