//
//  GanareateVC_TableAView.swift
//  QRCode
//
//  Created by Maruf on 7/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension GenerateVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gScanObjectArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = GanerateTableView.dequeueReusableCell(withIdentifier: "ganerateCell") as! ganerateCell
        cell.selectionStyle = .none
        
        cell.genadateImage.image = generateQRCode(from: gScanObjectArray[indexPath.row].qrString)
        cell.bodyLabel.text = gScanObjectArray[indexPath.row].qrString
        cell.titleLabel.text = gScanObjectArray[indexPath.row].qrTitle.uppercased()
        cell.timeLabel.text = gScanObjectArray[indexPath.row].qrTime
        
        if isSelectedbtnPressed {
            cell.selectedImageView.isHidden = false
        } else {
            cell.selectedImageView.isHidden = true
        }
        
        if gScanObjectArray[indexPath.row].isSelected == false {
            cell.selectedImageView.image = UIImage(named: "round")
        } else if gScanObjectArray[indexPath.row].isSelected {
            cell.selectedImageView.image = UIImage(named: "Select")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if isSelectedbtnPressed {
            if gScanObjectArray[indexPath.row].isSelected == true {
                gScanObjectArray[indexPath.row].isSelected = false

            } else {
                gScanObjectArray[indexPath.row].isSelected = true

            }
            self.GanerateTableView.reloadData()
        } else {
            self.goToDetail(indexpath: indexPath.row)
        }
    }
    
   
    
    func goToDetail(indexpath:Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
            vc.qrString = "\(gScanObjectArray[indexpath].qrTitle)\n\(gScanObjectArray[indexpath].qrString)"
            vc.qrTime = gScanObjectArray[indexpath].qrTime
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
}
