import Foundation
import UIKit

class WorkshopTransform {
    
    static func transform( workshop: Workshop ) -> CarWorkshopViewModel {
        var defaultImage: Photo? = nil
        var photoRefWithUrl: String? = nil
        
        if let photo = workshop.photos {
            defaultImage = photo.first
            photoRefWithUrl = WorkshopTransform.transformGoogleUrl(height: String(describing: defaultImage?.height),
                                                            photoReference: (defaultImage?.photoReference)!,
                                                            googleApiKey: googleApiKey)
        }
        return CarWorkshopViewModel(name: workshop.name,
                                    openingHours: workshop.openingHours,
                                    photos: defaultImage,
                                    placePhotos: photoRefWithUrl,
                                    rating: workshop.rating,
                                    vicinity: workshop.vicinity)
    }
    
    static func transformGoogleUrl(height: String, photoReference: String, googleApiKey: String) -> String {
        return "https://maps.googleapis.com/maps/api/place/photo?maxheight=\(height)&photoreference=\(photoReference)&key=\(googleApiKey)"
    }
}

