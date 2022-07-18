//
//  DFPCustomEventsVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 25.10.2021.

import UIKit
import GoogleMobileAds

class DFPCustomEventsVC: UIViewController, GADBannerViewDelegate {
    private var banner: GADBannerView?
    private var interstitial: GADInterstitialAd?
    private var dFPBanner: GAMBannerView?
    private var dFPInterstitial: GAMInterstitialAd?
    private var dfpRewardedAd: GADRewardedAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func loadBanner() {
        DispatchQueue.main.async(execute: { [self] in
            let customAdSize = GADAdSizeFromCGSize(CGSize(width: UIScreen.main.bounds.size.width, height: 50))
            banner = GADBannerView(adSize: customAdSize)
            banner?.adUnitID = "ca-app-pub-3297656589511112/8773234182"
            banner?.delegate = self
            
            let request = GADRequest()
            banner?.load(request)
        })
    }
    
    @IBAction func loadInterstitial() {
        DispatchQueue.main.async(execute: { [self] in
            GADInterstitialAd.load(
                withAdUnitID: "ca-app-pub-3297656589511112/6995449788",
                request: GADRequest()) { [self] interstitialAd, error in
                    if let error = error {
                        print("<AMR Demo> - [E] - Interstitial load error: \(error.localizedDescription)")
                        return
                    }
                    interstitial = interstitialAd
                    interstitial?.fullScreenContentDelegate = self
                    interstitial?.present(fromRootViewController: self)
                }
        })
    }
    
    @IBAction func loadDFPBanner() {
        DispatchQueue.main.async(execute: { [self] in
            dFPBanner = GAMBannerView(adSize: GADAdSizeBanner)
            dFPBanner?.adUnitID = "/96769799/amr_ios_banner"
            dFPBanner?.delegate = self
            dFPBanner?.rootViewController = self
            
            let request = GAMRequest()
            dFPBanner?.load(request)
        })
    }
    
    @IBAction func loadDFPInterstitial() {
        DispatchQueue.main.async(execute: { [self] in
            let request = GAMRequest()
            GAMInterstitialAd.load(
                withAdManagerAdUnitID: "/96769799/amr_ios_interstitial",
                request: request) { [self] interstitialAd, error in
                    if let error = error {
                        print("<AMR Demo> - [E] - DFP Interstitial load error: \(error.localizedDescription)")
                        return
                    }
                    dFPInterstitial = interstitialAd
                    dFPInterstitial?.present(fromRootViewController: self)
                }
        })
    }
    
    @IBAction func loadDFPRewarded(_ sender: Any) {
        let request = GAMRequest()
        GADRewardedAd.load(
            withAdUnitID: "/96769799/amr_ios_rewarded",
            request: request) { [self] rewardedAd, error in
                if let error = error {
                    print("<AMR Demo> - [E] - DFP Rewarded load error: \(error.localizedDescription)")
                    return
                }
                dfpRewardedAd = rewardedAd
                dfpRewardedAd?.fullScreenContentDelegate = self
                dfpRewardedAd?.present(fromRootViewController: self, userDidEarnRewardHandler: {
                    print("<AMR Demo> - [I] - Rewarded user did earn reward.")
                })
            }
    }
}

//MARK: - GADFullScreenContentDelegate
extension DFPCustomEventsVC: GADFullScreenContentDelegate {
    func adDidRecordImpression(_ ad: GADFullScreenPresentingAd) {
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("<AMR Demo> - [I] - Fullscreen ad fail to present.")
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("<AMR Demo> - [I] - Fullscreen ad dismissed.")
    }
}

//MARK: - GAMBannerAdLoaderDelegate
extension DFPCustomEventsVC: GAMBannerAdLoaderDelegate {
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        print("<AMR Demo> - [E] - Error: \(error.localizedDescription)")
    }
    
    func adLoader(_ adLoader: GADAdLoader, didReceive bannerView: GAMBannerView) {
        bannerView.frame = CGRect(x: 0, y: 100, width: bannerView.frame.size.width, height: bannerView.frame.size.height)
        view.addSubview(bannerView)
    }
    
    func validBannerSizes(for adLoader: GADAdLoader) -> [NSValue] {
        let adSize = GADAdSizeFromCGSize(CGSize(width: UIScreen.main.bounds.size.width, height: 50))
        return [NSValue(nonretainedObject: adSize)]
    }
}
