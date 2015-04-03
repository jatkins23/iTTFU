//
//  File.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/11/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import Foundation

class Game {
    let team1: Team
    let team2: Team
    let date: NSDate
    
    var team1Score = 0
    var team2Score = 0
    var timeRemaining = 25.0
    
    var teamWhoLastScored: Int! = nil
    
    init(team1: Team, team2: Team, date: NSDate) {
        self.team1 = team1
        self.team2 = team2
        self.date = date
    }
    
    init(team1: Team, team2: Team, gameTime: Double, date: NSDate) {
        self.team1 = team1
        self.team2 = team2
        self.timeRemaining = gameTime
        self.date = date
    }
}