//
//  BannerTVC.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 1.11.2021.
//

import UIKit
import AMRSDK

private let kAMRBannerZoneId = "1b65e016-5b26-4ba0-aff5-b500a96d5157"

class BannerTVC: UIViewController {
    @IBOutlet weak var tbMain: UITableView!
    var bannerDataSource: BannerDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerDataSource = BannerDataSource(tableView: tbMain, zoneId: kAMRBannerZoneId, bannerSize: AMRBannerSize.height250)
        
        // fetch raw data
        addMoreData(self)
    }
    
    //MARK: - Actions
    @IBAction func addMoreData(_ sender: Any) {
        // fetch raw data
        let news = dictionaryWithJSONFile(fileName: "news")?["news"]
        bannerDataSource.addBannersToRawData(rawData: (news! as! [Any]))
        
        tbMain.reloadData()
    }
    
    //MARK: - Util
    func dictionaryWithJSONFile(fileName: String) -> Dictionary<String, Any>? {
        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    print(object)
                    return object
                }
            } else {
                return nil
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
        return nil
    }
}

//MARK: - UITableViewDelegate
extension BannerTVC: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        bannerDataSource.tableViewDidScroll()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (bannerDataSource.isAd(indexPath: indexPath)) {
            return bannerDataSource.heightForRow(at: indexPath)
        }
        
        return 90
    }
}

//MARK: -  UITableViewDataSource
extension BannerTVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bannerDataSource.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if bannerDataSource.isAd(indexPath: indexPath) {
            return bannerDataSource.cellForRow(at: indexPath)
        }
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewDataCell")
        
        if (cell == nil) {
            cell = BannerTableViewDataCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "BannerTableViewDataCell")
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if bannerDataSource.isAd(indexPath: indexPath) {
            bannerDataSource.willDisplay(cell: cell, forRowAt: indexPath)
        } else {
            let newsItem = bannerDataSource.dataForIndexPath(indexPath: indexPath) as! Dictionary<String, Any>
            
            (cell as! BannerTableViewDataCell).LBLHeader.text = newsItem["header"] as? String
            (cell as! BannerTableViewDataCell).LBLBody.text = newsItem["body"] as? String
            (cell as! BannerTableViewDataCell).IMGImage.image = UIImage(named: newsItem["image"] as! String)
        }
    }
}
