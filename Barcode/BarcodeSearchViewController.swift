//
//  BarcodeSearchViewController.swift
//  Barcode
//
//  Created by polat on 2/27/17.
//  Copyright © 2017 wsoft. All rights reserved.
//

import UIKit
import GoogleMobileAds


class BarcodeSearchViewController: UIViewController,GADInterstitialDelegate,UIWebViewDelegate {

    
    //Outlets
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var webViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //Variables and Constants
    var interstitial:GADInterstitial?
    let URL_PATH = "https://www.barcodelookup.com"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Product Search"
        let backBarBtn = UIBarButtonItem(image: UIImage(named:"chevron"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(BarcodeSearchViewController.back))
        self.navigationItem.leftBarButtonItem = backBarBtn
        if UserDefaults.standard.bool(forKey: PURCHASED) != true {
            loadAdmobBanner()
            loadInsterstitials()
        }
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        webViewTopConstraint.constant = -UIScreen.main.bounds.height/9.0
        self.view.layoutIfNeeded()
        loadWebView()
    }
    
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    
    }
    
    
    
    func loadWebView(){
        webView.scrollView.bounces = false
        webView.delegate = self
        let url = URL(string: URL_PATH)
        let urlRequest = URLRequest(url: url!)
        self.webView.loadRequest(urlRequest)
    
    }
    
    
    //UIWeb View Delegate
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webView.scrollView.contentSize.height = UIScreen.main.bounds.height * 4
        activityIndicator.stopAnimating()
    }
    
    
    
    //Admob code
    func loadAdmobBanner(){
        bannerView.adUnitID = ADMOB_BANNER_UNIT_ID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }

    
    
    func loadInsterstitials(){
        interstitial = GADInterstitial(adUnitID: ADMOB_INTERSTITIALS_UNIT_ID)
        interstitial?.delegate = self
        interstitial?.load(GADRequest())
    }
    
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        if ad.isReady {
            ad.present(fromRootViewController: self)
        }
    }
    
    
}
