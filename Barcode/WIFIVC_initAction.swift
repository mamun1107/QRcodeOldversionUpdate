//
//  WIFIVC_initAction.swift
//  QRCode
//
//  Created by Maruf on 4/1/20.
//  Copyright © 2020 wsoft. All rights reserved.
//

import UIKit
extension WIFIVC {
    func initAction() {
        
    }
    
     @objc func createBtnTapped(_ sender: UIButton) {
        
        
        if let qrtitle = titleTextView.text  {
            if !qrtitle.isEmpty && qrtitle != "" && !nametextField.text!.isEmpty && nametextField.text != "" {

                guard let wifiname = nametextField.text else {return}
                guard let passowrd = passwordTextField.text else {return}
             
                self.gScanDataArray.insert(GScanObject(qrTitle: qrtitle, qrString: wifiname, qrTime: getNowTime(), others: passowrd,isSelected: false), at: 0)
                
                self.saveToUserDefaults()
                let storyboard = UIStoryboard (name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
                    vc.qrTime = getNowTime()
                    vc.qrString = "Wifi Name: \(wifiname) and Passord : \(passowrd)"
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                let alert = UIAlertController(title: nil, message: "Please Type Email", preferredStyle: .actionSheet)

                      
                       alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)

            }
            
        } else {
            
        }
        

        
        
    }
    
    func getNowTime() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.autoupdatingCurrent
        dateFormatter.dateFormat = "HH:mm , dd MMM yyyy EEEE"
        let readingTime = dateFormatter.string(from: now)
        return readingTime
    }
    
    func saveToUserDefaults(){
        let ScanData = NSKeyedArchiver.archivedData(withRootObject: gScanDataArray)
        UserDefaults.standard.set(ScanData, forKey: "gScanDataObject")
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
