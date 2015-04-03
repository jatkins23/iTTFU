//
//  ScheduleTableViewController.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/11/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

//in the future, group the games by date somehow

import UIKit

class ScheduleTableViewController: UITableViewController {
    
    var gameList: [Game] = []
    var detailViewController: GameViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        gameList = manager?.schedule.gameList!
        initializeTestData()
        self.title = "League Schedule"
        print(gameList)
//        gameList.sort({$0.date < $1.date)

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
        return gameList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> ScheduleTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ScheduleTableViewCell", forIndexPath: indexPath) as ScheduleTableViewCell

        let object = gameList[indexPath.row] as Game
        cell.team1View.backgroundColor = UIColor(netHex: object.team1.colorToHex(object.team1.teamColor))
        cell.team1Name.text = object.team1.teamName + "  (" + String(object.team1.teamWins) + " - " + String(object.team1.teamLosses) + ")"
        
        cell.team2View.backgroundColor = UIColor(netHex: object.team2.colorToHex(object.team2.teamColor))
        cell.team2Name.text = "(" + String(object.team2.teamWins) + " - " + String(object.team2.teamLosses) + ")  " + object.team2.teamName
        
        return cell
    }
    
    func addGame(game: Game) {
        gameList.append(game)
        gameList.sort({$0.date.timeIntervalSinceNow > $1.date.timeIntervalSinceNow})
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Schedule-Game Segue" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let game = gameList[indexPath.row] as Game
//                let teamName = team.teamName
                let controller = segue.destinationViewController as GameViewController
                controller.game = game
                //set new detail controller team
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    
    func initializeTestData() {
        let teamList: [Team] = []
        
        let blueTeam = Team(teamName: "Blue Team", teamColor: .Blue, teamCaptain: Player(playerName: "Jon", year: 2016, gender: "Male", grade: "C+"))
        let greenTeam = Team(teamName: "Green Team", teamColor: .Green, teamCaptain: Player(playerName: "Jesse", year: 2017, gender: "Male", grade: "A-"))
        let redTeam = Team(teamName: "Red Team", teamColor: .Red, teamCaptain: Player(playerName: "Rachel", year: 2017, gender: "Female", grade: "B+"))
        let orangeTeam = Team(teamName: "Orange Team", teamColor: .Orange, teamCaptain: Player(playerName: "Remy", year: 2016, gender: "Male", grade: "B-"))
        
        blueTeam.addPlayer(Player(playerName: "Jack", year: 2017, gender: "Male", grade: "B"))
        blueTeam.addPlayer(Player(playerName: "Mia", year: 2014, gender: "Female", grade: "A"))
        blueTeam.addPlayer(Player(playerName: "Hadley", year: 2015, gender: "Female", grade: "B"))
        blueTeam.addPlayer(Player(playerName: "Matt", year: 2016, gender: "Male", grade: "B-"))
        blueTeam.addPlayer(Player(playerName: "Emily", year: 2014, gender: "Female", grade: "A+"))
        
        redTeam.addPlayer(Player(playerName: "Tyler", year: 2015, gender: "Male", grade: "A+"))
        redTeam.addPlayer(Player(playerName: "Qxhna", year: 2015, gender: "Female", grade: "A+"))
        redTeam.addPlayer(Player(playerName: "Walton", year: 2016, gender: "Male", grade: "B+"))
        redTeam.addPlayer(Player(playerName: "Brianna", year: 2015, gender: "Female", grade: "B-"))
        redTeam.addPlayer(Player(playerName: "Owen", year: 2017, gender: "Male", grade: "B+"))
        
        blueTeam.teamWins = 6
        blueTeam.teamLosses = 1
        
        redTeam.teamWins = 4
        redTeam.teamLosses = 3
        
        greenTeam.teamWins = 2
        greenTeam.teamLosses = 5
        
        orangeTeam.teamWins = 2
        orangeTeam.teamLosses = 5
        
        addGame(Game(team1: redTeam, team2: blueTeam, date: NSDate()))
        addGame(Game(team1: greenTeam, team2: orangeTeam, date: NSDate()))

    }
}
