import Foundation

final class WorkshopsUseCase {
    
    static func addWorkshops(data: Data) -> [Workshops]? {
        do {
            let workshopsList = try JSONDecoder().decode(WorkshopsList.self, from: data)
            return workshopsList.workshops
        } catch {
            return nil
        }
    }
}
