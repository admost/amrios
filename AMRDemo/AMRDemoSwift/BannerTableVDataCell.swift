//
//  BannerTableVDataCell.swift
//  AMRDemoSwift
//
//  Created by Mehmet Karagöz on 5.03.2018.
//  Copyright © 2018 Tolga Seremet. All rights reserved.
//

import UIKit

class BannerTableVDataCell: UITableViewCell {

    @IBOutlet weak var LBLHeader: UILabel!
    @IBOutlet weak var LBLBody: UILabel!
    @IBOutlet weak var IMGImage: UIImageView!
    
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
