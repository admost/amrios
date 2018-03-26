//
//  CustomNativeBannerVC.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 1.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit
import AMRSDK

class CustomNativeBannerVC: UIViewController, AMRBannerDelegate {
    
    @IBOutlet weak var VBannerContainer150x250: UIView!
    @IBOutlet weak var VBannerContainer200x200: UIView!
    @IBOutlet weak var VBannerContainer300x120: UIView!
    
    var _bannerCustom150x250: AMRBanner!
    var _bannerCustom200x200: AMRBanner!
    var _bannerCustom300x120: AMRBanner!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBanners()
    }
    
    // MARK: Load banners
    
    func loadBanners() {
        
        /*
         AMR NATIVE ONLY TEST ZONE
         c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4
         */
        
        _bannerCustom150x250 = AMRBanner.init(forZoneId: "c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4")
        _bannerCustom150x250.delegate = self
        _bannerCustom150x250.customNativeSize = CGSize(width: 150, height: 250)
        _bannerCustom150x250.customeNativeXibName = "CustomNative150x250"
        _bannerCustom150x250.load()
        
        _bannerCustom200x200 = AMRBanner.init(forZoneId: "c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4")
        _bannerCustom200x200.delegate = self
        _bannerCustom200x200.customNativeSize = CGSize(width: 200, height: 200)
        _bannerCustom200x200.customeNativeXibName = "CustomNative200x200"
        _bannerCustom200x200.load()
        
        _bannerCustom300x120 = AMRBanner.init(forZoneId: "c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4")
        _bannerCustom300x120.delegate = self
        _bannerCustom300x120.customNativeSize = CGSize(width: 300, height: 120)
        _bannerCustom300x120.customeNativeXibName = "CustomNative300x120"
        _bannerCustom300x120.load()
    }
    
    // MARK: Actions
    
    @IBAction func reloadBanners(_ sender: Any) {
        _bannerCustom150x250.load()
        _bannerCustom200x200.load()
        _bannerCustom300x120.load()
    }
    
    // MARK: <AMRBannerDelegate>
    
    func didReceive(_ banner: AMRBanner!) {
        if (banner == _bannerCustom150x250) {
            VBannerContainer150x250.addSubview(banner.bannerView)
        } else if (banner == _bannerCustom200x200) {
            VBannerContainer200x200.addSubview(banner.bannerView)
        } else if (banner == _bannerCustom300x120) {
            VBannerContainer300x120.addSubview(banner.bannerView)
        }
    }
    
    func didFail(toReceive banner: AMRBanner!, error: AMRError!) {
        print(error.errorDescription)
    }
    
}
