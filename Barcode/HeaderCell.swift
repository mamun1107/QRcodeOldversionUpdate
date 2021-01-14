//
//  HeaderCell.swift
//  QRCode
//
//  Created by Ekramul Hoque on 28/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var restoreBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func cancelBtnPressed(_ sender: Any) {
        
    }
}
