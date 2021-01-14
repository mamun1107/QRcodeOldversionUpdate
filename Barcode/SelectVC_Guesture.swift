//
//  SelectVC_Guesture.swift
//  QRCode
//
//  Created by Maruf on 7/12/19.
//  Copyright © 2019 wsoft. All rights reserved.
//

import UIKit

extension SelectQR {
   
    func initTap() {
        
        
        let emailTap = UITapGestureRecognizer(target: self, action: #selector(emailrTapped(_:)))
        self.emailbg.addGestureRecognizer(emailTap)
        
        let contactTapped = UITapGestureRecognizer(target: self, action: #selector(contactTapped(_:)))
        self.contactBg.addGestureRecognizer(contactTapped)
        
        let phoneTapped = UITapGestureRecognizer(target: self, action: #selector(phoneTapped(_:)))
        self.phoneBg.addGestureRecognizer(phoneTapped)
        
        let messageTapped = UITapGestureRecognizer(target: self, action: #selector(messageTapped(_:)))
        self.messagebg.addGestureRecognizer(messageTapped)
        
        let webTapped = UITapGestureRecognizer(target: self, action: #selector(webTapped(_:)))
        self.webBg.addGestureRecognizer(webTapped)
        
        let wifiTapped = UITapGestureRecognizer(target: self, action: #selector(wifiTapped(_:)))
        self.wifiBg.addGestureRecognizer(wifiTapped)
        
        let clipTapped = UITapGestureRecognizer(target: self, action: #selector(clipTapped(_:)))
        self.clipBoardBg.addGestureRecognizer(clipTapped)
        
        let smsTapped = UITapGestureRecognizer(target: self, action: #selector(smsTapped(_:)))
        self.smsBg.addGestureRecognizer(smsTapped)
        
        let meTapped = UITapGestureRecognizer(target: self, action: #selector(meCardTapped(_:)))
        self.meBg.addGestureRecognizer(meTapped)
        
        let textTapped = UITapGestureRecognizer(target: self, action: #selector(textTapped(_:)))
        self.textbg.addGestureRecognizer(textTapped)
        
        let facebookTapped = UITapGestureRecognizer(target: self, action: #selector(facebookTapped(_:)))
        self.facebookbg.addGestureRecognizer(facebookTapped)
        
        let whatsAppTapped = UITapGestureRecognizer(target: self, action: #selector(whatsAppTapped(_:)))
        self.whatsAppbg.addGestureRecognizer(whatsAppTapped)
        
        
    }
    
    @objc func emailrTapped(_ sender: UIGestureRecognizer){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "EMailVC") as? EMailVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func contactTapped(_ sender: UIGestureRecognizer){
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "ContactVC") as? ContactVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @objc func phoneTapped(_ sender: UIGestureRecognizer){
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "PhoneVC") as? PhoneVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func webTapped(_ sender: UIGestureRecognizer){
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "WebVC") as? WebVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func messageTapped(_ sender: UIGestureRecognizer){
        

        if UserDefaults.standard.bool(forKey: PURCHASED) {
            let storyboard  = UIStoryboard(name: "Main", bundle: nil)
                   
                   if let vc = storyboard.instantiateViewController(withIdentifier: "MessageVC") as? MessageVC {
                       self.navigationController?.pushViewController(vc, animated: true)
                   }
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "RestoreVC") as? RestoreVC {
                present(vc, animated: true, completion: nil)
            }
        }
        
       

        
    }
    
    @objc func wifiTapped(_ sender: UIGestureRecognizer){
        
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            let storyboard  = UIStoryboard(name: "Main", bundle: nil)
            
            if let vc = storyboard.instantiateViewController(withIdentifier: "WIFIVC") as? WIFIVC {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "RestoreVC") as? RestoreVC {
                present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
    
    @objc func clipTapped(_ sender: UIGestureRecognizer){
        
        
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            
            let storyboard  = UIStoryboard(name: "Main", bundle: nil)
            
            if let vc = storyboard.instantiateViewController(withIdentifier: "ClipBoardVC") as? ClipBoardVC {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "RestoreVC") as? RestoreVC {
                present(vc, animated: true, completion: nil)
            }
        }
        
        
        
    }
    
    @objc func smsTapped(_ sender: UIGestureRecognizer){
        
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            
            let storyboard  = UIStoryboard(name: "Main", bundle: nil)
            
            if let vc = storyboard.instantiateViewController(withIdentifier: "SMSVC") as? SMSVC {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "RestoreVC") as? RestoreVC {
                present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
    @objc func meCardTapped(_ sender: UIGestureRecognizer){
        
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            
            let storyboard  = UIStoryboard(name: "Main", bundle: nil)
            
            if let vc = storyboard.instantiateViewController(withIdentifier: "MeCardVC") as? MeCardVC {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "RestoreVC") as? RestoreVC {
                present(vc, animated: true, completion: nil)
            }
        }
        
        
        
    }
    
    @objc func textTapped(_ sender: UIGestureRecognizer){
        
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            let storyboard  = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "SMSVC") as? SMSVC {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "RestoreVC") as? RestoreVC {
                present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
    @objc func facebookTapped(_ sender: UIGestureRecognizer){
        
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            
            let storyboard  = UIStoryboard(name: "Main", bundle: nil)
            
            if let vc = storyboard.instantiateViewController(withIdentifier: "FBVC") as? FBVC {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "RestoreVC") as? RestoreVC {
                present(vc, animated: true, completion: nil)
            }
        }
    
    }
    
    @objc func whatsAppTapped(_ sender: UIGestureRecognizer){
        
        if UserDefaults.standard.bool(forKey: PURCHASED) {
            
            let storyboard  = UIStoryboard(name: "Main", bundle: nil)
            
            if let vc = storyboard.instantiateViewController(withIdentifier: "WAVC") as? WAVC {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "RestoreVC") as? RestoreVC {
                present(vc, animated: true, completion: nil)
            }
        }
    }
}
