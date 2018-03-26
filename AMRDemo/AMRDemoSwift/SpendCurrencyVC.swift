//
//  SpendCurrencyVC.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 5.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit
import AMRSDK

class SpendCurrencyVC: UIViewController, AMRVirtualCurrencyDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        AMRSDK.setVirtualCurrencyDelegate(nil)
    }

    @IBAction func spend(_ sender: Any) {
        AMRSDK.setVirtualCurrencyDelegate(self)
        AMRSDK.spendVirtualCurrency()
    }

    //Mark: <AMRVirtualCurrencyDelegate>
    func didSpendVirtualCurrency(_ currency: String!, amout amount: NSNumber!, network: AMRNetworkType) {
        let alert = UIAlertController.init(title: "Virtual Currency Spent",
                                           message: "\(amount) \(currency)",
                                            preferredStyle: .alert)
        
        let cancel = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }

}
