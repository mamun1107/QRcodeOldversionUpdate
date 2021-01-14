//
//  MeCardVC.swift
//  QRCode
//
//  Created by Maruf on 4/1/20.
//  Copyright © 2020 wsoft. All rights reserved.
//

import UIKit

class MeCardVC: UIViewController {
    
    var barButton:UIBarButtonItem!
    
    @IBOutlet weak var titleBg: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    
    @IBOutlet weak var cardNameBg: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var cardName: UITextField!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var cardNumberBg: UIView!
    
    
    
    
    var gScanDataArray = [GScanObject]()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "ME CARD"
         self.retrieveFromDefaults()
        self.initView()
        self.initAction()
        
        barButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createBtnTapped(_:)))
        
         navigationItem.rightBarButtonItem = barButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
