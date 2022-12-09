//
//  ChatTableViewCell.swift
//  XMPPChat
//
//  Created by Patel Meet on 08/12/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var chatImageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgViewHeightConstarint: NSLayoutConstraint!
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var checkMarkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
