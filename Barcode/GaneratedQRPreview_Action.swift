//
//  GaneratedQRPreview_Action.swift
//  QRCode
//
//  Created by Maruf on 7/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension GaneratedQRPreview {
    
    func initAction() {
        self.getQrCodeObject()
    }
    
    func getQrCodeObject() {
        self.qrImage.image = qr.qrImage
         let qrAllData = "Email Adress : \(qr.emailAdress ?? "No Email"), Cc: \(qr.cc ?? "No CC"), subject: \(qr.subject ?? "no Subject"), Email body: \(qr.body ?? "No Body")"
        self.datalabel.text = qrAllData
    }
}
