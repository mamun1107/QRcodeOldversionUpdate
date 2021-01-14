//
//  HistoryVC_TableView.swift
//  QRCode
//
//  Created by Maruf on 30/11/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension HistoryVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentScanObjectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryCell
        cell.qrImageView.image = self.generateQRCode(from: currentScanObjectArray[indexPath.row].qrString)
        cell.qrTitleLabel.text = currentScanObjectArray[indexPath.row].qrString
        cell.qrTimelabel.text = currentScanObjectArray[indexPath.row].qrTime
        cell.selectionStyle = .none
        
        if isEditing {
            cell.selectImageView.isHidden = false
        } else {
            cell.selectImageView.isHidden = true
            
        }
        
        if currentScanObjectArray[indexPath.row].isSelected == false {
            cell.selectImageView.image = UIImage(named: "round")
            
        } else if currentScanObjectArray[indexPath.row].isSelected {
            cell.selectImageView.image = UIImage(named: "Select")
            //self.editBtn.title = "Cancel"
        }
        return cell
    }
    
    //edit: here work with logic for right navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.editBtn.title = "Delete"
        
        if isEditing {
            print("click 1.....")
            
            if currentScanObjectArray[indexPath.row].isSelected == true {
                self.editBtn.title = "Cancel"
                currentScanObjectArray[indexPath.row].isSelected = false
                
                for i in 0..<currentScanObjectArray.count{
                    if currentScanObjectArray[i].isSelected == true{
                        self.editBtn.title = "Delete"
                    }
                }
                
                
            } else {
                print("click...2")
                self.editBtn.title = "Delete"
                currentScanObjectArray[indexPath.row].isSelected = true
                
            }
            
            self.historyTableView.reloadData()
        } else {
            print("click3......")
            self.goToDetail(indexpath: indexPath.row)
        }
        
        
    }
    
    func goToDetail(indexpath:Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
            vc.qrString = currentScanObjectArray[indexpath].qrString
            vc.qrTime = currentScanObjectArray[indexpath].qrTime
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 20, y: 20)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    //edit: Mamun
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currentScanObjectArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            let ScanData = NSKeyedArchiver.archivedData(withRootObject: currentScanObjectArray)
            UserDefaults.standard.set(ScanData, forKey: "ScanDataObject")
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
}
