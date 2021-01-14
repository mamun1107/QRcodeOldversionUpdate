//
//  EmailVC.swift
//  QRCode
//
//  Created by Maruf on 7/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

class EMailVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleBg: UIView!
    //MARK:Email
    @IBOutlet weak var emailBg: UIView!
    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var bodytextView: UITextView!
    @IBOutlet weak var bodyPlaceHolder: UILabel!
    var barButton:UIBarButtonItem!
    
    var qr = Email()
    
    var qrString = [String]()
    var qrEmailAdress = [String]()
    var qrTime = [String]()
    var qrTitle = [String]()
    
    var gScanDataArray = [GScanObject]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.retrieveFromDefaults()
        self.initElement()
        self.navigationItem.title = "EMail"
        barButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createBtnTapped(_:)))
       
        navigationItem.rightBarButtonItem = barButton
        
        self.initAction()
    }
    
    override func viewDidLoad() {
        self.bodytextView.delegate = self
        super.viewDidLoad()
        
       
    }
    
    @objc func createBtnTapped(_ sender: UIButton) {
        
        if let title = titleTextField.text  {
            if !title.isEmpty && title != "" && !emailField.text!.isEmpty && emailField.text != "" {

                guard let emailBody = bodytextView.text else {return}
                guard let email = emailField.text else {return}
             
                self.gScanDataArray.insert(GScanObject(qrTitle: title, qrString: emailBody, qrTime: getNowTime(), others: email,isSelected: false), at: 0)
                
                self.saveToUserDefaults()
                let storyboard = UIStoryboard (name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
                    vc.qrTime = getNowTime()
                    vc.qrString = "Email: \(email) and message body : \(emailBody)"
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                let alert = UIAlertController(title: nil, message: "Please Type Email", preferredStyle: .actionSheet)

                      
                       alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)

            }
            
        } else {
            
        }
        

        
    }
    

    
}
