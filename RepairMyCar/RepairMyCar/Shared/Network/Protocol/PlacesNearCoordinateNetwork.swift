//
//  PlacesNearCoordinateNetwork.swift
//  RepairMyCar
//
//  Created by Vinicius Marques on 23/02/18.
//  Copyright © 2018 Vinicius Carvalho. All rights reserved.
//

import Foundation
import CoreLocation

protocol PlacesNearCoordinateNetwork {
    func loadPlacesNearCoordinate(_ coordinate: CLLocationCoordinate2D, radius: Double, types: [String], callback: @escaping ([Workshops]?) -> Void)
}

