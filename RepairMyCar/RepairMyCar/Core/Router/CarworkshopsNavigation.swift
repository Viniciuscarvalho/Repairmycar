import Foundation
import UIKit

class CarworkshopsNavigation: CarworkshopsRouter {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func root() {
        let listCarWorkshopsViewController = ListCarWorkshopsViewController()
        addTitleNavigation(at: listCarWorkshopsViewController, with: "Car Workshops")
        navigationController.viewControllers = [listCarWorkshopsViewController]
    }
    
    func carWorkshopsDetail(workshops: Workshops) {
        let carWorkshopsDetailViewController = CarWorkshopsDetailViewController(workshops: workshops)
        navigationController.pushViewController(carWorkshopsDetailViewController, animated: true)
    }
    
    private func addTitleNavigation(at viewController: UIViewController, with text: String) {
        viewController.navigationItem.title = text
    }
    
}
