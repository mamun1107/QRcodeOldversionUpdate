//
//  WIFIVC.swift
//  QRCode
//
//  Created by Maruf on 4/1/20.
//  Copyright © 2020 wsoft. All rights reserved.
//

import UIKit

class WIFIVC: UIViewController {
    @IBOutlet weak var titleBg: UIView!
    @IBOutlet weak var atitleLabel: UILabel!
    @IBOutlet weak var titleTextView: UITextField!
    
    @IBOutlet weak var wifiNameBga: UIView!
    @IBOutlet weak var wifiNameLabel: UILabel!
    @IBOutlet weak var nametextField: UITextField!
    
    @IBOutlet weak var passwordBg: UIView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    var barButton:UIBarButtonItem!
    
    var gScanDataArray = [GScanObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.retrieveFromDefaults()
        self.navigationItem.title = "WIFI"
        self.initView()
        self.initAction()
        barButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createBtnTapped(_:)))
        
        navigationItem.rightBarButtonItem = barButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
