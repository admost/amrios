//
//  CustomNativeVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 25.10.2021.
//

import UIKit
import AMRSDK

class CustomNativeVC: UIViewController {
    @IBOutlet weak var VBannerContainer150x250: UIView!
    @IBOutlet weak var VBannerContainer200x200: UIView!
    @IBOutlet weak var VBannerContainer300x120: UIView!
    
    var bannerCustom150x250: AMRBanner!
    var bannerCustom200x200: AMRBanner!
    var bannerCustom300x120: AMRBanner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBanners()
    }
    
    //MARK: - Load Banner
    func loadBanners() {
        /*
         AMR NATIVE ONLY TEST ZONE
         c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4
         */
        
        bannerCustom150x250 = AMRBanner.init(forZoneId: "c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4")
        bannerCustom150x250.delegate = self
        bannerCustom150x250.customNativeSize = CGSize(width: 150.0, height: 250.0)
        bannerCustom150x250.customeNativeXibName = "CustomNative150x250"
        bannerCustom150x250.load()
        
        bannerCustom200x200 = AMRBanner.init(forZoneId: "c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4")
        bannerCustom200x200.delegate = self
        bannerCustom200x200.customNativeSize = CGSize(width: 200.0, height: 200.0)
        bannerCustom200x200.customeNativeXibName = "CustomNative200x200"
        bannerCustom200x200.load()
        
        bannerCustom300x120 = AMRBanner.init(forZoneId: "c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4")
        bannerCustom300x120.delegate = self
        bannerCustom300x120.customNativeSize = CGSize(width: 300.0, height: 120.0)
        bannerCustom300x120.customeNativeXibName = "CustomNative300x120"
        bannerCustom300x120.load()
        
        print("<AMR Demo> - [I] - Custom Native - viewDidload works")
    }
    
    //MARK: - Actions
    @IBAction func reloadBanners(_ sender: Any) {
        bannerCustom150x250.load()
        bannerCustom200x200.load()
        bannerCustom300x120.load()
    }
}

//MARK: - AMRBannerDelegate
extension CustomNativeVC: AMRBannerDelegate {
    func didReceive(_ banner: AMRBanner!) {
        if (banner == bannerCustom150x250) {
            VBannerContainer150x250.addSubview(banner.bannerView)
        } else if (banner == bannerCustom200x200) {
            VBannerContainer200x200.addSubview(banner.bannerView)
        } else if (banner == bannerCustom300x120) {
            VBannerContainer300x120.addSubview(banner.bannerView)
        }
    }
    
    func didFail(toReceive banner: AMRBanner!, error: AMRError!) {
        print("<AMR Demo> - [I] - Custom Native - didFail works with error: \(error.errorCode)")
    }
    
    func didClick(_ banner: AMRBanner!) {
        print("<AMR Demo> - [I] - Custom Native - Banner clicked.")
    }
}







