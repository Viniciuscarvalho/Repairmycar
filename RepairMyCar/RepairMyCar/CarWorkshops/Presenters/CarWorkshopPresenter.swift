import Foundation
import UIKit

class CarWorkshopPresenter: ListCarWorkshopPresenter {
    
    private weak var delegate: ListCarWorkshopsDelegate?
    
    init(delegate: ListCarWorkshopsDelegate) {
        self.delegate = delegate
    }
    
    func displayCarworkshops(workshops: [Workshops]) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.delegate?.didList(workshops: workshops)
        }
    }
    
    func displayError(message: String) {
        
    }
}
