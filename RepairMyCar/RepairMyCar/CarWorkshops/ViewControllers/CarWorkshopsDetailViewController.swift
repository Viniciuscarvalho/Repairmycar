import UIKit

class CarWorkshopsDetailViewController: UIViewController {
    
    private var workshops: CarWorkshopViewModel?
    
    @IBOutlet weak var carWorkshopBackdrop: UIImageView!
    @IBOutlet weak var carWorkshopName: UILabel!
    @IBOutlet weak var carWorkshopsVicinity: UILabel!
    
    init(workshops: CarWorkshopViewModel) {
        super.init(nibName: "CarWorkshopsDetailViewController", bundle: nil)
        self.workshops = workshops
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        guard let workshops = workshops else { return }
        carWorkshopName.text = workshops.name
        carWorkshopsVicinity.text = workshops.vicinity
    }
    
}

