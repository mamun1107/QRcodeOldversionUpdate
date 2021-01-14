//
//  MessageVC.swift
//  QRCode
//
//  Created by Maruf on 21/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

class MessageVC: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var messageField: UITextView!
    
    
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
        self.initAction()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Message"
    }
    
    
    @objc func createBtnTapped(_ sender: UIButton) {
        
        if let title = titleField.text  {
            if !title.isEmpty && title != "" {

                guard let messaageBody = messageField.text else {return}
                self.qrString.insert(messaageBody, at: 0)
                self.qrEmailAdress.insert(messaageBody, at: 0)
                self.qrTime.insert(getNowTime(), at: 0)
                self.saveToUserDefaults()
                let storyboard = UIStoryboard (name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
                    
                    vc.qrTime = getNowTime()
                    vc.qrString = " Title : \(title) \nMessage : \(messaageBody)"
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                let alert = UIAlertController(title: nil, message: "Please Enter Title", preferredStyle: .actionSheet)

                      
                       alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)

            }
            
        } else {
            
        }
    }

}
