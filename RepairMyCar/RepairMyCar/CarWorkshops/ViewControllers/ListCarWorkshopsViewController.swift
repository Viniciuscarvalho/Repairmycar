import UIKit
import CoreLocation
import GoogleMaps

class ListCarWorkshopsViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    private let searchRadius: Double = 1000
    private let dataProvider = Resources()
    private let types = ["car_repair"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        fetchNearbyWorkshops(coordinate: mapView.camera.target)
    }
    
    private func fetchNearbyWorkshops(coordinate: CLLocationCoordinate2D) {
        mapView.clear()
        dataProvider.loadPlacesNearCoordinate(coordinate, radius: searchRadius, types: types) { places in
            if let places = places {
                places.forEach {
                    let marker = CarWorkshopsMarker(place: $0)
                    marker.map = self.mapView
                }
            } else {}
        }
    }

}
