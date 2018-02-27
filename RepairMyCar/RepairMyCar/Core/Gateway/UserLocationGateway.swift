import CoreLocation

protocol UserLocationGateway {
    func getLocation() -> Location
}

final class LocationManagerUserLocationGateway: UserLocationGateway {
    
    func getLocation() -> Location {
        guard let coordinate = locationManager.location?.coordinate else {
            return Location(lat: 0, lng: 0)
        }
        return Location(lat: coordinate.latitude, lng: coordinate.longitude)
    }
    
    private var locationManager = CLLocationManager()
    
    init() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
}
