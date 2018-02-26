import Foundation

protocol ListCarWorkshopPresenter {
    func displayCarworkshops(workshops: [Workshop])
    func displayError(message: String)
}

