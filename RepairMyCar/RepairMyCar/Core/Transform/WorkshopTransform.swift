import Foundation
import UIKit

enum WorkshopStatus: String {
    case open = "Aberto"
    case close = "Fechado"
    
    init(isOpen: Bool) {
        self = isOpen ? .open : .close
    }
}

final class WorkshopTransform {
    
    static func transform( workshop: Workshop ) -> CarWorkshopViewModel {
        var defaultImage: Photo? = nil
        var photoRefWithUrl: String? = nil
        let isOpen = workshop.openingHours?.openNow ?? false
        
        if let photo = workshop.photos {
            defaultImage = photo.first
            photoRefWithUrl = WorkshopTransform.transformGoogleUrl(height: "\(defaultImage?.height ?? 550)",
                                                            photoReference: (defaultImage?.photoReference)!,
                                                            googleApiKey: googleApiKey)
        }
        
        return CarWorkshopViewModel(name: workshop.name,
                                    workshopStatus: WorkshopStatus.init(isOpen: isOpen),
                                    photos: defaultImage,
                                    placePhotos: photoRefWithUrl,
                                    rating: workshop.rating,
                                    vicinity: workshop.vicinity)
    }
    
    static func transformGoogleUrl(height: String, photoReference: String, googleApiKey: String) -> String {
        return "https://maps.googleapis.com/maps/api/place/photo?maxheight=\(height)&photoreference=\(photoReference)&key=\(googleApiKey)"
    }
}

