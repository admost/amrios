//
//  BannerVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 25.10.2021.
//

import UIKit
import AMRSDK
import AMRAdmostSDK

class BannerVC: UIViewController {
    @IBOutlet weak var VBannerContainer50: UIView!
    @IBOutlet weak var VBannerContainer90: UIView!
    @IBOutlet weak var VBannerContainer250: UIView!
    
    var banner : AMRBanner!
    var banner50: AMRBanner!
    var banner90: AMRBanner!
    var banner250: AMRBanner!
    
    var admostLoader: AMRAdmostLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBanner()
    }
    
    //MARK: - Actions
    @IBAction func reload(_ sender: Any) {
        banner50.load()
        banner90.load()
        banner250.load()
    }
    
    //MARK: - Load Banner
    func loadBanner() {
        /*
         AMR TEST ZONES
         50 height    b4009772-de04-42c4-bbaa-c18da9e4a1ab
         90 height    8b72580f-c8ed-4080-aac0-004ecab65030
         250 height 1b65e016-5b26-4ba0-aff5-b500a96d5157
         */
        
        banner50 = AMRBanner.init(forZoneId: "b4009772-de04-42c4-bbaa-c18da9e4a1ab")
        banner50.bannerWidth = UIScreen.main.bounds.size.width
        banner50.delegate = self
        banner50.load()
        
        banner90 = AMRBanner.init(forZoneId: "8b72580f-c8ed-4080-aac0-004ecab65030")
        banner90.bannerWidth = UIScreen.main.bounds.size.width
        banner90.delegate = self
        banner90.load()
        
        banner250 = AMRBanner.init(forZoneId: "1b65e016-5b26-4ba0-aff5-b500a96d5157")
        banner250.bannerWidth = UIScreen.main.bounds.size.width
        banner250.delegate = self
        banner250.load()
        
        //Admost banner
        //_admostLoader = AMRAdmostLoader.init(pbk: "47759", customParameters: ["screen_name": "BannerViewController"])
        //_admostLoader.delegate = self
        //_admostLoader.load()
    }
}

//MARK: - AMRBannerDelegate
extension BannerVC: AMRBannerDelegate {
    func didReceive(_ banner: AMRBanner!) {
        if (banner == banner50) {
            VBannerContainer50.addSubview(banner.bannerView)
        } else if (banner == banner90) {
            VBannerContainer90.addSubview(banner.bannerView)
        } else if (banner == banner250) {
            VBannerContainer250.addSubview(banner.bannerView)
        }
    }
    
    func didFail(toReceive banner: AMRBanner!, error: AMRError!) {
        print("<AMR Demo> - [I] - Banner ADS - didFail works with error: \(error.errorCode)")
    }
    
    func didClick(_ banner: AMRBanner!) {
        print("<AMR Demo> - [I] - Banner ADS - Banner clicked.")
    }
    
    func didDismiss(_ banner: AMRBanner!) {
        print("<AMR Demo> - [I] - Banner ADS - didDismiss clicked")
    }
}

//MARK: - AMRAdmostLoaderDelegate
extension BannerVC: AMRAdmostLoaderDelegate {
    func admostLoader(_ loader: AMRAdmostLoader!, didReceiveMediationZones zoneIds: [Any]!) {}
    func admostLoader(_ loader: AMRAdmostLoader!, didFailWithError error: Error!) {}
}

