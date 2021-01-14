//
//  SettingVC_InitView.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension SettingVC {
    
    func initElement() {
        self.initView()
    }
    func initView() {
        self.initCollectionView()
    }
    
    func initCollectionView() {
        self.settingCollectionView.delegate = self
        self.settingCollectionView.dataSource = self
    }
    
}
