//
//  IDFAVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 11.11.2021.
//

import UIKit
import AppTrackingTransparency
import AdSupport

class IDFAVC: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestIDFAPermission()
    }
    
    func requestIDFAPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    self.statusLabel.text = "IDFA Status: Authorized - \(ASIdentifierManager.shared().advertisingIdentifier)"
                case .denied:
                    self.statusLabel.text = "IDFA Status: Denied - \(ASIdentifierManager.shared().advertisingIdentifier)"
                case .notDetermined:
                    self.statusLabel.text = "IDFA Status: Not Determined - \(ASIdentifierManager.shared().advertisingIdentifier)"
                case .restricted:
                    self.statusLabel.text = "IDFA Status: Restricted - \(ASIdentifierManager.shared().advertisingIdentifier)"
                @unknown default:
                    self.statusLabel.text = "IDFA Status: Unknown - \(ASIdentifierManager.shared().advertisingIdentifier)"
                }
            }
        }
    }
}

