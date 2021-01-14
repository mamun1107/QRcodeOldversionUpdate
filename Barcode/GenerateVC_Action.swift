//
//  GenerateVC_Action.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import GoogleMobileAds

extension GenerateVC {
    
    func initAction() {
        
    }
    
    func loadAdmobBanner(){
        bannerView.adUnitID = ADMOB_SMALL
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    func retrieveFromDefaults(){
        
       guard let gScanObjectData = UserDefaults.standard.object(forKey: "gScanDataObject") as? NSData else {
           print("'places' not found in UserDefaults")
           return
       }

       guard let gScanObjectArray = NSKeyedUnarchiver.unarchiveObject(with: gScanObjectData as Data) as? [GScanObject] else {
           print("Could not unarchive from placesData")
           return
       }

       self.gScanObjectArray = gScanObjectArray

       self.GanerateTableView.reloadData()
    }
    
    func modifiedUserDefault(){
           let ScanData = NSKeyedArchiver.archivedData(withRootObject: gScanObjectArray)
           UserDefaults.standard.set(ScanData, forKey: "gScanDataObject")
       }
}
