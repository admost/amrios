//
//  RVBannerVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 1.11.2021.
//

import UIKit
import AMRSDK

class RVBannerVC: UIViewController {
    private var banner: AMRBanner?
    private var rewardedVideo: AMRRewardedVideo?
    private var interstitial: AMRInterstitial?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBanner()
        loadRV()
        loadInterstitial()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    @IBAction func loadBanner() {
        banner = AMRBanner(forZoneId: "2f7aceb7-684f-42c0-bdc6-8d7f7c3ab979")
        banner?.delegate = self
        banner?.load()
    }
    
    @IBAction func loadRV() {
        rewardedVideo = AMRRewardedVideo(forZoneId: "92cb009f-40f6-4385-b2cc-a46dd75fad11")
        rewardedVideo?.delegate = self
        rewardedVideo?.load()
    }
    
    @IBAction func showRV() {
        rewardedVideo?.show(from: navigationController)
    }
    
    @IBAction func loadInterstitial() {
        interstitial = AMRInterstitial(forZoneId: "17e746e3-33f5-43da-ad11-afb7c3123b2b")
        interstitial?.delegate = self
        interstitial?.load()
    }
    
    @IBAction func showInterstitial() {
        interstitial?.show(from: navigationController)
    }
}

//MARK: - AMRBannerDelegate
extension RVBannerVC: AMRBannerDelegate {
    func didReceive(_ banner: AMRBanner?) {
        if let bannerView = banner?.bannerView {
            view.addSubview(bannerView)
        }
    }
    
    func didFail(toReceive banner: AMRBanner!, error: AMRError!) {
        print("<AMR Demo> - [E] - Banner ADS - didFail works with error: \(error.errorCode)")
    }
    
    func didClick(_ banner: AMRBanner!) {
        print("<AMR Demo> - [I] - Banner ADS - Banner clicked.")
    }
}

//MARK: - AMRRewardedVideoDelegate
extension RVBannerVC: AMRRewardedVideoDelegate {
    func didReceive(_ rewardedVideo: AMRRewardedVideo!) {
        DispatchQueue.main.async {
            rewardedVideo.show(from: self)
            print("<AMR Demo> - [I] - Rewarded - didReceive works")
        }
    }
    
    func didFail(toReceive rewardedVideo: AMRRewardedVideo!, error: AMRError!) {
        print("<AMR Demo> - [E] - Rewarded - didFailToReceive with error: \(error.errorCode)")
    }
    
    func didShow(_ rewardedVideo: AMRRewardedVideo!) {
        print("<AMR Demo> - [I] - Rewarded - didShow works")
    }
    
    func didFail(toShow rewardedVideo: AMRRewardedVideo!, error: AMRError!) {
        print("<AMR Demo> - [E] - Rewarded - didFailToShow with error: \(error.errorCode)")
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

//MARK: - AMRInterstitialDelegate
extension RVBannerVC: AMRInterstitialDelegate {
    func didReceive(_ interstitial: AMRInterstitial!) {
        DispatchQueue.main.async {
            interstitial.show(from: self.navigationController)
            print("<AMR Demo> - [I] - Interstitial - didReceive works")
        }
    }
    
    func didFail(toReceive interstitial: AMRInterstitial!, error: AMRError!) {
        print("<AMR Demo> - [E] - Interstitial - didFailToReceive with error: \(error.errorCode)")
    }
    
    func didShow(_ interstitial: AMRInterstitial!) {
        print("<AMR Demo> - [I] - Interstitial - didShow works")
    }
    
    func didFail(toShow interstitial: AMRInterstitial!, error: AMRError!) {
        print("<AMR Demo> - [E] - Interstitial - didFailToShow with error: \(error.errorCode)")
    }
    
    func didClick(_ interstitial: AMRInterstitial!) {
        print("<AMR Demo> - [I] - Interstitial - didClick clicked")
    }
    
    func didDismiss(_ interstitial: AMRInterstitial!) {
        interstitial.show(from: self)
        print("<AMR Demo> - [I] - Interstitial - didDismiss Clicked")
    }
}
