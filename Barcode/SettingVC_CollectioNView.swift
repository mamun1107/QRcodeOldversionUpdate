//
//  SettingVC_CollectioNView.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension SettingVC:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settingsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "SettingCell", for: indexPath) as! SettingCell
        cell.imageView.image = settingsData[indexPath.row].itemImage
        cell.itemName.text = settingsData[indexPath.row].itemName
        
        
        switch indexPath.row {
        case 0:
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappToparches(_:)))
            cell.bg.addGestureRecognizer(tap)
        case 1:
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappToRestore(_:)))
            cell.bg.addGestureRecognizer(tap)
        case 2:
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappToReview(_:)))
            cell.bg.addGestureRecognizer(tap)
        case 3:
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappToMoreApps(_:)))
            cell.bg.addGestureRecognizer(tap)
        case 4:
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappToSupport(_:)))
            cell.bg.addGestureRecognizer(tap)
            
        case 5:
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappToFAQ(_:)))
            cell.bg.addGestureRecognizer(tap)
          
        case 6:
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappToTearm(_:)))
            cell.bg.addGestureRecognizer(tap)
           
        case 7:
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappToShare(_ :)))
            cell.bg.addGestureRecognizer(tap)
           
        default:
            print("no index")
        }
    
        cell.setNeedsLayout()
        cell.setNeedsDisplay()
        return cell
    }
    
}

extension SettingVC:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (settingCollectionView.bounds.width / 2) - 6 , height: (settingCollectionView.bounds.height/4) - 24 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}


