//
//  PhotoCell.swift
//  InstagramApp
//
//  Created by Palak Jadav on 3/12/17.
//  Copyright © 2017 com.codepath. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PhotoCell: UITableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var photoImageView: PFImageView!
    
    var userPost: PFObject! {
        
        // Set picture into image view and set caption
        didSet {
            
            self.photoImageView.file = userPost["media"] as? PFFile
            self.photoImageView.loadInBackground()
            
            self.captionLabel.text = userPost["caption"] as? String
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
