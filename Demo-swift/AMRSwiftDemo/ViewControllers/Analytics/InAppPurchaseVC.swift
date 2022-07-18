//
//  InAppPurchaseVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 27.10.2021.
//

import UIKit
import AMRSDK
import StoreKit

class InAppPurchaseVC: UIViewController, UITableViewDataSource, SKPaymentTransactionObserver {
    @IBOutlet weak var tableView: UITableView!
    
    private var productIDs: [String] = ["test_auto_renew_1", "test_consumable_1"]
    private var products: [SKProduct]?
    private var productRequest: SKProductsRequest?
    private var selectedProduct: SKProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SKPaymentQueue.default().add(self)
        loadProducts()
    }
    
    func loadProducts() {
        let productIdentifiers = Set<AnyHashable>(productIDs)
        if let productIdentifiers = productIdentifiers as? Set<String> {
            productRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
        }
        productRequest?.delegate = self
        productRequest?.start()
    }
    
    //MARK: - SKPaymentTransactionObserver
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                print("<AMR Demo> - [I] - SKPaymentTransactionStatePurchasing")
            case .deferred:
                print("<AMR Demo> - [I] - SKPaymentTransactionStateDeferred")
            case .purchased:
                print("<AMR Demo> - [I] - SKPaymentTransactionStatePurchased")
                
                guard let currencyCode = selectedProduct?.priceLocale.currencyCode else { return }
                
                AMRSDK.trackIAP(transaction.transactionIdentifier!, currencyCode: currencyCode, amount: selectedProduct!.price.doubleValue, tags: [])
                
            case .failed:
                print("<AMR Demo> - [I] - SKPaymentTransactionStateFailed")
            case .restored:
                print("<AMR Demo> - [I] - SKPaymentTransactionStateRestored")
            default:
                break
            }
        }
    }
}

//MARK: - UITableViewDelegate
extension InAppPurchaseVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let product = products?[indexPath.row]
        cell?.textLabel?.text = product?.localizedTitle
        
        if #available(iOS 10.0, *) {
            var amount: String? = nil
            if let price = product?.price, let currencyCode = product?.priceLocale.currencyCode {
                amount = "\(price) \(currencyCode)"
            }
            cell?.detailTextLabel?.text = amount
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProduct = products![indexPath.row]
        let payment = SKPayment(product: products![indexPath.row])
        SKPaymentQueue.default().add(payment)
    }
}

//MARK: - SKProductsRequestDelegate
extension InAppPurchaseVC: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        products = response.products
        
        DispatchQueue.main.async(execute: { [self] in
            tableView.reloadData()
        })
    }
}
