//
//  GameViewController.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/11/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var game: Game?

    @IBOutlet weak var team1NameLabel: UILabel!
    @IBOutlet weak var team1View: UIView!
    @IBOutlet weak var team1ScoreLabel: UILabel!

    
    @IBOutlet weak var team2NameLabel: UILabel!
    @IBOutlet weak var team2View: UIView!
    @IBOutlet weak var team2ScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        initiateTestData()

        // Do any additional setup after loading the view.
        if ((game) != nil) {
            configureView()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
        team1NameLabel.text = game!.team1.teamName
        team2NameLabel.text = game!.team2.teamName
        team1View.backgroundColor = UIColor(netHex: game!.team1.colorToHex(game!.team1.teamColor))
        team2View.backgroundColor = UIColor(netHex: game!.team2.colorToHex(game!.team2.teamColor))
        team1ScoreLabel.text = String(game!.team1Score)
        team2ScoreLabel.text = String(game!.team2Score)
    }
    
    @IBAction func team1ScoreButtonTap(sender: AnyObject) {
        game!.team1Score++
        team1ScoreLabel.text = String(game!.team1Score)
        
        //maybe do with a table alert view later
        game!.teamWhoLastScored = 1
        performSegueWithIdentifier("Game-ScoreSelect Segue", sender: self)
    }
    
    
    @IBAction func team2ScoreButtonTap(sender: AnyObject) {
        game!.team2Score++
        team2ScoreLabel.text = String(game!.team2Score)
        game!.teamWhoLastScored = 2
        performSegueWithIdentifier("Game-ScoreSelect Segue", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Game-ScoreSelect Segue" {
            let controller = segue.destinationViewController as ScoreSelectTableViewController
            controller.game = game
            controller.scorerSelecting = true
        }
        else if segue.identifier == "Game-GameStats Segue" {
            let controller = segue.destinationViewController as GameStatsTableViewController
            controller.game = game
            controller.navigationItem.leftItemsSupplementBackButton = true
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func initiateTestData() {
            let teamList: [Team] = []
            
            let blueTeam = Team(teamName: "Blue Team", teamColor: .Blue, teamCaptain: Player(playerName: "Jon", year: 2016, gender: "Male", grade: "C+"))
            let greenTeam = Team(teamName: "Green Team", teamColor: .Green, teamCaptain: Player(playerName: "Jesse", year: 2017, gender: "Male", grade: "A-"))
            let redTeam = Team(teamName: "Red Team", teamColor: .Red, teamCaptain: Player(playerName: "Rachel", year: 2017, gender: "Female", grade: "B+"))
            let orangeTeam = Team(teamName: "Orange Team", teamColor: .Orange, teamCaptain: Player(playerName: "Remy", year: 2016, gender: "Male", grade: "B-"))
            
            blueTeam.teamWins = 6
            blueTeam.teamLosses = 1
            
            redTeam.teamWins = 4
            redTeam.teamLosses = 3
            
            greenTeam.teamWins = 2
            greenTeam.teamLosses = 5
            
            orangeTeam.teamWins = 2
            orangeTeam.teamLosses = 5
            
            game = Game(team1: redTeam, team2: blueTeam, date: NSDate())
            //Game(team1: greenTeam, team2: orangeTeam, date: NSDate())
    }

}
