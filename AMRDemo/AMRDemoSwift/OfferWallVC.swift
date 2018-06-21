//
//  OfferWallVC.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 5.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit
import AMRSDK

class OfferWallVC: UIViewController, AMROfferWallDelegate {

    @IBOutlet weak var AILoading: UIActivityIndicatorView!
    var _offerWall: AMROfferWall!
    var _isShown:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        if (!_isShown) {
            _isShown = true
            _offerWall = AMROfferWall.init(forZoneId: "c3ccd9f4-f2d7-48d8-93a3-25810fe4cb6c")
            _offerWall.delegate = self
            _offerWall.load()
        }
    }
    
    //Mark: <AMROfferWallDelegate>
    func didReceive(_ offerwall: AMROfferWall!) {
        AILoading.stopAnimating()
        offerwall.show(from: self.navigationController)
    }
    
    func didFail(toReceive offerwall: AMROfferWall!, error: AMRError!) {
        AILoading.stopAnimating()
        print(error.errorDescription)
    }
    
    func didDismiss(_ offerwall: AMROfferWall!) {
        print("Offerwall dismissed")
    }

}
