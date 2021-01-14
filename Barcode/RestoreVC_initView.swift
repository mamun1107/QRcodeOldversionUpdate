//
//  RestoreVC_initView.swift
//  QRCode
//
//  Created by Ekramul Hoque on 27/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension RestoreVC {
    
    func initElement() {
        self.initView()
    }
    func initView() {
        self.initTableView()
    }
    
    func initTableView() {
        self.restoreTableView.separatorStyle = .none
        self.restoreTableView.delegate = self
        self.restoreTableView.dataSource = self
    }
}
