//
//  HeaderImageCell.swift
//  QRCode
//
//  Created by Ekramul Hoque on 28/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit


protocol KSnapViewDelegate:class {
    func didChange(index:Int)
    func finished(flag:Bool)
}

class HeaderImageCell: UITableViewCell,KSnapViewDelegate {
    
    var images = [UIImage(named: "slieder"),UIImage(named: "slieder2"),UIImage(named: "slieder3"),UIImage(named: "slieder4"),UIImage(named: "slieder5")]
    
    var slideImageName = ["s1","s2","s3","s4","s5"]
   
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @available(iOS 10.0, *)
    
    func start() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
            UIView.transition(with: self.imgView,
            duration: 0.75,
            options: .transitionCrossDissolve,
            animations: { self.imgView.image = UIImage(named: self.slideImageName.randomElement()!) },
            completion: nil)
            
        }
        timer.fire()
        
        
    }
    
    
    func didChange(index: Int) {
       self.imgView.image = images[index]
    }
    
    func finished(flag: Bool) {
        if flag {
            // finished
        }
    }

}
