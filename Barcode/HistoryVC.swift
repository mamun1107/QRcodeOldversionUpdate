//
//  HistoryVC.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import GoogleMobileAds

class HistoryVC: UIViewController {
    
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var deletebtn: UIButton!
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    var results = [String]()
    var qrString = [String]()
    var qrTime = [String]()
    
    var scanObjectArray = [ScanObject]()
    var currentScanObjectArray = [ScanObject]()
    
    var selectedIndex = [Int]()
    
    var isSelected = [Bool]()
    
    var isEditBtnPressed = false {
        willSet {
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view willAppear from history.....")
        super.viewWillAppear(true)
        
        self.moveBannerfromHistory()
        self.loadAdmobBanner()
        //isSelected = Array(repeating: false, count: scanObjectArray.count)
        self.retrieveFromDefaults()
        self.initEleament()
        if isEditing {
            self.editBtn.title = "Cancel"
        } else {
            self.editBtn.title = "Select"
            
        }
    }
    
    override func viewDidLoad() {
        print("calling.... history veiwDidLoad!!!!")
        super.viewDidLoad()
        
        self.initEleament()
        self.navigationItem.title = "History"
        
        //MARK:- Parses
        self.moveBannerfromHistory()
        isSelected = Array(repeating: false, count: scanObjectArray.count)
        
    }
    
    func retrieveFromDefaults(){
        
        guard let placesData = UserDefaults.standard.object(forKey: "ScanDataObject") as? NSData else {
            print("'places' not found in UserDefaults")
            return
        }
        
        guard let placesArray = NSKeyedUnarchiver.unarchiveObject(with: placesData as Data) as? [ScanObject] else {
            print("Could not unarchive from placesData")
            return
        }
        
        self.scanObjectArray = placesArray
        
        currentScanObjectArray = scanObjectArray
        self.historyTableView.reloadData()
        
    }
    @IBAction func addbtnPressed(_ sender: UIBarButtonItem) {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        actionSheetController.addAction(cancelActionButton)
        
        
        let deleteActionButton = UIAlertAction(title: "Scan New", style: .default)
        { _ in
            self.tabBarController?.selectedIndex = 0
        }
        actionSheetController.addAction(deleteActionButton)
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    //edit: Mamun
    @IBAction func editBtnPressed(_ sender: UIButton) {
        //print("press....")
        
        if isEditing == true {
            
            tabBarController?.tabBar.isHidden = false
            isEditing = false
            self.editBtn.title = "Select"
            currentScanObjectArray = currentScanObjectArray.filter{($0.isSelected != true)}
            let ScanData = NSKeyedArchiver.archivedData(withRootObject: currentScanObjectArray)
            UserDefaults.standard.set(ScanData, forKey: "ScanDataObject")
            self.historyTableView.reloadData()
        }
        else {
            
            isEditing = true
            self.editBtn.title = "Cancel"
            self.historyTableView.reloadData()
            
            
            
        }
    }
    
    @IBAction func shareBtnPressed(_ sender: Any) {
        
        var scanImageArray:[UIImage] = [UIImage]()
        
        for scanObject in scanObjectArray {
            if scanObject.isSelected == true {
                let scanInfo = scanObject.qrString
                let image = generateQRCode(from: scanInfo)
                scanImageArray.append(image!)
            }
        }
        
        
        let activityController = UIActivityViewController(activityItems: scanImageArray, applicationActivities: nil)
        
        self.present(activityController, animated: true, completion: nil)
        
        
    }
    
}

extension HistoryVC {
    
    func moveBannerfromHistory(){
        
        if(UserDefaults.standard.bool(forKey: PURCHASED)){
            self.bannerView.isHidden = true
            
        }
        else{
            self.bannerView.isHidden = false
        }
    }
}
