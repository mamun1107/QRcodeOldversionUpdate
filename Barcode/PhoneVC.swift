//
//  PhoneVC.swift
//  QRCode
//
//  Created by Maruf on 21/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

class PhoneVC: UIViewController {
    
    @IBOutlet weak var phonebg: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneTextFiled: UITextField!
    
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
        
        if let phone = phoneTextFiled.text  {
            if !phone.isEmpty && phone != "" {


                self.qrString.insert(phone, at: 0)
                self.qrEmailAdress.insert("Phone", at: 0)
                self.qrTime.insert(getNowTime(), at: 0)
                self.saveToUserDefaults()
                let storyboard = UIStoryboard (name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
                    
                    vc.qrTime = getNowTime()
                    vc.qrString = "Phone: \(phone)"
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                let alert = UIAlertController(title: nil, message: "Please Enter Phone Number", preferredStyle: .actionSheet)

                      
                       alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)

            }
            
        } else {
            
        }
        

        
    }

}
