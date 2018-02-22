import UIKit
import GoogleMaps

class CarWorkshopMarker: GMSMarker {

    let workshopPlaces: GooglePlace
    
    init(workshopPlaces: GooglePlace) {
        self.workshopPlaces = workshopPlaces
        super.init()
        
        position = workshopPlaces.coordinate
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = .pop
    }
}
