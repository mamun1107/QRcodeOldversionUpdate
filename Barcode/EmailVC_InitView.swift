//
//  EmailVC_InitView.swift
//  QRCode
//
//  Created by Maruf on 7/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension EMailVC {
    func initElement() {
        self.initView()
    }
    func initView() {
        self.makeEmpty()
    }
    
    func makeEmpty() {
        self.titleTextField.text = ""
        self.emailField.text  = ""
        self.bodytextView.text = ""
    }
}
