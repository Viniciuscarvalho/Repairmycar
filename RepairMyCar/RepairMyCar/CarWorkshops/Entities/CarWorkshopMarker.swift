import Foundation
import GoogleMaps

class CarWorkshopsMarker: GMSMarker {
    let place: Workshops
    
    init(place: Workshops) {
        self.place = place
        super.init()
        
        position = CLLocationCoordinate2D(latitude: place.geometry.location.lat, longitude: place.geometry.location.lng)
        icon = UIImage(named: place.types.first!+"_pin")
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = .pop
    }
}
