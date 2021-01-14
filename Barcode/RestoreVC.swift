//
//  RestoreVC.swift
//  QRCode
//
//  Created by Ekramul Hoque on 27/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import StoreKit

class RestoreVC: UIViewController {
    var myproduct:SKProduct?
    
    @IBOutlet weak var restoreTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.restoreTableView.delegate = self
        self.restoreTableView.dataSource = self
        self.initElement()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProduct()
    }
    
    
    func fetchProduct(){
        let request = SKProductsRequest(productIdentifiers:["com.lollipopgames.qrcode.barcode.reader.generate.RemoveAds"])
        request.delegate = self
        request.start()
    }
    
}

extension RestoreVC:SKProductsRequestDelegate,SKPaymentTransactionObserver{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let product = response.products.first{
            myproduct = product
            print(product.productIdentifier)
            print(product.price)
        }
        print("hello productsRequest ")
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        print("hello paymentQueue...")
        
        for transaction in transactions{
            
            switch transaction.transactionState{
            
            case .purchasing:
                print("purchasing....")
                break
                
            case .purchased:
                print("purshed.....")
                
                UserDefaults.standard.setValue(true, forKey:PURCHASED)
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                self.dismiss(animated: true, completion: nil)
                
                
                break
            case .restored:
                print("Already purshed")
                UserDefaults.standard.setValue(true, forKey:PURCHASED)
                SKPaymentQueue.default().restoreCompletedTransactions()
                SKPaymentQueue.default().remove(self)
                
                let alertController = UIAlertController(title: "Message", message: "Already Purshed", preferredStyle: UIAlertController.Style.alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                    
                    self.dismiss(animated: true, completion: nil)
                    
                })
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true, completion: nil)
                break
                
            case .failed,.deferred:
                print("hello from calling .....failed,.deferred")
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
                
            default:
                print("default calling .....")
                break
            }
        }
        
    }
    
    
}
