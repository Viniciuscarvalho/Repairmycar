import UIKit
import CoreLocation
import GoogleMaps

class ListCarWorkshopsViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    private let searchRadius: Double = 500
    private let dataProvider = Resources()
    private let types = ["car_repair"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            fetchNearbyWorkshops(coordinate: mapView.camera.target)
        }
        
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

extension ListCarWorkshopsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        
        self.locationManager.startUpdatingLocation()
        self.mapView.isMyLocationEnabled = true
        self.mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        self.mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 500, bearing: 0, viewingAngle: 0)
        self.locationManager.stopUpdatingLocation()
        self.fetchNearbyWorkshops(coordinate: location.coordinate)
    }
}

