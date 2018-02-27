import Foundation

class WorkshopTransform {
    
    static func transform( workshop: Workshop ) -> CarWorkshopViewModel {
        let photo = workshop.photos.first!
        let placePhotoUrl = WorkshopTransform.transformGoogleUrl(height: String(photo.height),
                                                                 photoReference: photo.photoReference,
                                                                 googleApiKey: googleApiKey)
        return CarWorkshopViewModel(name: workshop.name,
                                    openingHours: workshop.openingHours,
                                    photos: photo,
                                    placePhotos: placePhotoUrl,
                                    rating: workshop.rating,
                                    vicinity: workshop.vicinity)
    }
    
    static func transformGoogleUrl(height: String, photoReference: String, googleApiKey: String) -> String {
        return "https://maps.googleapis.com/maps/api/place/photo?maxheight=\(height)&photoreference=\(photoReference)&key=\(googleApiKey)"
    }
}
