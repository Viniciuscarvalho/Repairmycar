import Foundation

public protocol WebService {
    func load<T: Codable>(resource: Resource<T>, completion: @escaping (T?, Error?) -> Void)
}

final class WebServiceSession: WebService {
    
    func load<T: Codable>(resource: Resource<T>, completion: @escaping (T?, Error?) -> Void) {
        URLSession.shared.dataTask(with: resource.url as URL) { data, _, error in
            guard let data = data else { completion(nil, error); return }
            completion(resource.parse(data), error)
            }.resume()
    }
}


