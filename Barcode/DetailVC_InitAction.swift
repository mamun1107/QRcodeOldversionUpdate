//
//  DetailVC_InitAction.swift
//  QRCode
//
//  Created by Maruf on 14/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension DetailVC {
    
    func initAction() {
        
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = NSURL(string: urlString) {
                // check if your application can open the NSURL instance
                //return UIApplication.sharedApplication.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 6, y: 6)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
}
