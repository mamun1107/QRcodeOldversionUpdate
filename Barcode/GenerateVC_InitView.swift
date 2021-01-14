//
//  GenerateVC_InitView.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension GenerateVC {
    
    func initElemenet() {
        
        self.initView()
    }
    
    func initView() {
        
        self.initTableView()
        
    }
    
    func initTableView() {
        self.GanerateTableView.delegate = self
        self.GanerateTableView.dataSource = self
    }
}
