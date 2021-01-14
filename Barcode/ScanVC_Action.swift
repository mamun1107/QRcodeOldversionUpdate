//
//  ScanVC_Action.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit


extension ScanVC {
    
    func initAction() {
        
    }
    
    func saveToUserDefaults(){
        let ScanData = NSKeyedArchiver.archivedData(withRootObject: scanDataArray)
        UserDefaults.standard.set(ScanData, forKey: "ScanDataObject")
        
        UserDefaults.standard.set(self.results, forKey: "resultsArray")
        UserDefaults.standard.set(self.qrString, forKey: "qrString")
        UserDefaults.standard.set(self.qrTime, forKey: "qrTime")
    }
    
    
    func retrieveFromDefaults(){
        
        self.loadPlaces()    
    }
    
    func loadPlaces() {
           guard let scanData = UserDefaults.standard.object(forKey: "ScanDataObject") as? NSData else {
               return
           }

           guard let scanArray = NSKeyedUnarchiver.unarchiveObject(with: scanData as Data) as? [ScanObject] else {
               return
           }

        self.scanDataArray = scanArray
           for scanObj in scanArray {
               print("")
               print("place.latitude: \(scanObj.qrString)")
               print("place.longitude: \(scanObj.qrTime)")
               print("place.name: \(scanObj.isSelected)")
           }

    }

}
