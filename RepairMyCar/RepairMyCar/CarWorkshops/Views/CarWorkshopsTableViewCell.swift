import UIKit
import Kingfisher

class CarWorkshopsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carWorkshopsBackdrop: UIImageView!
    @IBOutlet weak var carWorkshopsRating: UILabel!
    @IBOutlet weak var carWorkshopsName: UILabel!
    @IBOutlet weak var carWorkshopsOpeningHour: UILabel!
    
    func configure(workshop: CarWorkshopViewModel) {
        carWorkshopsName.text = workshop.name.uppercased()
        carWorkshopsRating.text = String(format: "%.2f", workshop.rating ?? 0)
        carWorkshopsOpeningHour.text = workshop.workshopStatus.rawValue
        
        guard let defaultImage = workshop.placePhotos else {
            carWorkshopsBackdrop.image = UIImage(named: "default_image_car")
            return
        }
        let url = URL(string:  defaultImage)
        carWorkshopsBackdrop.kf.setImage(with: url)
    }
    
}
