//
//  SelectQR.swift
//  QRCode
//
//  Created by Maruf on 7/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SelectQR: UIViewController {
    

    @IBOutlet weak var totalBg: UIView!
    @IBOutlet weak var bannerView: GADBannerView!
    //MARK:- EMail
    @IBOutlet weak var emailbg: UIView!
    @IBOutlet weak var emailImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    //Mark:- Contacts
    @IBOutlet weak var contactBg: UIView!
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactLabel: UILabel!
    
    //MARK:- Phone
    @IBOutlet weak var phoneBg: UIView!
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    
    //MARK:-WebSite URL
    
    @IBOutlet weak var webBg: UIView!
    @IBOutlet weak var webImage: UIImageView!
    @IBOutlet weak var weblabel: UILabel!
    
    //MARK:- Message
    @IBOutlet weak var messagebg: UIView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messagePro: UIImageView!
    
    //MARK: WifiSite
    
    @IBOutlet weak var wifiBg: UIView!
    @IBOutlet weak var wifiImage: UIImageView!
    @IBOutlet weak var wifiLabel: UILabel!
    @IBOutlet weak var wifiPro: UIImageView!
    
    //MARK:- Clipboard
    
    @IBOutlet weak var clipBoardBg: UIView!
    @IBOutlet weak var clipImage: UIImageView!
    @IBOutlet weak var clipLabel: UILabel!
    @IBOutlet weak var clipPro: UIImageView!
    
    //MARK:- SMS
    @IBOutlet weak var smsBg: UIView!
    @IBOutlet weak var smsImage: UIImageView!
    @IBOutlet weak var smsLabel: UILabel!
    @IBOutlet weak var smsPro: UIImageView!
    
    //MARK: meCard
    
    @IBOutlet weak var meBg: UIView!
    @IBOutlet weak var meImage: UIImageView!
    @IBOutlet weak var meLabel: UILabel!
    @IBOutlet weak var mePro: UIImageView!
    
    //MARK: Text
    
    @IBOutlet weak var textbg: UIView!
    @IBOutlet weak var textImage: UIImageView!
    @IBOutlet weak var textPro: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    
    //MARK:- Facebook
    @IBOutlet weak var facebookbg: UIView!
    @IBOutlet weak var facebookImage: UIImageView!
    @IBOutlet weak var facebookLabel: UILabel!
    @IBOutlet weak var facebookPro: UIImageView!
    
    //Mark: whats App
    
    @IBOutlet weak var whatsAppbg: UIView!
    @IBOutlet weak var whatsAppImage: UIImageView!
    @IBOutlet weak var whatsAppLabel: UILabel!
    @IBOutlet weak var whatsAppPro: UIImageView!
    
    
    //MARK: is Bought Primum Version
    
    var isBought = false {
        willSet {
            
        }
        didSet {
            
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//       navigationController?.navigationBar.barStyle = .default
//        if #available(iOS 11.0, *) {
//            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        } else {
//            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
//            navigationController?.navigationBar.titleTextAttributes = textAttributes
//        }
//        self.initAction()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewDidDisappear(true)
//        navigationController?.navigationBar.barStyle = .default
//        if #available(iOS 11.0, *) {
//            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
//        } else {
//            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
//            navigationController?.navigationBar.titleTextAttributes = textAttributes
//        }
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.initElement()
//        self.navigationItem.title = "Generate"
//        let bar:UINavigationBar! =  self.navigationController?.navigationBar
//
//        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        bar.shadowImage = UIImage()
//        bar.backgroundColor = UIColor.clear
//    }
//
//}
    override func viewWillAppear(_ animated: Bool) {
        print("From SelectQR WillAppear")
        super.viewWillAppear(true)
        self.moveBannerfromSelectQR()
        //HistoryVC().moveBannerfromHistory()
       navigationController?.navigationBar.barStyle = .default
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        } else {
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        }
        self.initAction()
       // self.moveBannerfromSelectQR()
    }
    
//    func viewWillLayoutSubviews(_ animated: Bool){
//        print("viewWillLayoutSubviews")
//        super.viewDidDisappear(true)
//    }
//
//    func viewDidLayoutSubviews(_ animated: Bool){
//        print("viewDidLayoutSubviews")
//        super.viewDidDisappear(true)
//    }
//    override func viewDidAppear(_ animated: Bool){
//        print("viewDidAppear")
//        super.viewDidDisappear(true)
//    }
//
//    override func viewWillDisappear(_ animated: Bool){
//        print("viewWillLayoutSubviews")
//        super.viewDidDisappear(true)
//    }
//
//    override func viewDidDisappear(_ animated: Bool){
//        print("viewDidDisappear")
//        super.viewDidDisappear(true)
//    }
//
    override func viewWillDisappear(_ animated: Bool) {
        print("calling viewWillDisappear ")
        super.viewDidDisappear(true)
        navigationController?.navigationBar.barStyle = .default
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        } else {
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        self.navigationItem.title = "Generate"
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
        self.initElement()
        self.moveBannerfromSelectQR()
    }
    
}

extension SelectQR {
    
    func moveBannerfromSelectQR(){
        
        if(UserDefaults.standard.bool(forKey: PURCHASED)){
            self.bannerView.isHidden = true
            
        }
        else{
            self.bannerView.isHidden = false
        }
    }
}
