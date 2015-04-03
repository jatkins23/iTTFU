//
//  StandingsTableViewCell.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/10/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class StandingsTableViewCell: UITableViewCell {
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamRecordLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
