//
//  GameStatsTableViewController.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/15/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class GameStatsTableViewController: UITableViewController {

    var game: Game!
    
    var _sections: [Section]?
    var sections: [Section] {
        // return if already initialized
        if self._sections != nil {
            return self._sections!
        }
        
        // create empty sections
        var sections = [Section]()
        sections.append(Section())
        sections.append(Section())
        
        for var i = 0; i < game.team1.teamRoster.count; i++ {
            sections[0].addPlayer(game.team1.teamRoster[i] as Player)
        }
        
        for var i = 0; i < game.team2.teamRoster.count; i++ {
            sections[1].addPlayer(game.team2.teamRoster[i] as Player)
        }
        
        // sort each section
        for section in sections {
            section.roster.sort({$0.playerName < $1.playerName})
        }
        
        self._sections = sections
        
        return self._sections!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(netHex: team!.colorToHex(team!.teamColor))
//        self.title = team!.teamName
//        self.tableView.headerViewForSection(1)?.textLabel = game.team1.teamName

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    let collation = UILocalizedIndexedCollation.currentCollation()
        as UILocalizedIndexedCollation
    
    // table sections
    class Section {
        var roster: [Player] = []
        
        func addPlayer(player: Player) {
            self.roster.append(player)
        }
    }
    
    // table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView)
        -> Int {
            return self.sections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return sections[0].roster.count + sections[1].roster.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> GameStatsTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GameStatsTableViewCell", forIndexPath: indexPath) as GameStatsTableViewCell
        
        print(indexPath.section)
        print(", ")
        print(indexPath.row)
        print("\n")

        if indexPath.row < sections[indexPath.section].roster.count {
            let object = sections[indexPath.section].roster[indexPath.row] as Player
            if indexPath.section == 0 {
                    cell.backgroundColor = UIColor(netHex: game.team1.colorToHex(game.team1.teamColor))
            }
            if indexPath.section == 1 {
                cell.backgroundColor = UIColor(netHex: game.team2.colorToHex(game.team2.teamColor))
            }
            cell.playerNameLabel.text = object.playerName + " (" + String(object.year) + ")"
            cell.playerGoalsLabel.text = String(object.assists)
            cell.playerAssistsLabel.text = String(object.goals)
            // Configure the cell...
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return game.team1.teamName
        }
        else if section == 1 {
            return game.team2.teamName
        }
        else {
            return "Wrong Title"
        }
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
        // Pass the selected object to the new view controller.
        if segue.identifier == "GameStats-Player Segue" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let player = sections[indexPath.section].roster[indexPath.row] as Player
                //                let teamName = team.teamName
                let controller = segue.destinationViewController as PlayerViewController
                controller.player = player
                //set new detail controller team
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

}
