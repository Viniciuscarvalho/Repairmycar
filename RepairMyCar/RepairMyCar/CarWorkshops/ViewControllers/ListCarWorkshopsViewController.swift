import UIKit
import CoreLocation
import GoogleMaps

class ListCarWorkshopsViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    private let searchRadius: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    private func fetchNearbyWorkshops(coordinate: CLLocationCoordinate2D) {
        mapView.clear()
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius: searchRadius, types: searchedTypes) { places in
            places.forEach {
                let marker = CarWorkshopMarker(place: $0)
                marker.map = self.mapView
            }
        }
    }

}
