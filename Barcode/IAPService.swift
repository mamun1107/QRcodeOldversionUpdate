//
//  IAPService.swift
//  QRCode
//
//  Created by Ekramul Hoque on 30/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import StoreKit

class IAPService: NSObject {
    private override init(){}
    static let shared = IAPService()
    
    var products = [SKProduct]()
    
    var paymentQueue = SKPaymentQueue.default()
    
    func getProduct() {
        
        let products:Set = [IAPProduct.oneMonth.rawValue,
                           IAPProduct.threeMonth.rawValue,
                           IAPProduct.sixMonth.rawValue,
                           IAPProduct.oneYear.rawValue,
                           IAPProduct.nonConsumable.rawValue]
        
        var request = SKProductsRequest(productIdentifiers: products)
        request.delegate = self
        request.start()
        paymentQueue.add(self)
        
    }
    
    func parchese(product: IAPProduct) {
        
        guard let productToPerchese = products.filter({$0.productIdentifier == product.rawValue}).first else {
            return
        }
        
        let payment = SKPayment(product: productToPerchese)
        paymentQueue.add(payment)
    }
    
    func restore() {
        paymentQueue.restoreCompletedTransactions()
    }
}


extension IAPService:SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
        for product in response.products {
            print(product.localizedTitle)
        }
    }
}

extension IAPService:SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transection in transactions {
            switch transection.transactionState {
            case .purchasing:
                break
            case .restored:
                print("re stored")
               // UserDefaults.standard.set(true, forKey: PURCHASED)
            case .purchased:
//                print(transection.transactionState.status(),transection.payment.productIdentifier)
                let product = transection.payment.productIdentifier
                print("Product id : \(product)")
                UserDefaults.standard.set(true, forKey: PURCHASED)
            case .failed:
                print("failed")
            case .deferred:
                print("deferred")
            default:
                queue.finishTransaction(transection)
            }
            print(transection.transactionState.status(),transection.payment.productIdentifier)
        }
    }
}

extension SKPaymentTransactionState {
    
    func status() -> String {
        
        switch self {
        case .deferred: return "deferred"
        case .failed: return "failed"
        case .purchased: return "perchased"
        case .purchasing: return "perchashing"
        case .restored: return "restored"
        }
    }
}
