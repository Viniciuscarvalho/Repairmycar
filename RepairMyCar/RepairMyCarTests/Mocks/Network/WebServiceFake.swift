import Foundation

@testable import RepairMyCar

class WebServiceFake<U>: WebService {
    
    var returnedEntity: U?
    var error: Error?
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?, Error?) -> Void) {
        completion(returnedEntity as? T, error)
    }
    
}
