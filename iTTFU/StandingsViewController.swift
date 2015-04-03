//
//  StandingsViewController.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/6/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(0.3))
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

import UIKit

class StandingsViewController: UITableViewController {
    var teamList: [Team] = []
    var detailViewController: TeamViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "League Standings"
//        teamList = manager?.standings.teamList!
        initializeTestData()
        teamList.sort({$0.teamWins > $1.teamWins})
//        saveAllData()
//        teamList.removeAllObjects()
//        retrieveData()
//        self.reloadData()
//        print(teamList)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Parse
    
    func reloadData() {
        for var i = 0; i < teamList.count; i++ {
            let team = teamList[i] as Team
            team.reloadTeamData()
        }
    }
    
    func retrieveData() {
        var query = PFQuery(className: "Team")
        query.orderByDescending("objectId")
        
        query.findObjectsInBackgroundWithBlock ({(objects, error) in
            if(error == nil){
                for teamData : PFObject in objects as [PFObject] {
//                    print(teamData)
                    var newTeam = Team(teamName: "", teamColor: .White, teamCaptain: Player(playerName: "", year: 0, gender: "", grade: ""))
                    if let name = teamData["teamName"] as? String {
                        newTeam.teamName = name
                    }
                    if let color = teamData["teamColor"] as? Int {
                        newTeam.teamColor = newTeam.hexToColor(color)
                    }
                    if let captainName = teamData["teamCaptainName"] as? String {
                        newTeam.teamCaptainName = captainName
                    }
                    if let roster = teamData["teamRoster"] as? NSMutableArray {
                        newTeam.teamRoster = roster
                    }
                    if let wins = teamData["teamWins"] as? Int {
                        newTeam.teamWins = wins
                    }
                    if let losses = teamData["teamLosses"] as? Int {
                        newTeam.teamLosses = losses
                    }
//                    if let schedule = teamData["teamSchedule"] as? NSMutableArray {
//                        newTeam.teamSchedule = schedule
//                    }
                    print(newTeam.teamName)
                    self.teamList.append(newTeam)
                    self.teamList.sort({$0.teamWins < $1.teamWins})
//                    })//getDataInBackgroundWithBlock - end
                    
                }//for - end
                self.reloadData()
            }
            else{
                println("Error in retrieving \(error)")
            }
            
        })//findObjectsInBackgroundWithblock - end
    }
    
    func saveAllData() {
        for var i = 0; i < teamList.count; i++ {
            let team = teamList[i] as Team
            team.saveTeamData()
        }
    }

    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Standings-Team Segue" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let team = teamList[indexPath.row] as Team
//                let teamName = team.teamName
                let controller = (segue.destinationViewController as UINavigationController).topViewController as TeamViewController
                controller.team = team
                //set new detail controller team
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    //MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> StandingsTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StandingsTableViewCell", forIndexPath: indexPath) as StandingsTableViewCell
        
        let object = teamList[indexPath.row] as Team
        cell.teamNameLabel.text = object.teamName
        cell.teamRecordLabel.text = String(object.teamWins) + " - " + String(object.teamLosses)
        
        cell.backgroundColor = UIColor(netHex: object.colorToHex(object.teamColor))
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            
////            teamList.removeObjectAtIndex(indexPath.row)
////            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//            
//            // Do I need this?
//        }
//    }
    
    func initializeTestData() {
        teamList.append(Team(teamName: "Blue Team", teamColor: .Blue, teamCaptain: Player(playerName: "Jon", year: 2016, gender: "Male", grade: "C+")))
        teamList.append(Team(teamName: "Green Team", teamColor: .Green, teamCaptain: Player(playerName: "Jesse", year: 2017, gender: "Male", grade: "A-")))
        teamList.append(Team(teamName: "Red Team", teamColor: .Red, teamCaptain: Player(playerName: "Rachel", year: 2017, gender: "Female", grade: "B+")))
        teamList.append(Team(teamName: "Orange Team", teamColor: .Orange, teamCaptain: Player(playerName: "Remy", year: 2016, gender: "Male", grade: "B-")))
        
        let blueTeam = teamList[0] as Team
        let greenTeam = teamList[1] as Team
        let redTeam = teamList[2] as Team
        let orangeTeam = teamList[3] as Team
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
    }
    
}
