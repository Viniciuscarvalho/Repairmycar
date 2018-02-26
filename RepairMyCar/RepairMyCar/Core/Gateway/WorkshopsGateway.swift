import Foundation

public protocol WorkshopsGateway {
    func list(completion: @escaping ([Workshops]?, Error?) -> Void)
}

public class WorkshopsGatewayService: WorkshopsGateway {
    
    private var webService: WebService
    
    public init(webService: WebService) {
        self.webService = webService
    }
    
    public func list(completion: @escaping ([Workshops]?, Error?) -> Void) {
        webService.load(resource: Resources.listCarWorkshops(), completion: { workshops, error in
            completion(workshops, error)
        })
    }
}
