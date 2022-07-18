//
//  TestSuiteVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 27.10.2021.
//

import UIKit
import AMRSDK

class TestSuiteVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Replace <withAppId> with your AppID
        AMRSDK.startTesterInfo(withAppId: "15066ddc-9c18-492c-8185-bea7e4c7f88c")
    }
    
    //MARK: - Actions
    @IBAction func reloadButton(_ sender: Any) {
        AMRSDK.startTesterInfo(withAppId: "15066ddc-9c18-492c-8185-bea7e4c7f88c")
    }
}
