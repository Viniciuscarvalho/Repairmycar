import Foundation

public class ListCarWorkshopsFactory {
    static func make(presenter: ListCarWorkshopPresenter) -> ListCarWorkshopsUseCase {
        return ListCarWorkshopsUseCase(workshopsGateway: WorkshopsGatewayService(webService: WebServiceSession()),
                                          userLocationGateway: LocationManagerUserLocationGateway(),
                                          presenter: presenter)
    }
}
