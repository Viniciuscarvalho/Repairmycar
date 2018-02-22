//
//  AppDelegate.swift
//  RepairMyCar
//
//  Created by Vinicius Carvalho Marques on 18/02/2018.
//  Copyright © 2018 Vinicius Carvalho. All rights reserved.
//

import UIKit
import GoogleMaps

let googleApiKey = "AIzaSyDRwgTZJY8wmPNoNQYor8oUAte9_ZJd0BQ"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(googleApiKey)
        return true
    }

}

