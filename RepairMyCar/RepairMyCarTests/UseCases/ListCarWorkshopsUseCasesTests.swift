//
//  ListCarWorkshopsUseCasesTests.swift
//  RepairMyCarTests
//
//  Created by Vinicius Marques on 01/03/18.
//  Copyright © 2018 Vinicius Carvalho. All rights reserved.
//

import XCTest
import CoreLocation

@testable import RepairMyCar

class ListCarWorkshopsUseCasesTests: XCTestCase {
    
    var useCase: ListCarWorkshopsUseCase!
    var presenter: ListCarWorkshopsPresenterStub!
    var userLocationGateway: LocationManagerUserLocationGateway!
    var workshopsGateway: WorkshopsGateway!
    var workshopsWebService: WebServiceFake<[CarWorkshopViewModel]>!
    var openingHours: WorkshopStatus!
    var photos: Photo!
    
    override func setUp() {
        super.setUp()
        openingHours = WorkshopStatus(isOpen: false)
        photos = Photo(photoReference: "", height: 400, width: 400)
        userLocationGateway = LocationManagerUserLocationGateway()
        workshopsWebService = WebServiceFake()
        workshopsGateway = WorkshopsGatewayService(webService: workshopsWebService)
        presenter = ListCarWorkshopsPresenterStub()
        useCase = ListCarWorkshopsUseCase(workshopsGateway: workshopsGateway, userLocationGateway: userLocationGateway, presenter: presenter)
    }
    
    func testNotListCarWorkshopsWhenAnErrorOcurrsWhenGetWorkshpsFromWebService() {
        workshopsWebService.error = ErrorFake.error
        
        useCase.list()
        
        XCTAssertEqual(0, presenter.workshops.count)
        XCTAssertNotNil(presenter.errorMessage)
    }
    
//    func testListWorkshopsWhenHasWorkshops() {
//        workshopsWebService.returnedEntity = [CarWorkshopViewModel(
//            name: "",
//            workshopStatus: openingHours,
//            photos: photos,
//            placePhotos: "",
//            rating: "",
//            vicinity: ""
//            )]
//
//        useCase.list()
//
//        XCTAssertTrue(presenter.workshops.count > 0)
//        XCTAssertNil(presenter.errorMessage)
//    }
    
}
