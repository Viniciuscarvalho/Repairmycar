import Foundation

public struct WorkshopsDecoder {
    
    static func addWorkshops(data: Data) -> [Workshops]? {
        do {
            let workshopsList = try JSONDecoder().decode(WorkshopsList.self, from: data)
            return workshopsList.workshops
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}

