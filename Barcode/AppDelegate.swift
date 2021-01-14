//
//  AppDelegate.swift
//  Barcode
//
//  Created by polat on 2/26/17.
//  Copyright © 2017 wsoft. All rights reserved.
//

import UIKit
import InAppPurchase
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    



}

