//
//  GameStatsTableViewCell.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/15/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class GameStatsTableViewCell: UITableViewCell {

    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerGoalsLabel: UILabel!
    @IBOutlet weak var playerAssistsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
