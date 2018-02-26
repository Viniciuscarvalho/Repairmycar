import Foundation

public class ListCarWorkshopsInteractor {
    
    private var workshopsGateway: WorkshopsGateway
    private var presenter: ListCarWorkshopPresenter
    
    public init(workshopsGateway: WorkshopsGateway, presenter: ListCarWorkshopPresenter) {
        self.workshopsGateway = workshopsGateway
        self.presenter = presenter
    }
    
    public func list() {
        workshopsGateway.list() { workshops, error in
            if let workshops = workshops {
                self.presenter.displayCarworkshops(workshops: workshops)
            } else if let error = error {
                self.presenter.displayError(message: error.localizedDescription)
            }
        }
    }
}
