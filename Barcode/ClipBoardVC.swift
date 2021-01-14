//
//  ClipBoardVC.swift
//  QRCode
//
//  Created by Maruf on 4/1/20.
//  Copyright © 2020 wsoft. All rights reserved.
//

import UIKit

class ClipBoardVC: UIViewController {
    
    var barButton:UIBarButtonItem!

    @IBOutlet weak var bg: UIView!
    @IBOutlet var titleBg: UIView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var tittleTextField: UITextField!
    
    @IBOutlet weak var pasteBg: UIView!
    @IBOutlet weak var pasteLabel: UILabel!
    @IBOutlet weak var pasteTextFiled: UITextField!
    
    
    var gScanDataArray = [GScanObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "Clip Board"
        
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
