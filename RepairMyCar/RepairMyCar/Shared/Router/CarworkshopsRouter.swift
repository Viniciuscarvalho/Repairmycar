import UIKit

public protocol CarworkshopsRouter {
    func root()
    func carWorkshopsDetail(workshops: CarWorkshopViewModel)
}

