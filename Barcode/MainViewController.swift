//
//  ViewController.swift
//  Barcode
//
//  Created by polat on 2/26/17.
//  Copyright © 2017 wsoft. All rights reserved.
//

import UIKit
import MTBBarcodeScanner
import GoogleMobileAds



struct Platform {
    static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
            isSim = true
        #endif
        return isSim
    }()
}





class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //Variables
    var scanner:MTBBarcodeScanner?
    var results = [String]()
    
    
    //Outlets
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var torchBtn: UIButton!
    @IBOutlet weak var tableViewHeightConstrait: NSLayoutConstraint!
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var readyScanLabel: UILabel!
    @IBAction func changeCamera(_ sender: UIButton) {
        self.scanner?.flipCamera()
    }
    
    
    
    
    @IBAction func enableDisableTorch(_ sender: UIButton) {
        self.scanner?.toggleTorch()
        if self.scanner?.torchMode == MTBTorchMode.on {
            sender.alpha = 1.0
        } else {
            sender.alpha = 0.5
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scanner = MTBBarcodeScanner(previewView: previewView)
        torchBtn.alpha = 0.5
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        retrieveFromDefaults()
        tableView.reloadData()
        if Platform.isSimulator {
            //
            self.readyScanLabel.text = "Reader does not work on simulator"
            return
        }
        do {
            try scanner?.startScanning(resultBlock: { (codes) in
                let codeObjects = codes as! [AVMetadataMachineReadableCodeObject]?
                
                for code in codeObjects! {
                    guard let stringValue = code.stringValue else {return}
                    print("found code: \(stringValue)")
                    let firstReadingItem = self.results.first
                    let firstReadingItemComponets = firstReadingItem?.components(separatedBy: "||")
                    let firstReadingData = firstReadingItemComponets?[0]
                    
                    if firstReadingData == stringValue {
                        return
                    }
                    self.readyScanLabel.isHidden = true
                    let now = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale.autoupdatingCurrent
                    dateFormatter.dateFormat = "HH:mm , dd MMM yyyy EEEE"
                    let readingTime = dateFormatter.string(from: now)
                    print("reading time: \(readingTime)")
                    let readingData = stringValue + "||" + readingTime
                    self.results.insert(readingData, at: 0)
                    self.saveToUserDefaults()
                    self.tableView.reloadData()
                    self.tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: UITableView.ScrollPosition.top, animated: true)
                    self.playShortSound()
                    
                }
            })
        } catch {
            print("device does not have camera.")
            
        }
        
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            bannerView.isHidden = true
        } else {
           // loadAdmobBanner()
            bannerView.isHidden = false
        }
        
    }
    
    
    
    
    
    func saveToUserDefaults(){
        UserDefaults.standard.set(self.results, forKey: "resultsArray")
    }
    
    
    func retrieveFromDefaults(){
        
        self.results = UserDefaults.standard.array(forKey: "resultsArray") as? [String] ?? [String]()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableViewHeightConstrait.constant = UIScreen.main.bounds.height / 2.0
        self.view.layoutIfNeeded()
        
    }
    
    
    
    //TableView Data Source & delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return results.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarcodeCell", for: indexPath) as! BarcodeTableViewCell
        let readingData = results[indexPath.row]
        let readingDataArray = readingData.components(separatedBy: "||")
        let barcodeReadingData = readingDataArray[0]
        let barcodeReadingDate = readingDataArray[1]
        cell.resultTextView.text = barcodeReadingData
        cell.dateLabel.text = barcodeReadingDate
        
        return cell
    }
    
    
    
    @IBAction func clearHistory(_ sender: UIButton) {
        
        self.results.removeAll()
        self.tableView.reloadData()
        saveToUserDefaults()
    }
    
    
    
    @IBAction func shareBarBtn(_ sender: UIBarButtonItem) {
        
        share(sender: sender)
    }
    
    
    let APP_STORE_LINK = "https://itunes.apple.com/app/id"
    
    func share(sender:UIBarButtonItem){
        let shareText = SHARE_TEXT + APP_STORE_LINK + APP_STORE_APP_ID
        
        let activityController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        if UIDevice.current.userInterfaceIdiom == .pad {
            let popoverController = UIPopoverController(contentViewController: activityController)
            popoverController.present(from: sender, permittedArrowDirections: .any
                , animated: true)
        } else {
            self.present(activityController, animated: true, completion: nil)
        }
    }
    
    
    
    
    func playShortSound(){
        let filePath = Bundle.main.path(forResource: "barcode_scanner", ofType: "aiff")
        let soundURL = URL(fileURLWithPath: filePath!)
        var soundID:SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
    }
    
    
    
    
    func loadAdmobBanner(){
        bannerView.adUnitID = ADMOB_TESTID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    

}

