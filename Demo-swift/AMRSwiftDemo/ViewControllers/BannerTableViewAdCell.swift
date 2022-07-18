//
//  BannerTableViewAdCell.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 1.11.2021.
//

import UIKit

class BannerTableViewAdCell: UITableViewCell {
    
    var bannerView: UIView? {
        didSet {
            if let newBannerView = self.bannerView {
                self.addSubview(newBannerView)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        bannerView?.removeFromSuperview()
        super.prepareForReuse()
    }
}
