//
//  HistoryVC_InitView.swift
//  QRCode
//
//  Created by Maruf on 14/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension HistoryVC {
    
    func initEleament() {
        
        self.initView()
        
    }
    
    func initView() {
        self.initTableView()
    }
    
    func initTableView() {
        self.historyTableView.delegate = self
        self.historyTableView.dataSource = self
    }
    
    func initSearbar() {
        
    }
}


