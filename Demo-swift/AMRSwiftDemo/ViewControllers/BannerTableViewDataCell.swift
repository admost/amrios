//
//  BannerTableViewDataCell.swift
//  AMRSwiftDemo
//
//  Created by Melih Cüneyter on 1.11.2021.
//

import UIKit

class BannerTableViewDataCell: UITableViewCell {
    
    @IBOutlet weak var LBLHeader: UILabel!
    @IBOutlet weak var LBLBody: UILabel!
    @IBOutlet weak var IMGImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
