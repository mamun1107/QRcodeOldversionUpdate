//
//  ContactVC_initElement.swift
//
//
//  Created by Maruf on 21/12/19.
//
import UIKit

extension ContactVC {
    
    func initElement() {
        self.initView()
    }
    
    func initView() {
        
    }
    
     func saveToUserDefaults(){
           UserDefaults.standard.set(self.qrString, forKey: "ganeratedqrString")
           UserDefaults.standard.set(self.qrEmailAdress, forKey: "ganeratedqrTitle")
           UserDefaults.standard.set(self.qrTime, forKey: "ganeratedqrTime")
       }
       
       func getNowTime() -> String {
              let now = Date()
              let dateFormatter = DateFormatter()
              dateFormatter.locale = Locale.autoupdatingCurrent
              dateFormatter.dateFormat = "HH:mm , dd MMM yyyy EEEE"
              let readingTime = dateFormatter.string(from: now)
              return readingTime
          }
       
       func retrieveFromDefaults(){
           self.qrString = UserDefaults.standard.array(forKey: "ganeratedqrString") as? [String] ?? [String]()
           self.qrEmailAdress = UserDefaults.standard.array(forKey: "ganeratedqrTitle") as? [String] ?? [String]()
           self.qrTime = UserDefaults.standard.array(forKey: "ganeratedqrTime") as? [String] ?? [String]()
       }
}
