//
//  WebVC.swift
//  QRCode
//
//  Created by Maruf on 21/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

class WebVC: UIViewController {
    
    @IBOutlet weak var webBg: UIView!
    
    @IBOutlet weak var weblabel: UILabel!
    
    @IBOutlet weak var webField: UITextField!
    var barButton:UIBarButtonItem!
    
    
    var qrString = [String]()
    var qrEmailAdress = [String]()
    var qrTime = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
        self.retrieveFromDefaults()
        barButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createBtnTapped(_:)))
         navigationItem.rightBarButtonItem = barButton
        self.makeEmpty()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Phone"

    }
    
    @objc func createBtnTapped(_ sender: UIButton) {
        
        if let webUrl = webField.text  {
            if !webUrl.isEmpty && webUrl != "" {


                self.qrString.insert(webUrl, at: 0)
                self.qrEmailAdress.insert("Web Url ", at: 0)
                self.qrTime.insert(getNowTime(), at: 0)
                self.saveToUserDefaults()
                let storyboard = UIStoryboard (name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
                    
                    vc.qrTime = getNowTime()
                    vc.qrString = "Web Site : \(webUrl)"
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                let alert = UIAlertController(title: nil, message: "Please Enter Site Url", preferredStyle: .actionSheet)

                      
                       alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)

            }
            
        } else {
            
        }
        

        
    }

}
