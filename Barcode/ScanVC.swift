//
//  ScanVC.swift
//  QRCode
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit
import MTBBarcodeScanner
import GoogleMobileAds


class ScanVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var topBg: UIView!
    @IBOutlet weak var userImagePickerbtn: UIButton!
    @IBOutlet weak var flashBtn: UIButton!
    @IBOutlet weak var barCodeBtnPressed: UIButton!
    @IBOutlet weak var animationView: UIImageView!
    
    
    //MARK: Add
    var interstitial:GADInterstitial?
    
    //MARK: Scanner Object
    var scanner:MTBBarcodeScanner?
    
    var results = [String]()
    
    /// Ekram
    var qr = [QRModel]()
    
    var qrString = [String]()
    var qrTime = [String]()
    
    var scanDataArray = [ScanObject]()
    
    var imageForScan = UIImage()
    
    var pickerController = UIImagePickerController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.retrieveFromDefaults()
        self.pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initElement()
        self.initInterstitial()
        
        scanner = MTBBarcodeScanner(previewView: previewView)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        if Platform.isSimulator {
            print("its semulator atta vai tota vai ")
        } else {
            do {
                try scanner?.startScanning(resultBlock: { (codes) in
                    
                    let codeObjects = codes as! [AVMetadataMachineReadableCodeObject]?
                    
                    for code in codeObjects! {
                        
                        guard let stringValue = code.stringValue else {return}
                        let qrString = stringValue
                        let firstReadingItem = self.scanDataArray.first
                        //let firstReadingItemComponets = firstReadingItem?.components(separatedBy: "||")
                        
                        let firstReadingData = firstReadingItem?.qrString
                        
                        if firstReadingData == stringValue {
                            return
                        }
                        
                        let readingTime = self.getNowTime()
                        let readingData = stringValue + "||" + readingTime
                        self.results.insert(readingData, at: 0)
                        self.qrString.insert(stringValue, at: 0)
                        self.qrTime.insert(readingTime, at: 0)
                        
                        
                        self.scanDataArray.insert(ScanObject(qrString: stringValue, qrTime: readingTime, isSelected: false), at: 0)
                        
                        
                        self.saveToUserDefaults()
                        self.playShortSound()
                        self.gotToHistory(qrString: stringValue, qrTime: readingTime)
                        
                    }
                })
                
                
            } catch(let AttaVaierror) {
                print("\(AttaVaierror)")
            }
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        scanner?.stopScanning()
        
    }
    
    func gotToHistory(qrString:String,qrTime:String) {
        
        //UserDefaults.standard.set(false, forKey: PURCHASED)
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            
        } else {
            
            self.showInterAd()
        }
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
            vc.modalPresentationStyle = .custom
            vc.qrString = qrString
            vc.qrTime = qrTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func getNowTime() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.autoupdatingCurrent
        dateFormatter.dateFormat = "HH:mm , dd MMM yyyy EEEE"
        let readingTime = dateFormatter.string(from: now)
        return readingTime
    }
    
    
    func playShortSound() {
        let filePath = Bundle.main.path(forResource: "barcode_scanner", ofType: "aiff")
        let soundURL = URL(fileURLWithPath: filePath!)
        var soundID:SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    @IBAction func flashBtnPressed(_ sender: UIButton) {
        self.scanner?.toggleTorch()
        if self.scanner?.torchMode == MTBTorchMode.on {
            sender.alpha = 1.0
        } else {
            sender.alpha = 0.1
        }
    }
    
    @IBAction func braCodeBtnPressed(_ sender: Any) {
        
    }
    @IBAction func imagePickerViewBtnPressed(_ sender: Any) {
        
        present(self.pickerController, animated: true, completion: nil)
    }
    @IBAction func frontCameratapped(_ sender: UIButton) {
        
        self.scanner?.flipCamera()
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        guard let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage,
              let detector = CIDetector(ofType: CIDetectorTypeQRCode,
                                        context: nil,
                                        options: [CIDetectorAccuracy: CIDetectorAccuracyHigh]),
              let ciImage = CIImage(image: pickedImage),
              let features = detector.features(in: ciImage) as? [CIQRCodeFeature] else { return }
        let qrCodeLink = features.reduce("") { $0 + ($1.messageString ?? "") }
        
        
        let time = getNowTime()
        let data = qrCodeLink
        self.scanDataArray.insert(ScanObject(qrString: qrCodeLink, qrTime: time, isSelected: false), at: 0)
        self.saveToUserDefaults()
        
        self.gotToHistory(qrString: data, qrTime: time)
        dismiss(animated: true, completion: nil)
        
    }
    
}

