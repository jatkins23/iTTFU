//
//  ScoreSelectTableViewController.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/14/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class ScoreSelectTableViewController: UITableViewController {

    var game: Game!
    var team: Team!

    //true if selecting the scorer, false if selecting the assister
    var scorerSelecting: Bool!
    var roster: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if scorerSelecting! {
            self.title = "Who Scored?"
        }
        else {
            self.title = "Who Made the Assist?"
        }
        
        if game!.teamWhoLastScored == 1 {
            team = game!.team1
        }
        else if game!.teamWhoLastScored == 2 {
            team = game!.team2
        }
        self.view.backgroundColor = UIColor(netHex: team!.colorToHex(team!.teamColor))
        for var i = 0; i < team!.teamRoster.count; i++ {
            roster.append(team!.teamRoster[i] as Player)
        }
        if scorerSelecting! {
            roster.sort({$0.goals > $1.goals})
        }
        else {
            roster.sort({$0.assists > $1.assists})
        }

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
        return roster.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> RosterTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RosterTableViewCell", forIndexPath: indexPath) as RosterTableViewCell
        
        let player = roster[indexPath.row] as Player
        cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        cell.playerNameLabel.text = player.playerName + " (" + String(player.year) + ")"
        if scorerSelecting! {
            cell.playerGradeLabel.text = String(player.goals)
        }
        else {
            cell.playerGradeLabel.text = String(player.assists)
        }
        
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
        if segue.identifier == "ScoreSelect-AssistSelect Segue" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let player = roster[indexPath.row] as Player
                player.goals++
                let controller = segue.destinationViewController as ScoreSelectTableViewController
                
                controller.scorerSelecting = false
                controller.game = game
                // Get the new view controller using [segue destinationViewController].
                // Pass the selected object to the new view controller.
            }
        }
        else if segue.identifier == "AssistSelect Unwind Segue" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let player = roster[indexPath.row] as Player
                player.assists++
                let controller = segue.destinationViewController as GameViewController
                
                controller.game = game
                // Get the new view controller using [segue destinationViewController].
                // Pass the selected object to the new view controller.
                
                // with correct unwind segue, store a "state" variable that here we set to a different value that tells us that we are in the unwinding state, so that the first thing that happens once this unwinds to the ScoreSelectTable is the ScoreSelectTable unwinds back to the game
            }
        }
    }

}
