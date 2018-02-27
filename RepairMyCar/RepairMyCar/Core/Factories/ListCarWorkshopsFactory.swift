import Foundation

public class ListCarWorkshopsFactory {
    static func make(presenter: ListCarWorkshopPresenter) -> ListCarWorkshopsInteractor {
        return ListCarWorkshopsInteractor(workshopsGateway: WorkshopsGatewayService(webService: WebServiceSession()),
                                          userLocationGateway: LocationManagerUserLocationGateway(),
                                          presenter: presenter)
    }
}
