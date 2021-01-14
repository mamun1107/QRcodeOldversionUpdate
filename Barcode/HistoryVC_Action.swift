//
//  HistoryVC_Action.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import GoogleMobileAds

extension HistoryVC {
    func loadAdmobBanner(){
        bannerView.adUnitID = ADMOB_SMALL
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
//    func addTapToSearchBar() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToGoogle))
//        self.searchTopView.addGestureRecognizer(tap)
//    }
//    @objc func tapToGoogle(_ sender: UIGestureRecognizer) {
//
//        guard let url = URL(string: GOOGLE) else { return }
//        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url)
//        } else {
//            // Fallback on earlier versions
//        }
//
//    }
}

//extension HistoryVC:UISearchBarDelegate {
//    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//       self.editBtn.isEnabled = false
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        
//        guard !searchText.isEmpty else {
//            currentScanObjectArray = scanObjectArray
//            self.historyTableView.reloadData()
//            return
//        }
//        
//        currentScanObjectArray = scanObjectArray.filter({ (object) -> Bool in
//            object.qrString.lowercased().contains(searchText.lowercased())
//            
//        })
//        
//        self.historyTableView.reloadData()
//    }
//    
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//       self.editBtn.isEnabled = true
//    }
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        
//        searchBar.resignFirstResponder()
//    }
//}
