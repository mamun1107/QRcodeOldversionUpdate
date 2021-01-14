//
//  SelectQR_InitAction.swift
//  QRCode
//
//  Created by Maruf on 7/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import GoogleMobileAds

extension SelectQR {
    
    func initAction() {
        
        self.loadAdmobBanner()
        
    }
    
    func loadAdmobBanner(){
        bannerView.adUnitID = ADMOB_BANNER_UNIT_ID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
}
