//
//  BannerDataSource.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 1.11.2021.
//

import UIKit
import AMRSDK

private let kAMRBannerFrequency = 5
private let kAMRNumberOfBannersToPreload = 2

class BannerDataSource: NSObject {
    var rawDataWithBanners: [Any] = []
    weak var tableView: UITableView?
    let zoneId: String!
    let bannerSize: AMRBannerSize!
    
    init(tableView: UITableView, zoneId: String, bannerSize: AMRBannerSize) {
        rawDataWithBanners = []
        
        self.tableView = tableView
        self.zoneId = zoneId
        self.bannerSize = bannerSize
    }
    
    deinit {
        resetBanners()
    }
    
    func resetBanners() {
        rawDataWithBanners.removeAll()
    }
    
    func addBannersToRawData(rawData: [Any]!) {
        var offsetIndex = (rawDataWithBanners.count - 1) - lastBannerIndex()
        if offsetIndex < 0 {
            offsetIndex = 0
        }
        
        for i in 0..<(rawData.count) {
            rawDataWithBanners.append(rawData![i])
            if (i + 1 + offsetIndex) % kAMRBannerFrequency == 0 && i > 0 {
                rawDataWithBanners.append(BannerPlaceHolder(type: BannerPlaceHolderType.new))
            }
        }
    }
    
    func dataForIndexPath(indexPath: IndexPath) -> Any {
        return rawDataWithBanners[indexPath.row]
    }
    
    func isAd(indexPath: IndexPath) -> Bool {
        if rawDataWithBanners[indexPath.row] is BannerPlaceHolder ||
            rawDataWithBanners[indexPath.row] is AMRBanner {
            return true
        }
        return false
    }
    
    func isAdLoaded(indexPath: IndexPath) -> Bool {
        if rawDataWithBanners[indexPath.row] is AMRBanner {
            let banner = rawDataWithBanners[indexPath.row] as! AMRBanner
            
            if banner.bannerView != nil {
                return true
            }
        }
        return false
    }
    
    func isAdFailed(indexPath: IndexPath) -> Bool {
        if rawDataWithBanners[indexPath.row] is BannerPlaceHolder {
            let placeHolder = rawDataWithBanners[indexPath.row] as! BannerPlaceHolder
            
            if placeHolder.type == BannerPlaceHolderType.failed {
                return true
            }
        }
        return false
    }
    
    func indexPathForBanner(banner: AMRBanner) -> IndexPath? {
        var index: Int?
        
        for i in 0..<rawDataWithBanners.count {
            if rawDataWithBanners[i] is AMRBanner {
                if rawDataWithBanners[i] as! AMRBanner == banner {
                    index = i
                }
            }
        }
        if let index = index {
            return IndexPath(row: index, section: 0)
        }
        return nil
    }
    
    func lastBannerIndex() -> Int {
        var i = rawDataWithBanners.count - 1
        while i >= 0 {
            if (rawDataWithBanners[i] is BannerPlaceHolder) ||
                (rawDataWithBanners[i] is AMRBanner) {
                return i
            }
            i -= 1
        }
        return 0
    }
    
    class func bannerHeight(for bannerSize: AMRBannerSize) -> CGFloat {
        switch bannerSize {
        case AMRBannerSize.height50:
            return 50
        case AMRBannerSize.height90:
            return 90
        case AMRBannerSize.height250:
            return 250
        default:
            return 50
        }
    }
}

enum BannerPlaceHolderType {
    case new, failed
}

class BannerPlaceHolder {
    var type: BannerPlaceHolderType?
    
    init(type: BannerPlaceHolderType) {
        self.type = type;
    }
}

//MARK: AMRBannerDelegate
extension BannerDataSource: AMRBannerDelegate {
    func didClick(_ banner: AMRBanner!) {
    }
    
    func didReceive(_ banner: AMRBanner!) {
        let indexPath = self.indexPathForBanner(banner: banner)
        
        if let indexPath = indexPath {
            if tableView?.indexPathsForVisibleRows?.contains(indexPath) ?? false {
                tableView?.reloadRows(at: [indexPath], with: .none)
            }
        }
    }
    
    func didFail(toReceive banner: AMRBanner!, error: AMRError!) {
        let indexPath = self.indexPathForBanner(banner: banner)
        
        if let indexPath = indexPath {
            rawDataWithBanners[indexPath.row] = BannerPlaceHolder(type: BannerPlaceHolderType.failed)
            
            if tableView?.indexPathsForVisibleRows?.contains(indexPath) ?? false {
                tableView?.reloadRows(at: [indexPath], with: .none)
            }
        }
    }
}

//MARK: - UITableViewDelegate
extension BannerDataSource: UITableViewDelegate {
    func tableViewDidScroll() {
        let indexPathsForVisibleRows = tableView?.indexPathsForVisibleRows
        let highestRowNum = indexPathsForVisibleRows?.last?.row
        var preloadedBanners = 0
        
        for i in (highestRowNum ?? 0)..<rawDataWithBanners.count {
            if preloadedBanners == kAMRNumberOfBannersToPreload {
                break
            }
            
            let object = rawDataWithBanners[i]
            
            if isAd(indexPath: IndexPath(row: i, section: 0)) {
                preloadedBanners += 1
            }
            
            if (object is BannerPlaceHolder) && (object as? BannerPlaceHolder)?.type == BannerPlaceHolderType.new {
                let banner = AMRBanner(forZoneId: zoneId)
                banner?.bannerWidth = UIScreen.main.bounds.size.width
                banner?.delegate = self
                rawDataWithBanners[(rawDataWithBanners as NSArray).index(of: object)] = banner as Any
                banner?.load()
            }
        }
    }
    
    func numberOfRows() -> Int {
        return rawDataWithBanners.count
    }
    
    func heightForRow(at indexPath: IndexPath!) -> CGFloat {
        if isAdLoaded(indexPath: indexPath) {
            return BannerDataSource.bannerHeight(for: bannerSize)
        }
        
        if isAdFailed(indexPath: indexPath) {
            return 0
        }
        return 20
    }
    
    func cellForRow(at indexPath: IndexPath) -> UITableViewCell! {
        var cell = tableView?.dequeueReusableCell(withIdentifier: "BannerTableViewAdCell") as? BannerTableViewAdCell
        
        if cell == nil {
            cell = BannerTableViewAdCell(style: .default, reuseIdentifier: "BannerTableViewAdCell")
        }
        
        return cell
    }
    
    func willDisplay(cell: UITableViewCell!, forRowAt indexPath: IndexPath!) {
        if (rawDataWithBanners[indexPath?.row ?? 0] is BannerPlaceHolder) {
            if (rawDataWithBanners[indexPath.row] as? BannerPlaceHolder)?.type == BannerPlaceHolderType.new {
                let banner = AMRBanner(forZoneId: zoneId)
                banner?.bannerWidth = UIScreen.main.bounds.size.width
                banner?.delegate = self
                rawDataWithBanners[indexPath.row] = banner as Any
                banner?.load()
            }
        } else if (rawDataWithBanners[indexPath?.row ?? 0] is AMRBanner) {
            let banner = rawDataWithBanners[indexPath?.row ?? 0] as? AMRBanner
            if banner?.bannerView != nil {
                (cell as? BannerTableViewAdCell)?.bannerView = banner?.bannerView
            }
        }
    }
}
