//
//  BannerTableVC.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 1.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit
import AMRSDK

let kAMRBannerZoneId = "1b65e016-5b26-4ba0-aff5-b500a96d5157"

class BannerTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbMain: UITableView!
    var _bannerDataSource:AMRBannerDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // initialize banner data source
        _bannerDataSource = AMRBannerDataSource.init(tableView: tbMain,
                                                     zoneId: kAMRBannerZoneId,
                                                     bannerSize: AMRBannerSize.height250)
        
        // fetch raw data
        let news = dictionaryWithJSONFile(fileName: "news").object(forKey: "news")
        
        // add banners to raw data
        _bannerDataSource.addBannersToRawData(rawData: news as! [AnyObject])
        
        // reload tableView with added banners
        tbMain.reloadData()
    }
    
    //Mark: Action
    @IBAction func AddMoreData(_ sender: Any) {
        let news = dictionaryWithJSONFile(fileName: "news").object(forKey: "news")
        _bannerDataSource.addBannersToRawData(rawData: news as! [AnyObject])

        tbMain.reloadData()
    }
    
    //Mark: <UITableViewDelegate>
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        _bannerDataSource.tableViewDidScroll()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (_bannerDataSource.isAd(indexPath: indexPath)) {
            return _bannerDataSource.heightForRowAtIndexPath(indexPath: indexPath)
        }
        
        return 90.0
    }
    
    //Mark: <UITableViewDataSource>
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _bannerDataSource.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (_bannerDataSource.isAd(indexPath: indexPath)) {
            return _bannerDataSource.cellForRowAtIndexPath(indexPath: indexPath)
        } else {
            var cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewDataCell")
            if (cell == nil) {
                cell = BannerTableVDataCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "BannerTableViewDataCell")
            }
            
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (_bannerDataSource.isAd(indexPath: indexPath)) {
            _bannerDataSource.willDisplayCell(cell: cell as! BannerTableVAdCell, indexPath: indexPath)
        } else {
            let newsItem = _bannerDataSource.data(indexPath: indexPath) as! NSDictionary
            
            if let newCell = cell as? BannerTableVDataCell {
                newCell.LBLHeader.text = newsItem.object(forKey: "header") as? String
                newCell.LBLBody.text = newsItem.object(forKey: "body") as? String
                newCell.IMGImage.image = UIImage.init(named: newsItem.object(forKey: "image") as! String)
            }
        }
    }
    
    //Mark: Utils
    func dictionaryWithJSONFile(fileName: String) -> NSDictionary {
        var jsonDict: NSDictionary?
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                jsonDict = jsonResult as? NSDictionary
            } catch {
                
            }
        }
        
        return jsonDict!
    }
}
