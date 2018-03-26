//
//  BannerVC.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 1.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit
import AMRSDK
import AMRAdmostSDK

class BannerVC: UIViewController, AMRBannerDelegate {

    @IBOutlet weak var VBannerContainer50: UIView!
    @IBOutlet weak var VBannerContainer90: UIView!
    @IBOutlet weak var VBannerContainer250: UIView!
    
    var _banner50: AMRBanner!
    var _banner90: AMRBanner!
    var _banner250: AMRBanner!
    
    var _admostLoader: AMRAdmostLoader!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBanners()
    }
    
    // MARK: Load banners
    
    func loadBanners() {
        
        /*
         AMR TEST ZONES
         50 height    b4009772-de04-42c4-bbaa-c18da9e4a1ab
         90 height    8b72580f-c8ed-4080-aac0-004ecab65030
         250 height 1b65e016-5b26-4ba0-aff5-b500a96d5157
         */
        
        _banner50 = AMRBanner.init(forZoneId: "b4009772-de04-42c4-bbaa-c18da9e4a1ab")
        _banner50.delegate = self
        _banner50.load()
        
        _banner90 = AMRBanner.init(forZoneId: "8b72580f-c8ed-4080-aac0-004ecab65030")
        _banner90.delegate = self
        _banner90.load()
        
        _banner250 = AMRBanner.init(forZoneId: "1b65e016-5b26-4ba0-aff5-b500a96d5157")
        _banner250.delegate = self
        _banner250.load()
    }
    
    // MARK: Actions
    
    @IBAction func reloadBanners(_ sender: Any) {
        _banner50.load()
        _banner90.load()
        _banner250.load()
    }
    
    // MARK: <AMRBannerDelegate>
    
    func didReceive(_ banner: AMRBanner!) {
        if (banner == _banner50) {
            VBannerContainer50.addSubview(banner.bannerView)
        } else if (banner == _banner90) {
            VBannerContainer90.addSubview(banner.bannerView)
        } else if (banner == _banner250) {
            VBannerContainer250.addSubview(banner.bannerView)
        }
    }
    
    func didFail(toReceive banner: AMRBanner!, error: AMRError!) {
        print(error.errorDescription)
    }
}



