//
//  AMRBannerDataSource.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 1.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit
import AMRSDK

let kAMRBannerFrequency = 5
let kAMRNumberOfBannersToPreload = 2

class AMRBannerDataSource: NSObject, AMRBannerDelegate {
    var _rawDataWithBanners: NSMutableArray = []
    weak var _tableView: UITableView!
    var _zoneId: String
    var _bannerSize: AMRBannerSize
    
    // MARK: NSObject
    init(tableView: UITableView, zoneId: String, bannerSize: AMRBannerSize) {
        _tableView = tableView
        _zoneId = zoneId
        _bannerSize = bannerSize
    }
    
    deinit {
        resetBanners()
    }
    
    // MARK: Data preparation
    func resetBanners() {
        _rawDataWithBanners.removeAllObjects()
    }
    
    func addBannersToRawData(rawData: [AnyObject]) {
        if (rawData.count == 0) {return}
        
        var offsetIndex = (_rawDataWithBanners.count - 1) - lastBannerIndex()
        
        if (offsetIndex < 0) {
            offsetIndex = 0
        }
        
        // add banner placeholder after each kAMRBannerFrequency items.
        for index in stride(from: 0, to: rawData.count, by: +1) {
            _rawDataWithBanners.add(rawData[index])
            
            if ((index+1+offsetIndex) % kAMRBannerFrequency == 0 && index > 0) {
                _rawDataWithBanners.add(AMRBannerPlaceHolder.init(type: AMRBannerPlaceHolderType.New))
            }
        }
    }
    
    // Mark: Data methods
    func data(indexPath: IndexPath) -> Any {
        return _rawDataWithBanners[indexPath.row]
    }
    
    func isAd(indexPath: IndexPath) -> Bool {
        if (_rawDataWithBanners[indexPath.row] is AMRBannerPlaceHolder ||
            _rawDataWithBanners[indexPath.row] is AMRBanner) {
            return true
        }
        
        return false
    }
    
    func isAdLoaded(indexPath: IndexPath) -> Bool {
        if (_rawDataWithBanners[indexPath.row] is AMRBanner) {
            let banner = _rawDataWithBanners[indexPath.row] as! AMRBanner
            
            // if banner is loaded use its bannerview
            if (banner.bannerView != nil) {
                return true
            }
        }
        
        return false
    }
    
    func isAdFailed(indexPath: IndexPath) -> Bool {
        if (_rawDataWithBanners[indexPath.row] is AMRBannerPlaceHolder) {
            let placeHolder = _rawDataWithBanners[indexPath.row] as! AMRBannerPlaceHolder
            
            if (placeHolder.type == AMRBannerPlaceHolderType.Failed) {
                return true
            }
        }
        
        return false
    }
    
    func indexPathForBanner(banner: AMRBanner) -> IndexPath {
        let index = _rawDataWithBanners.index(of: banner)
        
        if (index != NSNotFound) {
            return IndexPath.init(item: index, section: 0)
        }
        
        return IndexPath.init()
    }
    
    //Mark: <UITableViewDelegate, UITableViewDataSource>
    func tableViewDidScroll() {
        let indexPathsForVisibleRows = _tableView.indexPathsForVisibleRows
        if let highestRowNum = indexPathsForVisibleRows?.last?.row {
            var preloadedBanners = 0
            for index in highestRowNum..._rawDataWithBanners.count-1 {
                if (preloadedBanners == kAMRNumberOfBannersToPreload) {
                    break
                }
                
                let object = _rawDataWithBanners[index]
                
                // if banner incerement preloadedBanners count
                if (isAd(indexPath: IndexPath.init(item: index, section: 0))) {
                    preloadedBanners = preloadedBanners + 1
                }
                
                if (object is AMRBannerPlaceHolder) {
                    let placeHolder = object as! AMRBannerPlaceHolder
                    
                    if (placeHolder.type == AMRBannerPlaceHolderType.New) {
                        let banner = AMRBanner.init(forZoneId: _zoneId)
                        banner?.delegate = self
                        _rawDataWithBanners.replaceObject(at: _rawDataWithBanners.index(of:object), with: banner as Any)
                        banner?.load()
                        
                        print("WILL PRELOAD \(preloadedBanners) - \(index)")
                    }
                }
            }
        }
    }
    
    func numberOfRows() -> NSInteger {
        return _rawDataWithBanners.count
    }
    
    func heightForRowAtIndexPath(indexPath: IndexPath) -> CGFloat {
        if (isAdLoaded(indexPath: indexPath)) {
            // Loaded, return zone banner height; 50, 90 or 250.
            return AMRBannerDataSource.bannerHeight(size: _bannerSize)
        }
        
        if (isAdFailed(indexPath: indexPath)) {
            // Failed to load, return 0, hide cell.
            return 0
        }
        
        // Not loaded, return a placeholder height, 0 or content height.
        return 20.0
    }
    
    func cellForRowAtIndexPath(indexPath: IndexPath) -> UITableViewCell {
        var cell = _tableView.dequeueReusableCell(withIdentifier: "BannerTableViewAdCell")
        
        if (cell == nil) {
            cell = BannerTableVAdCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "BannerTableViewAdCell")
        }
        
        return cell!
    }
    
    func willDisplayCell(cell: BannerTableVAdCell, indexPath: IndexPath) {
        //load banner for placeholder object
        if (_rawDataWithBanners[indexPath.row] is AMRBannerPlaceHolder) {
            let placeHolder = _rawDataWithBanners[indexPath.row] as! AMRBannerPlaceHolder
            
            if (placeHolder.type == AMRBannerPlaceHolderType.New) {
                let banner = AMRBanner.init(forZoneId: _zoneId)
                banner?.delegate = self
                _rawDataWithBanners.replaceObject(at: indexPath.row, with: banner!)
                banner?.load()
            }
        } else if (_rawDataWithBanners[indexPath.row] is AMRBanner) {
            let banner = _rawDataWithBanners[indexPath.row] as! AMRBanner
            // if banner is loaded use its bannerview
            if (banner.bannerView != nil) {
                cell.bannerView = banner.bannerView
            }
        }
    }
    
    
    // Mark: <AMRBannerDelegate>
    func didReceive(_ banner: AMRBanner!) {
        // reload cell if visible;
        let indexPath = indexPathForBanner(banner: banner)
        if (_tableView.indexPathsForVisibleRows?.contains(indexPath))! {
            _tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        }
    }
    
    func didFail(toReceive banner: AMRBanner!, error: AMRError!) {
        // mark banner is failed
        let indexPath = indexPathForBanner(banner: banner)
        _rawDataWithBanners.replaceObject(at: indexPath.row, with: banner as Any)
        
        // reload cell if visible
        if (_tableView.indexPathsForVisibleRows?.contains(indexPath))! {
            _tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        }
    }
    
    // Mark: Utilities
    func lastBannerIndex() -> Int {
        for index in stride(from: _rawDataWithBanners.count-1, through: 0, by: -1) {
            if (_rawDataWithBanners[index] is AMRBannerPlaceHolder ||
                _rawDataWithBanners[index] is AMRBanner) {
                return index
            }
        }
        
        return 0
    }
    
    static func bannerHeight(size:AMRBannerSize) -> CGFloat {
        switch size {
        case AMRBannerSize.height50:
            return 50.0
        case AMRBannerSize.height90:
            return 90.0
        case AMRBannerSize.height250:
            return 250.0
        }
    }
}


enum AMRBannerPlaceHolderType {
    case New
    case Failed
}

class AMRBannerPlaceHolder: NSObject {
    var type: AMRBannerPlaceHolderType
    
    init(type: AMRBannerPlaceHolderType) {
        self.type = type
    }
}






