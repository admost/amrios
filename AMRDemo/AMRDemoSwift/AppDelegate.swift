//
//  AppDelegate.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 1.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit
import AMRSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        AMRSDK.setUserId("myUniqueUserId")
        
        AMRSDK.setLogLevel(AMRLogLevel.levelAll)
        AMRSDK.start(withAppId: "15066ddc-9c18-492c-8185-bea7e4c7f88c")
        AMRSDK.setStatusBarHidden(true)
        
//        AMRSDK.setClearCacheOnTerminate(true)
//        AMRSDK.startTestSuite(withZones: ["b4009772-de04-42c4-bbaa-c18da9e4a1ab",
//                                          "39f74377-5682-436a-9338-9d1c4df410bd",
//                                          "2bdefd44-5269-4cbc-b93a-373b74a2f067"])
        
        //Cache banner zone
//        var banner = AMRBanner.init(forZoneId: "1b65e016-5b26-4ba0-aff5-b500a96d5157")
//        banner?.cacheBanner()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

