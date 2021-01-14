//
//  InAppPurchaseViewController.swift
//  OCR
//
//  Created by polat on 2/14/17.
//  Copyright © 2017 polat. All rights reserved.
//



let PURCHASED = "Purchased"


import UIKit
import GoogleMobileAds
import InAppPurchase



class InAppPurchaseViewController: UIViewController {

    
    @IBOutlet weak var purchasePriceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PURCHASE"
        let backBarBtn = UIBarButtonItem(image: UIImage(named:"chevron"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(InAppPurchaseViewController.back))
        self.navigationItem.leftBarButtonItem = backBarBtn
        self.purchasePriceLabel.text = PURCHASE_PRICE

    }
    
    
    
    @objc func back(){
    self.navigationController?.popViewController(animated: true)
    
    }

    
    
    @IBAction func buyBtnDidTap(_ sender: UIButton) {
        retrieveProductInfo()
        
        
    }
    
    
    
    @IBAction func restoreBtnDidTap(_ sender: UIButton) {
        restorePurchase()
    }
    
    
    
    @IBAction func cancelBtnDidTap(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    func retrieveProductInfo(){
        
        let iap = InAppPurchase.default
        iap.fetchProduct(productIdentifiers: [IN_APP_PURCHASE_ID], handler: { (result) in
            switch result {
            case .success(let products):
                self.purchaseProduct()
            case .failure(let error):
                print("error : \(error)")
            }
        })
    }
    
    
    func purchaseProduct(){
        let iap = InAppPurchase.default
        iap.purchase(productIdentifier: IN_APP_PURCHASE_ID, handler: { (result) in
            switch result {
            case .success(let state):
                print("Purchase Success")
                self.productPurchasedDismissViewController()
            case .failure(let error):
                print("error :\(error)")
            }
        })
    
    }
    
    
    
    func restorePurchase(){
        
        let iap = InAppPurchase.default
        iap.restore(handler: { (result) in
            switch result {
            case .success:
                self.productPurchasedDismissViewController()
            case .failure(let error):
                let alertController = UIAlertController(title: "ERROR", message: "Cannot restore. Please try again later", preferredStyle: UIAlertController.Style.alert)
                let cancelAction = UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
                })
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true, completion: nil)
                
            }
        })

        
    }
    
    
    
    func productPurchasedDismissViewController(){
        UserDefaults.standard.set(true, forKey: PURCHASED)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func okyBtnDidTap(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
}
