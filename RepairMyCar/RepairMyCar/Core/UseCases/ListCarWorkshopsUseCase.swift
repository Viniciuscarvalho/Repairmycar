import Foundation

public class ListCarWorkshopsUseCase {
    
    private var workshopsGateway: WorkshopsGateway
    private var presenter: ListCarWorkshopPresenter
    private var userLocationGateway: UserLocationGateway
    
    init(workshopsGateway: WorkshopsGateway, userLocationGateway: UserLocationGateway, presenter: ListCarWorkshopPresenter) {
        self.workshopsGateway = workshopsGateway
        self.presenter = presenter
        self.userLocationGateway = userLocationGateway
    }
    
    public func list() {
        let userLocation = userLocationGateway.getLocation()
        workshopsGateway.list(by: userLocation) { workshops, error in
            if let workshops = workshops {
                let viewModels = workshops.map(WorkshopTransform.transform)
                self.presenter.displayCarworkshops(workshops: viewModels)
            } else {
                self.presenter.displayError(message: error?.localizedDescription ?? "NOPE")
            }
            
        }
    }
}
