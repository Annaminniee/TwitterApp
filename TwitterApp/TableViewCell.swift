//
//  TableViewCell.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/07/27.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    func setup(username: String, detail: String) {
        usernameLabel.text = username
        detailTextView.text = detail
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
