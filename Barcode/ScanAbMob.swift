//
//  ScanAbMob.swift
//  QRCode
//
//  Created by Maruf on 25/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//



import UIKit
import GoogleMobileAds

extension ScanVC: GADInterstitialDelegate{
  // ----------------
  // interstitial
  // ----------------
   
  func initInterstitial(){
    interstitial = createAndLoadInterstitial()
  }
   
  func createAndLoadInterstitial() -> GADInterstitial {
    
    let interstitial = GADInterstitial(adUnitID: ADDMOB_FULLSCREEN)
    interstitial.delegate = self
    interstitial.load(GADRequest())
    return interstitial
  }
   
  func interstitialDidDismissScreen(_ ad: GADInterstitial) {
    interstitial = createAndLoadInterstitial()
  }
    
    func random()-> Int {
        return Int.random(in: 0 ..< 100)
    }
   
  func showInterAd(){
    
    
    
    DispatchQueue.main.async {
        if self.interstitial!.isReady {
                self.interstitial!.present(fromRootViewController: self)
      } else {
            
            print("still its not load")
        
      }
    }
  }
   
}

