//
//  AppDelegate.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 25.10.2021.
//

import UIKit
import AMRSDK
import Adjust


@main
class AppDelegate: UIResponder, UIApplicationDelegate, AdjustDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //GDPR COMPLIANCE
        // Set user myUniqueUserId
        AMRSDK.setUserId("<applicationUserId>")
        
        AMRSDK.isPrivacyConsentRequired { (consentStatus) in
            
        }

        // Set user consent before startWithAppId
        AMRSDK.setUserConsent(true)
        AMRSDK.subject(toGDPR: false)
        AMRSDK.subject(toCCPA: false)
        AMRSDK.setUserChild(true)
        
        // demo app id "15066ddc-9c18-492c-8185-bea7e4c7f88c"
        AMRSDK.start(withAppId: "15066ddc-9c18-492c-8185-bea7e4c7f88c") { error in
            // your app logic.
        }
        
        // Adjust Integration
        // Replace <yourAdjustAppToken> with your Adjust app token.
        let yourAppToken = "<yourAdjustAppToken>"

        // Replace environment from ADJEnvironmentSandbox to ADJEnvironmentProduction before publishing.
        let environment = ADJEnvironmentSandbox
        let adjustConfig = ADJConfig(appToken: yourAppToken, environment: environment)
        adjustConfig?.delegate = self

        Adjust.appDidLaunch(adjustConfig)
        
        return true
    }
}

