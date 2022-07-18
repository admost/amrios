//
//  SpendCurrencyVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 1.11.2021.
//

import UIKit
import AMRSDK

class SpendCurrencyVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func spend(_ sender: Any) {
        AMRSDK.setVirtualCurrencyDelegate(self)
        AMRSDK.spendVirtualCurrency()
    }
}

extension SpendCurrencyVC: AMRVirtualCurrencyDelegate {
    func didSpendVirtualCurrency(_ currency: String, amount: NSNumber, networkName: String) {
        let message = "\(networkName ): \(amount) - \(currency)"
        let alert = UIAlertController(title: "Virtual Currency Spent",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.present(self, animated: true, completion: nil)
    }
}
