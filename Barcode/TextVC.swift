//
//  TextVC.swift
//  QRCode
//
//  Created by Maruf on 4/1/20.
//  Copyright © 2020 wsoft. All rights reserved.
//

import UIKit

class TextVC: UIViewController {
    
    var barButton:UIBarButtonItem!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "Text"
        self.initView()
        self.initAction()
        
        barButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createBtnTapped(_:)))
        
         navigationItem.rightBarButtonItem = barButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
