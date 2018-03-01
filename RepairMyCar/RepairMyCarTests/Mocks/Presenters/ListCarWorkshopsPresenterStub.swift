import Foundation

@testable import RepairMyCar

class ListCarWorkshopsPresenterStub: ListCarWorkshopPresenter {
    
    var workshops: [CarWorkshopViewModel] = []
    var errorMessage: String?
    
    func displayCarworkshops(workshops: [CarWorkshopViewModel]) {
        self.workshops = workshops
    }
    
    func displayError(message: String) {
        self.errorMessage = message
    }
    
}
