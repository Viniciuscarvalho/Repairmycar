import Foundation

protocol WorkshopsGateway {
    func list(completion: @escaping ([Workshop]?, Error?) -> Void)
}

class WorkshopsGatewayService: WorkshopsGateway {
    
    private var webService: WebService
    
    public init(webService: WebService) {
        self.webService = webService
    }
    
    func list(completion: @escaping ([Workshop]?, Error?) -> Void) {
        webService.load(resource: Resources.listCarWorkshops(), completion: { workshops, error in
            completion(workshops?.workshops, error)
        })
    }
}
