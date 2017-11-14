//
//  labelCell.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/5/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class labelCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    var name:String?
    var item: detailItem? {
        didSet {
            guard let item = item as? labelDetailItem else {
                return
            }
            label.text = item.label
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
