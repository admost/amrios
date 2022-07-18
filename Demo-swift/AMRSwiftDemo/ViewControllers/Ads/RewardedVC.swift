//
//  RewardedVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 25.10.2021.
//

import UIKit
import AMRSDK

class RewardedVC: UIViewController {
    var rewardedVideo: AMRRewardedVideo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardedVideo = AMRRewardedVideo(forZoneId: "2bdefd44-5269-4cbc-b93a-373b74a2f067")
        rewardedVideo?.delegate = self
        rewardedVideo?.load()
        
        print("<AMR Demo> - [I] - Rewarded - viewDidload works")
    }
    
    //MARK: - Actions
    @IBAction func reloadButton(_ sender: Any) {
        rewardedVideo?.load()
    }
}

//MARK: - AMRRewardedVideoDelegate
extension RewardedVC: AMRRewardedVideoDelegate {
    func didReceive(_ rewardedVideo: AMRRewardedVideo!) {
        DispatchQueue.main.async {
            rewardedVideo.show(from: self)
            print("<AMR Demo> - [I] - Rewarded - didReceive works")
        }
    }
    
    func didFail(toReceive rewardedVideo: AMRRewardedVideo!, error: AMRError!) {
        print("<AMR Demo> - [I] - Rewarded - didFailToReceive with error: \(error.errorCode)")
    }
    
    func didShow(_ rewardedVideo: AMRRewardedVideo!) {
        print("<AMR Demo> - [I] - Rewarded - didShow works")
    }
    
    func didFail(toShow rewardedVideo: AMRRewardedVideo!, error: AMRError!) {
        print("<AMR Demo> - [I] - Rewarded - didFailToShow with error: \(error.errorCode)")
    }
    
    func didClick(_ rewardedVideo: AMRRewardedVideo!) {
        print("<AMR Demo> - [I] - Rewarded - didClick clicked")
    }
    
    func didDismiss(_ rewardedVideo: AMRRewardedVideo!) {
        rewardedVideo.show(from: self)
        print("<AMR Demo> - [I] - Rewarded - didDismiss Clicked")
    }
    
    func didComplete(_ rewardedVideo: AMRRewardedVideo!) {
        print("<AMR Demo> - [I] - Rewarded - didComplete")
    }
}
