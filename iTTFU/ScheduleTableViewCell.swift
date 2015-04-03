//
//  ScheduleTableViewCell.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/11/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    @IBOutlet weak var team1View: UIView!
    @IBOutlet weak var team1Name: UILabel!
    
    @IBOutlet weak var team2View: UIView!
    @IBOutlet weak var team2Name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
