//
//  ScanObject.swift
//  QRCode
//
//  Created by Maruf on 25/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

class ScanObject: NSObject, NSCoding {

    var qrString: String
    var qrTime: String
    var isSelected: Bool

    init(qrString: String, qrTime: String, isSelected: Bool) {
        self.qrString = qrString
        self.qrTime = qrTime
        self.isSelected = isSelected
    }

    required init?(coder aDecoder: NSCoder) {
        self.qrString = aDecoder.decodeObject(forKey: "qrString1") as? String ?? ""
        self.qrTime = aDecoder.decodeObject(forKey: "qrTime1") as? String ?? ""
        self.isSelected = aDecoder.decodeBool(forKey: "isSelected1")
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(qrString, forKey: "qrString1")
        aCoder.encode(qrTime, forKey: "qrTime1")
        aCoder.encode(isSelected, forKey: "isSelected1")
    }
}
