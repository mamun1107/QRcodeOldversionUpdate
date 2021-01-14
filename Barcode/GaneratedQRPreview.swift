//
//  GaneratedQRPreview.swift
//  QRCode
//
//  Created by Maruf on 7/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

class GaneratedQRPreview: UIViewController {

    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var openBrowserBtn: UIButton!
    @IBOutlet weak var footerbg: UIView!
    @IBOutlet weak var datalabel: UILabel!
    @IBOutlet weak var dataTypeLable: UILabel!
    @IBOutlet weak var dataBg: UIView!
    @IBOutlet weak var qrImage: UIImageView!
    
    
    var qr = Email()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initElemenet()
        self.initAction()
    }

    @IBAction func openBrowserPressed(_ sender: Any) {
    }
    
    @IBAction func shareBtnPressed(_ sender: Any) {
    }
}
