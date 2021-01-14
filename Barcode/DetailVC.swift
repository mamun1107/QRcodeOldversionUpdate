//
//  DetailVC.swift
//  QRCode
//
//  Created by Maruf on 14/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import Social

class DetailVC:UIViewController {
    
    @IBOutlet weak var removeAdBtn: UIButton!
    @IBOutlet weak var qrStringView: UITextView!
    
    @IBOutlet weak var qrImageView: UIImageView!
    var qrString:String?
    
    var qrTime:String?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.qrStringView.isEditable = false
        self.navigationItem.title = "History Result"
        self.qrStringView.text = qrString
        self.qrImageView.image = generateQRCode(from: qrString!)
        self.removeAdBtn.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        removeAdBtn.stopBlink()
    }
    
    @IBAction func shateBtnPressed(_ sender: UIButton) {
        let shareText = qrStringView.text
        let qrImage = generateQRCode(from: qrString!)
        let activityController = UIActivityViewController(activityItems: [shareText, qrImage], applicationActivities: nil)
      
            self.present(activityController, animated: true, completion: nil)
    
    }
    @IBAction func openBrowserbtn(_ sender: UIButton) {
        guard let url = URL(string: MOREAPPS) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func removeAddBtnPressed(_ sender: Any) {
        
    }
    
    
}
