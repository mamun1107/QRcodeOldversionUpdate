//
//  GenerateVC.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import GoogleMobileAds

class GenerateVC: UIViewController {
    @IBOutlet weak var GanerateTableView: UITableView!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    var qrTitle = [String]()
    var qrString = [String]()
    var qrTime = [String]()
    var qrEmailTitle = [String]()
    
    var gScanObjectArray = [GScanObject]()
    
    var isSelectedbtnPressed = false {
        willSet {
            
        }
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            self.bannerView.isHidden = true
        } else {
            self.bannerView.isHidden = false
        }
        
        self.loadAdmobBanner()
        self.retrieveFromDefaults()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initElemenet()
        self.navigationItem.title = "Generate"
       
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
    }

    @IBAction func leftAddbtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "SelectQR") as? SelectQR {
           
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func editBtnPressed(_ sender: UIButton) {
        
        
        if isSelectedbtnPressed == false {
            self.editBtn.title = "Done"
            self.isSelectedbtnPressed = true
            tabBarController?.tabBar.isHidden = true
            self.GanerateTableView.reloadData()
        } else {
           tabBarController?.tabBar.isHidden = false
            self.isSelectedbtnPressed = false
            self.editBtn.title = "Edit"
            self.GanerateTableView.reloadData()
        }
    
    }
    
    @IBAction func shareBtnPressed(_ sender: Any) {
        
        var scanImageArray:[UIImage] = [UIImage]()
            
            for scanObject in gScanObjectArray {
                if scanObject.isSelected == true {
                    let scanInfo = scanObject.qrString
                    let image = generateQRCode(from: scanInfo)
                    scanImageArray.append(image!)
                }
            }
            
        
             let activityController = UIActivityViewController(activityItems: scanImageArray, applicationActivities: nil)
           
                 self.present(activityController, animated: true, completion: nil)
       
    }
    @IBAction func deleteBtn(_ sender: Any) {
        gScanObjectArray = gScanObjectArray.filter{($0.isSelected != true)}
        
        tabBarController?.tabBar.isHidden = false
        isEditing = false
        modifiedUserDefault()
        self.GanerateTableView.reloadData()
    }
    
}
