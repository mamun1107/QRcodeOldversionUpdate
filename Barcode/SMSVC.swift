//
//  SMSVC.swift
//  QRCode
//
//  Created by Maruf on 4/1/20.
//  Copyright © 2020 wsoft. All rights reserved.
//

import UIKit

class SMSVC: UIViewController {
    
    var barButton:UIBarButtonItem!
    @IBOutlet weak var titleBG: UIView!
    
    @IBOutlet weak var smstitle: UILabel!
    
    @IBOutlet weak var titletextField: UITextField!
    
    @IBOutlet weak var nameBg: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var smsBg: UIView!
    @IBOutlet weak var smsLabel: UILabel!
    @IBOutlet weak var smsTextField: UITextView!
    
    
    var gScanDataArray = [GScanObject]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "SMS"
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
