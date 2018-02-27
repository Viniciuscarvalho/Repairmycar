import UIKit

class CarWorkshopsDetailViewController: UIViewController {
    
    private var workshops: CarWorkshopViewModel?
    
    @IBOutlet weak var carWorkshopBackdrop: UIImageView!
    @IBOutlet weak var carWorkshopName: UILabel!
    @IBOutlet weak var carWorkshopsVicinity: UILabel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NOP")
    }
    
    convenience init(workshops: CarWorkshopViewModel) {
        self.init()
        self.workshops = workshops
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

