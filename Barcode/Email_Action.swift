//
//  Email_Action.swift
//  QRCode
//
//  Created by Maruf on 7/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension EMailVC {
    
    func initAction() {
        
    }
    
    func saveToUserDefaults(){
        let ScanData = NSKeyedArchiver.archivedData(withRootObject: gScanDataArray)
        UserDefaults.standard.set(ScanData, forKey: "gScanDataObject")
    }
    
    func getNowTime() -> String {
           let now = Date()
           let dateFormatter = DateFormatter()
           dateFormatter.locale = Locale.autoupdatingCurrent
           dateFormatter.dateFormat = "HH:mm , dd MMM yyyy EEEE"
           let readingTime = dateFormatter.string(from: now)
           return readingTime
       }
    
    func retrieveFromDefaults() {
        
        guard let gScanObjectData = UserDefaults.standard.object(forKey: "gScanDataObject") as? NSData else {
                  print("'places' not found in UserDefaults")
                  return
              }

              guard let gScanObjectArray = NSKeyedUnarchiver.unarchiveObject(with: gScanObjectData as Data) as? [GScanObject] else {
                  print("Could not unarchive from placesData")
                  return
              }

              self.gScanDataArray = gScanObjectArray
    }
}
