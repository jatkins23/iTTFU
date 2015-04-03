//
//  RosterTableViewCell.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/11/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class RosterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerGradeLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
