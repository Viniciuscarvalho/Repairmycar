import Foundation

public class ListCarWorkshopsFactory {
    
    public static func make(presenter: ListCarWorkshopPresenter) -> ListCarWorkshopsInteractor {
        return ListCarWorkshopsInteractor(workshopsGateway: WorkshopsGatewayService(webService: WebServiceSession()), presenter: presenter)
    }
}
