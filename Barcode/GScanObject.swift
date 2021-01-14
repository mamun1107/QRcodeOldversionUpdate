//
//  GScanObject.swift
//  QRCode
//
//  Created by Ekramul Hoque on 26/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

class GScanObject: NSObject, NSCoding {

    var qrTitle:String
    var qrString: String
    var qrTime: String
    var others:String
    var isSelected: Bool

    init(qrTitle:String,qrString: String, qrTime: String, others:String,isSelected: Bool) {
        self.qrTitle = qrTitle
        self.qrString = qrString
        self.qrTime = qrTime
        self.others = others
        self.isSelected = isSelected
    }

    required init?(coder aDecoder: NSCoder) {
        self.qrTitle = aDecoder.decodeObject(forKey: "qrTitle1") as? String ?? ""
        self.qrString = aDecoder.decodeObject(forKey: "qrString1") as? String ?? ""
        self.qrTime = aDecoder.decodeObject(forKey: "qrTime1") as? String ?? ""
        self.others = aDecoder.decodeObject(forKey: "others1") as? String ?? ""
        self.isSelected = aDecoder.decodeBool(forKey: "isSelected1")
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(qrTitle, forKey: "qrTitle1")
        aCoder.encode(qrString, forKey: "qrString1")
        aCoder.encode(qrTime, forKey: "qrTime1")
        aCoder.encode(others, forKey: "others1")
        aCoder.encode(isSelected, forKey: "isSelected1")
    }
}

