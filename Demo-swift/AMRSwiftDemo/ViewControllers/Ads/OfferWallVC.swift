//
//  OfferWallViewController.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 25.10.2021.
//

import UIKit
import AMRSDK

class OfferWallVC: UIViewController {
    var fullScreen: AMROfferWall!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullScreen = AMROfferWall(forZoneId: "1cadca08-33f9-4da7-969e-ef116d4e7d0e")
        fullScreen.delegate = self
        fullScreen.load()
        
        print("<AMR Demo> - [I] - Offerwall - viewDidload works")
    }
}

// MARK: - AMROfferWallDelegate
extension OfferWallVC: AMROfferWallDelegate {
    func didReceive(_ offerwall: AMROfferWall!) {
        fullScreen.show(from: self)
    }
    
    func didFail(toReceive offerwall: AMROfferWall!, error: AMRError!) {
        print("<AMR Demo> - [I] - OfferWall - didFailToReceive with error: \(error.errorCode)")
    }
    
    func didShow(_ offerwall: AMROfferWall!) {
        print("<AMR Demo> - [I] - OfferWall - didShow works")
    }
    
    func didFail(toShow offerwall: AMROfferWall!, error: AMRError!) {
        print("<AMR Demo> - [I] - OfferWall - didFailToShow with error: \(error.errorCode)")
    }
    
    func didDismiss(_ offerwall: AMROfferWall!) {
        print("<AMR Demo> - [I] - OfferWall - didDismiss Clicked")
    }
}
