//
//  vehicleViewCell.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/5/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.

import UIKit

class vehicleViewCell: UITableViewCell {

    var vehicles:[Vehicle] = []
    
    var item: detailItem? {
        didSet {
           guard let item = item as? vehicleDetailItem else {return}
            item.vehicles.forEach{
                vehicles.append($0)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
