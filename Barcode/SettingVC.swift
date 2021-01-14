//
//  SettingVC.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import GoogleMobileAds
import StoreKit

class SettingVC: UIViewController {
    @IBOutlet weak var settingCollectionView: UICollectionView!
    var myproduct:SKProduct?
    var numberObItem = 8
    
    @IBOutlet weak var bannerView: GADBannerView!
    var settingsData = [SettingsModel(itemImage: UIImage(named: "p")!, itemName: "purchase"),
                        SettingsModel(itemImage: UIImage(named: "restore")!, itemName: "Restore"),
                        SettingsModel(itemImage: UIImage(named: "review")!, itemName: "Review"),
                        SettingsModel(itemImage: UIImage(named: "more_apps")!, itemName: "More Apps"),
                        SettingsModel(itemImage: UIImage(named: "support")!, itemName: "Supposts"),
                        
                        SettingsModel(itemImage: UIImage(named: "faq")!, itemName: "FAQ"),
                        SettingsModel(itemImage: UIImage(named: "Terms_Privacy")!, itemName: "Terms & Privacy"),
                        SettingsModel(itemImage: UIImage(named: "share")!, itemName: "Share"),
        
    ]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        self.navigationItem.title = "Settings"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
        self.movebannerFromView()
        self.loadAdmobBanner()
        self.initElement()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movebannerFromView()
        fetchProduct()
        
        
        
    }
    
    func loadAdmobBanner(){
        bannerView.adUnitID = ADMOB_SMALL
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    func fetchProduct(){
        let request = SKProductsRequest(productIdentifiers:["com.lollipopgames.qrcode.barcode.reader.generate.RemoveAds"])
        request.delegate = self
        request.start()
    }
    
}



extension SettingVC:SKProductsRequestDelegate,SKPaymentTransactionObserver{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let product = response.products.first{
            myproduct = product
            print(product.productIdentifier)
            print(product.price)
        }
        print("hello productsRequest ")
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        print("hello paymentQueue ")
        
        for transaction in transactions{
            
            switch transaction.transactionState{
            
            case .purchasing:
                print("purchasing....")
                break
                
            case .purchased:
                print("purshed.....")
                if(UserDefaults.standard.bool(forKey: PURCHASED)){
                    let alertController = UIAlertController(title: "Message", message: "Already Purshed", preferredStyle: UIAlertController.Style.alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                        
                        self.dismiss(animated: true, completion: nil)
                        
                    })
                    alertController.addAction(cancelAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                }else{
                    UserDefaults.standard.setValue(true, forKey:PURCHASED)
                    SKPaymentQueue.default().finishTransaction(transaction)
                    SKPaymentQueue.default().remove(self)
                    self.dismiss(animated: true, completion: nil)
                }
                
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
extension SettingVC{
    func movebannerFromView(){
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            self.bannerView.isHidden = true
        } else {
            self.bannerView.isHidden = false
        }
    }
}
