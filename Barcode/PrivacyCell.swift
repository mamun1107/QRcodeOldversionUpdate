//
//  PrivacyCell.swift
//  QRCode
//
//  Created by Ekramul Hoque on 28/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

class PrivacyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func termsConditions(_ sender: Any) {
        
        guard let url = URL(string: TEARM) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func privacyPolicy(_ sender: Any) {
        guard let url = URL(string: TEARM) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            // Fallback on earlier versions
        }
    }
}
