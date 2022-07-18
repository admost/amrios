//
//  InAppService.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 2.11.2021.
//

import UIKit
import AMRSDK
import StoreKit

let kInAppServiceProductsLoadedNotification = "kInAppServiceProductsLoadedNotification"
let kInAppServicePurchaseSuccessNotification = "kInAppServicePurchaseSuccessNotification"
let kInAppServiceRestoreSuccessNotification = "kInAppServiceRestoreSuccessNotification"

class InAppService: NSObject, SKPaymentTransactionObserver {
    private var productRequest: SKProductsRequest?
    private var products: [SKProduct]?
    private var product: SKProduct?
    
    static let sharedInstanceVar: InAppService? = {
        var sharedInstance = InAppService()
        return sharedInstance
    }()
    
    class func sharedInstance() -> Self {
        return sharedInstanceVar as! Self
    }
    
    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    func getProducts() -> [SKProduct]? {
        return products
    }
    
    class func start() {
        InAppService.sharedInstance()
    }
    
    class func loadProducts(_ productNames: Set<String>) {
        InAppService.sharedInstance().loadProducts(productNames)
    }
    
    class func purchase(_ product: SKProduct?) {
        InAppService.sharedInstance().purchase(product)
    }
    
    class func restorePurchase() {
        InAppService.sharedInstance().restorePurchases()
    }
    
    func loadProducts(_ productNames: Set<String>) {
        productRequest = SKProductsRequest(productIdentifiers: productNames)
        productRequest?.delegate = self
        productRequest?.start()
    }
    
    func purchase(_ product: SKProduct?) {
        self.product = product
        
        var payment: SKPayment? = nil
        if let product = product {
            payment = SKPayment(product: product)
        }
        SKPaymentQueue.default().add(payment ?? SKPayment())
    }
    
    func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    func uploadReceipt(with transaction: SKPaymentTransaction?) {
        if product == nil {
            return
        }
        
        guard let currencyCode = product?.priceLocale.currencyCode else { return }
        AMRSDK.trackPurchase(transaction?.transactionIdentifier ?? "", currencyCode: currencyCode, amount: product?.price.doubleValue ?? 0)
    }
    
    func loadReceipt() -> Data? {
        if let app = Bundle.main.appStoreReceiptURL {
            return try? Data(contentsOf: app)
        }
        return nil
    }
    
    //MARK: - SKPaymentTransactionObserver
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                print("<AMR Demo> - [I] - Attempting to purchase for product id: \(transaction.payment.productIdentifier)")
            case .purchased:
                print("<AMR Demo> - [I] - Purchased for product id: \(transaction.payment.productIdentifier)")
                postNotification(kInAppServicePurchaseSuccessNotification)
                uploadReceipt(with: transaction)
                queue.finishTransaction(transaction)
            case .restored:
                print("<AMR Demo> - [I] - Restored for product id: \(transaction.payment.productIdentifier)")
                uploadReceipt(with: transaction)
                postNotification(kInAppServicePurchaseSuccessNotification)
                queue.finishTransaction(transaction)
            case .failed:
                print("<AMR Demo> - [I] - Failed for product id: \(transaction.payment.productIdentifier)")
            case .deferred:
                print("<AMR Demo> - [I] - Deferred for product id: \(transaction.payment.productIdentifier)")
            default:
                break
            }
        }
    }
    
    func postNotification(_ event: String?) {
        NotificationCenter.default.post(
            name: NSNotification.Name(event ?? ""),
            object: nil,
            userInfo: nil)
    }
}

//MARK: - SKProductsRequestDelegate
extension InAppService: SKProductsRequestDelegate {
    @objc func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        products = response.products
        postNotification(kInAppServiceProductsLoadedNotification)
    }
}
