import UIKit
import CoreLocation
import GoogleMaps

protocol ListCarWorkshopsDelegate: class {
    func didList(workshops: [Workshops])
    func didGetImage(workshops: Workshops, image: UIImage)
}

class ListCarWorkshopsViewController: UIViewController, ListCarWorkshopsDelegate {
    
    var locationManager = CLLocationManager()
    private let searchRadius: Double = 500
    private let types = ["car_repair"]
    
    @IBOutlet weak var tableView: UITableView!
    
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
    
    func didList(workshops: [Workshops]) {
        <#code#>
    }
    
    func didGetImage(workshops: Workshops, image: UIImage) {
        <#code#>
    }
    
}

