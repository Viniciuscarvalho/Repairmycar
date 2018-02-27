//
//  AppDelegate.swift
//  RepairMyCar
//
//  Created by Vinicius Carvalho Marques on 18/02/2018.
//  Copyright © 2018 Vinicius Carvalho. All rights reserved.
//

import UIKit
import GoogleMaps

let googleApiKey = "AIzaSyDciXEnQ8QlOC4c9XvdHpyMpQtqrTX7vWI"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(googleApiKey)
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ListCarWorkshopsViewController(userLocationGateway: LocationManagerUserLocationGateway())
        window.makeKeyAndVisible()
        return true
    }

}

