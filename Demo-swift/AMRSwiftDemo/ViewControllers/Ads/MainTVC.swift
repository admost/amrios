//
//  MainTVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 27.10.2021.
//

import UIKit
import AdSupport

class MainTVC: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarTransparent(true)
        
        let lblSDKVersion = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        lblSDKVersion.backgroundColor = .clear
        lblSDKVersion.textAlignment = NSTextAlignment.center
        lblSDKVersion.numberOfLines = 0
        lblSDKVersion.textColor = .black
        
        let sdkVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        lblSDKVersion.text = "Admost version: \(sdkVersion)"
        tableView.tableFooterView = lblSDKVersion
    }
}

extension UINavigationController {
    func setNavigationBarTransparent(_ isTransparent: Bool) {
        if isTransparent {
            if #available(iOS 15.0, *) {
                navigationController?.navigationBar.scrollEdgeAppearance = nil
            } else {
                navigationBar.setBackgroundImage(UIImage(), for:.default)
                navigationBar.isTranslucent = false
                navigationBar.shadowImage = UIImage()
            }
        } else {
            if #available(iOS 15.0, *) {
                navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
            } else {
                navigationBar.setBackgroundImage(UINavigationBar.appearance().backgroundImage(for: UIBarMetrics.default), for:.default)
                navigationBar.isTranslucent = UINavigationBar.appearance().isTranslucent
                navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
            }
        }
    }
}
