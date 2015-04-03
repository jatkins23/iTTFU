//
//  RosterTableViewController.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/11/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class RosterTableViewController: UITableViewController {
    
    var team: Team!
    var roster: [Player] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        initializeTestData()
        self.view.backgroundColor = UIColor(netHex: team!.colorToHex(team!.teamColor))
        self.title = team!.teamName
        
        for var i = 0; i < team!.teamRoster.count; i++ {
            roster.append(team!.teamRoster[i] as Player)
        }
        roster.sort({$0.playerName < $1.playerName})

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return team!.teamRoster.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> RosterTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RosterTableViewCell", forIndexPath: indexPath) as RosterTableViewCell

        let object = roster[indexPath.row] as Player
        cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        cell.playerNameLabel.text = object.playerName + " (" + String(object.year) + ")"
        cell.playerGradeLabel.text = object.grade

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        if segue.identifier == "Roster-Player Segue" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let player = roster[indexPath.row] as Player
                //                let teamName = team.teamName
                let controller = segue.destinationViewController as PlayerViewController
                controller.player = player
                //set new detail controller team
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        // Pass the selected object to the new view controller.
    }
    
//    func initializeTestData() {
//        team = Team(teamName: "Red Team", teamColor: .Red, teamCaptain: Player(playerName: "Rachel", year: 2017, gender: "Female", grade: "B+"))
//        team!.addPlayer(Player(playerName: "Tyler", year: 2015, gender: "Male", grade: "A+"))
//        team!.addPlayer(Player(playerName: "Qxhna", year: 2015, gender: "Female", grade: "A+"))
//        team!.addPlayer(Player(playerName: "Walton", year: 2016, gender: "Male", grade: "B+"))
//        team!.addPlayer(Player(playerName: "Briana", year: 2015, gender: "Female", grade: "B-"))
//        team!.addPlayer(Player(playerName: "Owen", year: 2017, gender: "Male", grade: "B+"))
//    }

}
