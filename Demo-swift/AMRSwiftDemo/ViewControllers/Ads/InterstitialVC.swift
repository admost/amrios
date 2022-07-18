//
//  InterstitialVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 25.10.2021.
//

import UIKit
import AMRSDK

class InterstitialVC: UIViewController {
    var fullScreen : AMRInterstitial?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullScreen = AMRInterstitial(forZoneId:"39f74377-5682-436a-9338-9d1c4df410bd")
        fullScreen?.delegate = self
        fullScreen?.load()
        
        print("<AMR Demo> - [I] - Interstitial - viewDidload works")
    }
    
    //MARK: - Actions
    @IBAction func reloadButton(_ sender: Any) {
        fullScreen?.load()
    }
}

//MARK: - AMRInterstitialDelegate
extension InterstitialVC: AMRInterstitialDelegate {
    func didReceive(_ interstitial: AMRInterstitial!) {
        DispatchQueue.main.async {
            interstitial.show(from: self.navigationController)
            print("<AMR Demo> - [I] - Interstitial - didReceive works")
        }
    }
    
    func didFail(toReceive interstitial: AMRInterstitial!, error: AMRError!) {
        print("<AMR Demo> - [I] - Interstitial - didFailToReceive with error: \(error.errorCode)")
    }
    
    func didShow(_ interstitial: AMRInterstitial!) {
        print("<AMR Demo> - [I] - Interstitial - didShow works")
    }
    
    func didFail(toShow interstitial: AMRInterstitial!, error: AMRError!) {
        print("<AMR Demo> - [I] - Interstitial - didFailToShow with error: \(error.errorCode)")
    }
    
    func didClick(_ interstitial: AMRInterstitial!) {
        print("<AMR Demo> - [I] - Interstitial - didClick clicked")
    }
    
    func didDismiss(_ interstitial: AMRInterstitial!) {
        interstitial.show(from: self)
        print("<AMR Demo> - [I] - Interstitial - didDismiss Clicked")
    }
}
