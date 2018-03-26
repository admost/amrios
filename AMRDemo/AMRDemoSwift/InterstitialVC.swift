//
//  InterstitialVC.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 5.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit
import AMRSDK

class InterstitialVC: UIViewController, AMRInterstitialDelegate {

    @IBOutlet weak var AILoading: UIActivityIndicatorView!
    var _interstitial: AMRInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _interstitial = AMRInterstitial.init(forZoneId: "39f74377-5682-436a-9338-9d1c4df410bd")
        _interstitial.delegate = self
        _interstitial.load()
    }

    //Mark: <AMRInterstitialDelegate>
    func didReceive(_ interstitial: AMRInterstitial!) {
        AILoading.stopAnimating()
        interstitial.show(from: self.navigationController)
    }
    
    func didFail(toReceive interstitial: AMRInterstitial!, error: AMRError!) {
        AILoading.stopAnimating()
        print(error.errorDescription)
    }

    func didShow(_ interstitial: AMRInterstitial!) {
        print("Interstitial shown")
    }
    
    func didDismiss(_ interstitial: AMRInterstitial!) {
        print("Interstitial dismissed")
    }
}
