//
//  BannerTableVAdCell.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 5.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit

class BannerTableVAdCell: UITableViewCell {

    var bannerView: UIView! {
        didSet {
            self.addSubview(bannerView)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        if (bannerView != nil) {
            bannerView.removeFromSuperview()
        }
        
        super.prepareForReuse()
    }
}
