//
//  RemoteConfigTVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 10.11.2021.
//

import UIKit
import AMRSDK
import CoreMedia

class RemoteConfigTVC: UITableViewController {
    @IBOutlet weak var stringValueLabel: UILabel!
    @IBOutlet weak var numberValueLabel: UILabel!
    @IBOutlet weak var boolValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchRemoteConfigWithCompletion(completionHandler:(AMRError) -> Void) {
        AMRSDK.fetchRemoteConfig { [self] error in
            if let error = error {
                print("<AMR Demo> - [E] - error: \(error.errorCode)")
            } else {
                stringValueLabel.text = "Username : \(String(describing: AMRSDK.getConfigForKey("username")?.stringValue()))"
                numberValueLabel.text = "Usercoin : \(String(describing: AMRSDK.getConfigForKey("userCoin")?.number()))"
                boolValueLabel.text = "isPremium : \(String(describing: AMRSDK.getConfigForKey("isPremium")?.boolValue()))"
            }
        }
    }
}
