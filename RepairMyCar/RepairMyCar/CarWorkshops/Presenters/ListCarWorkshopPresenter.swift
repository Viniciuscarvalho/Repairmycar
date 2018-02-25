import Foundation

public protocol ListCarWorkshopPresenter {
    func displayCarworkshops(workshops: [Workshops])
    func displayError(message: String)
}
