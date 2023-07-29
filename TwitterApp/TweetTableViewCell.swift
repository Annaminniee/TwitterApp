//
//  TweetTableViewCell.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/07/29.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
        func setup(username: String, detail: String) {
            nameLabel.text = username
            detailLabel.text = detail
        }
    }
}
