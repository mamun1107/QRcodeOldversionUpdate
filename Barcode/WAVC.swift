//
//  WAVC.swift
//  QRCode
//
//  Created by Maruf on 4/1/20.
//  Copyright © 2020 wsoft. All rights reserved.
//

import UIKit

class WAVC: UIViewController {
    
    var barButton:UIBarButtonItem!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleBg: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var phoneNumBg: UIView!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var phoneNumField: UITextField!
    
    
      var gScanDataArray = [GScanObject]()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "Whats App"
        self.initView()
        self.initAction()
        self.retrieveFromDefaults()
        barButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createBtnTapped(_:)))
        
         navigationItem.rightBarButtonItem = barButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
