//
//  ChatTableViewCell.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-03-18.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
