//
//  FBVC.swift
//  QRCode
//
//  Created by Maruf on 4/1/20.
//  Copyright © 2020 wsoft. All rights reserved.
//

import UIKit

class FBVC: UIViewController {
    
    var barButton:UIBarButtonItem!

    @IBOutlet weak var titleBg: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleTextFiled: UITextField!
    @IBOutlet weak var nameBg: UIView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userNameBg: UIView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userNameTextFiled: UITextField!
    
    
    
    
    
     var gScanDataArray = [GScanObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "Facebook"
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
