//
//  SubscriptionVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 2.11.2021.
//

import UIKit
import AMRSDK
import StoreKit

class SubscriptionVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var products: [SKProduct]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSubscriptions()
    }
    
    func loadSubscriptions() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleProductsLoadedNotification),
            name: Notification.Name.init(rawValue: kInAppServiceProductsLoadedNotification),
            object: nil)
        
        InAppService.loadProducts(["test_auto_renew_1", "test_consumable_1"])
    }
    
    @objc func handleProductsLoadedNotification() {
        products = InAppService.sharedInstance().getProducts()
        
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate
extension SubscriptionVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

// MARK: - UITableViewDataSource
extension SubscriptionVC: UITableViewDataSource {
    static let tableViewIdientifier = "ProductCell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: SubscriptionVC.tableViewIdientifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: SubscriptionVC.tableViewIdientifier)
        }
        
        let product = products?[indexPath.row]
        
        let numberFormatter = NumberFormatter()
        numberFormatter.formatterBehavior = .behavior10_4
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = product?.priceLocale
        var formattedPrice: String? = nil
        if let price = product?.price {
            formattedPrice = numberFormatter.string(from: price)
        }
        
        cell?.textLabel?.text = product?.localizedTitle
        cell?.detailTextLabel?.text = formattedPrice
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products?[indexPath.row]
        
        InAppService.purchase(product)
    }
}
