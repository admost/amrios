//
//  RewardedVideoVC.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 5.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit
import AMRSDK

class RewardedVideoVC: UIViewController, AMRRewardedVideoDelegate {

    @IBOutlet weak var AILoading: UIActivityIndicatorView!
    var _rewardedVideo: AMRRewardedVideo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _rewardedVideo = AMRRewardedVideo.init(forZoneId: "2bdefd44-5269-4cbc-b93a-373b74a2f067")
        _rewardedVideo.delegate = self
        _rewardedVideo.load()
    }

    //Mark: <AMRRewardedVideoDelegate>
    
    func didReceive(_ rewardedVideo: AMRRewardedVideo!) {
        AILoading.stopAnimating()
        _rewardedVideo.show(from: self.navigationController)
    }
    
    func didFail(toReceive rewardedVideo: AMRRewardedVideo!, error: AMRError!) {
        AILoading.stopAnimating()
        print(error.errorDescription)
    }
    
    func didShow(_ rewardedVideo: AMRRewardedVideo!) {
        print("Rewarded video shown")
    }
    
    func didDismiss(_ rewardedVideo: AMRRewardedVideo!) {
        print("Rewarded video dismissed")
    }
    
    func didComplete(_ rewardedVideo: AMRRewardedVideo!) {
        print("Rewarded video completed")
    }

}
