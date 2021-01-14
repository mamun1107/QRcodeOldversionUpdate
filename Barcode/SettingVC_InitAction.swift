//
//  SettingVC_InitAction.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import InAppPurchase
import StoreKit

extension SettingVC {
    
    func initAction() {
        
    }
    
    @objc func tappToFreeTrail(_ sender: UIGestureRecognizer) {
        
    }
    
    @objc func tappToRestore(_ sender: UIGestureRecognizer) {
        print("Restore From Settings....")
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
        
    }
    
    
    
    @objc func tappToparches(_ sender: UIGestureRecognizer) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         if let vc = storyboard.instantiateViewController(withIdentifier: "RestoreVC") as? RestoreVC {
             present(vc, animated: true, completion: nil)
         }
    }
    
    @objc func tappToReview(_ sender: UIGestureRecognizer) {
        guard let url = URL(string: REVIEW) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            // Fallback on earlier versions
        }
        
    }
    @objc func tappToMoreApps(_ sender: UIGestureRecognizer) {
        
        guard let url = URL(string: MOREAPPS) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            // Fallback on earlier versions
        }
        
    }
    @objc func tappToSupport(_ sender: UIGestureRecognizer) {
        
        guard let url = URL(string: SUPPORT) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            // Fallback on earlier versions
        }
    }
    @objc func tappToFAQ(_ sender: UIGestureRecognizer) {
        
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "FAQVC") as? FAQVC {
          //self.present(vc, animated: true, completion: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    @objc func tappToTearm(_ sender: UIGestureRecognizer) {
        guard let url = URL(string: TEARM) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            // Fallback on earlier versions
        }
        
    }
    @objc func tappToShare(_ sender: UIGestureRecognizer) {
        print("Share")
        let items = [URL(string: APPSHARE)!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
//    func restorePurchase(){
//
//        let iap = InAppPurchase.default
//        iap.restore(handler: { (result) in
//            switch result {
//            case .success:
//                self.productPurchasedDismissViewController()
//            case .failure(let error):
//                let alertController = UIAlertController(title: "ERROR", message: "Cannot restore. Please try again later", preferredStyle: UIAlertController.Style.alert)
//                let cancelAction = UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
//                })
//                alertController.addAction(cancelAction)
//                self.present(alertController, animated: true, completion: nil)
//
//            }
//        })
//
//
//    }
    
//    func productPurchasedDismissViewController(){
//        UserDefaults.standard.set(true, forKey: PURCHASED)
//        self.dismiss(animated: true, completion: nil)
//    }
}
