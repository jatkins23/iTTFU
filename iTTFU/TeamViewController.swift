//
//  TeamViewController.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/7/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import Foundation
import UIKit

class TeamViewController: UIViewController {
    
    var team: Team!
    
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var captainLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        initializeTestData()
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        self.title = team?.teamName
        self.view.backgroundColor = UIColor(
            netHex: team!.colorToHex(team!.teamColor))
        dataView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5)
        recordLabel.text = "(" + String(team!.teamWins) + " - " + String(team!.teamLosses) + ")"
        captainLabel.text = team!.teamCaptain.playerName
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Team-Roster Segue" {
            let controller = segue.destinationViewController as RosterTableViewController
            controller.team = team
            print(controller.team)

            //set new detail controller team
            controller.navigationItem.leftItemsSupplementBackButton = true
        }
    }
    
}