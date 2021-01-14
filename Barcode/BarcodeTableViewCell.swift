//
//  BarcodeTableViewCell.swift
//  Barcode
//
//  Created by polat on 2/27/17.
//  Copyright © 2017 wsoft. All rights reserved.
//

import UIKit

class BarcodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var resultTextView: UITextView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
