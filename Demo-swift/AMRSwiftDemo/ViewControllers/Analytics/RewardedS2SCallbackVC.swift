//
//  ServerToServerVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 1.11.2021.
//

import UIKit
import AMRSDK

class ServerToServerVC: UIViewController {
    var rewardedVideo: AMRRewardedVideo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardedVideo = AMRRewardedVideo(forZoneId: "2bdefd44-5269-4cbc-b93a-373b74a2f067")
        rewardedVideo?.delegate = self
        rewardedVideo?.load()
        
        // Declare CustomData and ssvServerKey with your consent value
        rewardedVideo?.ssvServerKey = "test_server"
        rewardedVideo?.customData = ["ip": "127.0.0.1",
                                     "os": "12.0.1"]
        
        print("<AMR Demo> - [I] - Server To Server Callbacks - viewDidload works")
    }
}

//MARK: - AMRRewardedVideoDelegate
extension ServerToServerVC: AMRRewardedVideoDelegate {
    func didReceive(_ rewardedVideo: AMRRewardedVideo!) {
        DispatchQueue.main.async {
            rewardedVideo.show(from: self)
            print("<AMR Demo> - [I] - Server To Server Callbacks - didReceive works")
        }
    }
    
    func didFail(toReceive rewardedVideo: AMRRewardedVideo!, error: AMRError!) {
        print("<AMR Demo> - [E] - Server To Server Callbacks - didFailToReceive with error: \(error.errorCode)")
    }
    
    func didShow(_ rewardedVideo: AMRRewardedVideo!) {
        print("<AMR Demo> - [I] - Server To Server Callbacks - didShow works")
    }
    
    func didFail(toShow rewardedVideo: AMRRewardedVideo!, error: AMRError!) {
        print("<AMR Demo> - [E] - Server To Server Callbacks - didFailToShow with error: \(error.errorCode)")
    }
    
    func didClick(_ rewardedVideo: AMRRewardedVideo!) {
        print("<AMR Demo> - [I] - Server To Server Callbacks - didClick clicked")
    }
    
    func didDismiss(_ rewardedVideo: AMRRewardedVideo!) {
        rewardedVideo.show(from: self)
        print("<AMR Demo> - [I] - Server To Server Callbacks - didDismiss Clicked")
    }
    
    func didComplete(_ rewardedVideo: AMRRewardedVideo!) {
        print("<AMR Demo> - [I] - Server To Server Callbacks - didComplete")
    }
}
