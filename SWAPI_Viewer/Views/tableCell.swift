//
//  listCell.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/4/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        icon?.layer.cornerRadius = 20
        icon?.clipsToBounds = false
        icon?.contentMode = .scaleAspectFit
        icon?.backgroundColor = UIColor.black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

        // Configure the view for the selected state
    }

}
