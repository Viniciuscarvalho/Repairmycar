import Foundation

protocol WorkshopsGateway {
    func list(by: Location, completion: @escaping ([Workshop]?, Error?) -> Void)
}

class WorkshopsGatewayService: WorkshopsGateway {
    
    private var webService: WebService
    
    public init(webService: WebService) {
        self.webService = webService
    }
    
    func list(by userLocation: Location, completion: @escaping ([Workshop]?, Error?) -> Void) {
        webService.load(resource: Resources.listCarWorkshops(by: userLocation), completion: { workshops, error in
            completion(workshops?.workshops, error)
        })
    }
}
