import Foundation

protocol ListCarWorkshopPresenter {
    func displayCarworkshops(workshops: [CarWorkshopViewModel])
    func displayError(message: String)
}

