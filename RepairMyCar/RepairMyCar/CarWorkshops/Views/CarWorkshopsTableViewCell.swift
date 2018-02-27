import UIKit
import Kingfisher

class CarWorkshopsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carWorkshopsBackdrop: UIImageView!
    @IBOutlet weak var carWorkshopsRating: UILabel!
    @IBOutlet weak var carWorkshopsName: UILabel!
    @IBOutlet weak var carWorkshopsOpeningHour: UILabel!
    
    func configure(workshops: CarWorkshopViewModel) {
        carWorkshopsName.text = workshops.name.uppercased()
        carWorkshopsRating.text = NSString(format: "%.d", workshops.rating) as String
        if workshops.openingHours.openNow == true {
            carWorkshopsOpeningHour.text = "Aberto"
        } else {
            carWorkshopsOpeningHour.text = "Fechado"
        }
        let url = URL(string:  workshops.placePhotos)
        carWorkshopsBackdrop.kf.setImage(with: url)
    }
    
}
