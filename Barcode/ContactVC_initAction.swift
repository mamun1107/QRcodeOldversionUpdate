//
//  ContactVC_initAction.swift
//  QRCode
//
//  Created by Maruf on 21/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension ContactVC {
    func initAction() {
        makeEmpty()
    }
    
    func makeEmpty() {
        self.nameField.text  = ""
        self.contactField.text = ""
    }
}
