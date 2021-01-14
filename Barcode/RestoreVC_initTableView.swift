//
//  RestoreVC_initTableView.swift
//  QRCode
//
//  Created by Ekramul Hoque on 28/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import StoreKit
import InAppPurchase

extension RestoreVC:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 40
        case 1:
            return 220
        case 2:
            return 250
            
        case 3:
            return 100
            
            
        case 4:
            return 150
            
            
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case 0:
            let cell = restoreTableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
            cell.cancelBtn.addTarget(self, action: #selector(cancelBtn), for: .touchUpInside)
            cell.restoreBtn.addTarget(self, action: #selector(restore(_:)), for: .touchUpInside)
            
            return cell
        case 1:
            let cell = restoreTableView.dequeueReusableCell(withIdentifier: "HeaderImageCell") as! HeaderImageCell
            if #available(iOS 10.0, *) {
                cell.start()
            } else {
            }
            return cell
        case 2:
            let cell = restoreTableView.dequeueReusableCell(withIdentifier: "FeatureCell") as! FeatureCell
            return cell
        case 3:
            let cell = restoreTableView.dequeueReusableCell(withIdentifier: "ButtonCell") as! ButtonCell
            
            cell.adRemoveBtnOutlet.addTarget(self, action: #selector(removeAdd(_:)), for: .touchUpInside)
            return cell
        case 4:
            let cell = restoreTableView.dequeueReusableCell(withIdentifier: "PrivacyCell") as! PrivacyCell
            return cell
            
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    @objc func cancelBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func restore(_ sender: UIButton) {
        
        if(UserDefaults.standard.bool(forKey: PURCHASED)){
            let alertController = UIAlertController(title: "Message", message: "Already Restored", preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                
                self.dismiss(animated: true, completion: nil)
                
            })
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            print("Restore....")
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().restoreCompletedTransactions()
        }
        
        
    }
    
    
    @objc func removeAdd(_ sender: UIButton) {
        
        if(UserDefaults.standard.bool(forKey: PURCHASED)){
            let alertController = UIAlertController(title: "Message", message: "Already Purshed", preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                
                self.dismiss(animated: true, completion: nil)
                
            })
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            print("purchasing continue....")
            //print("calling button.....")
            guard let myproduct = myproduct else { return}
            if SKPaymentQueue.canMakePayments() {
                let payment = SKPayment(product: myproduct)
                SKPaymentQueue.default().add(self)
                SKPaymentQueue.default().add(payment)
            }
        }
        
        
    }
    
}
