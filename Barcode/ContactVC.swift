//
//  ContactVC.swift
//  QRCode
//
//  Created by Maruf on 21/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

class ContactVC: UIViewController {
    @IBOutlet weak var nameBg: UIView!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var contactBg: UIView!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var contactField: UITextField!
    
    
    var barButton:UIBarButtonItem!
    
    
    var qrString = [String]()
    var qrEmailAdress = [String]()
    var qrTime = [String]()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //self.retrieveFromDefaults()
        barButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createBtnTapped(_:)))
         navigationItem.rightBarButtonItem = barButton
        
        
        self.initAction()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Contact"

    }
    
    @objc func createBtnTapped(_ sender: UIButton) {
        
        if let name = nameField.text  {
            if !name.isEmpty && name != "" {

                guard let contactBody = contactField.text else {return}
                self.qrString.insert(contactBody, at: 0)
                self.qrEmailAdress.insert(name, at: 0)
                self.qrTime.insert(getNowTime(), at: 0)
                self.saveToUserDefaults()
                let storyboard = UIStoryboard (name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
                    
                    vc.qrTime = getNowTime()
                    vc.qrString = "Contact Name : \(name) \nContact : \(contactBody)"
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                let alert = UIAlertController(title: nil, message: "Please Enter Name", preferredStyle: .actionSheet)

                      
                       alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)

            }
            
        } else {
            
        }
        

        
    }
}
