//
//  imageCell.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/5/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class imageCell: UITableViewCell {

    @IBOutlet var imgView: UIImageView!
    
    var item: detailItem? {
        didSet {
            guard let item = item as? imageDetailItem  else {
                return
            }
            imgView.image = UIImage(named:"temp")
            imgView.imageFrom(url: item.imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView?.layer.cornerRadius = 50
        imgView?.clipsToBounds = true
        imgView?.contentMode = .scaleAspectFit
        imgView?.backgroundColor = UIColor.black
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
