//
//  detailCell.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/5/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class detailCell: UITableViewCell {

    
    
    @IBOutlet var content: UILabel!
    @IBOutlet var category: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
