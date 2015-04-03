//
//  Team.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/7/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import Foundation

enum Color {
    
    case Red,Blue,Yellow,Green,White,Black,Brown,Purple,Orange,Pink
}

class Team {
    var teamName = ""
    var teamColor: Color = .White
    var teamCaptain: Player
    var teamCaptainName = ""
    var teamRoster = NSMutableArray()
    var teamWins = 0
    var teamLosses = 0
//    var teamSchedule = NSMutableArray()
    
    init(teamName: NSString, teamColor: Color, teamCaptain: Player) {
        self.teamName = teamName
        self.teamColor = teamColor
        self.teamCaptain = teamCaptain
        teamRoster.addObject(teamCaptain)
        teamCaptainName = teamCaptain.playerName
    }
    
//    init(teamName: NSString, teamColor: NSString, teamCaptainName: NSString) {
//        self.teamName = teamName
//        self.teamColor = teamColor
//        self.teamCaptainName = teamCaptainName
//        teamRoster.addObject(teamCaptainName)
//    }
    
    init(teamName: String, teamColor: Color, teamCaptain: Player, teamRoster: NSMutableArray, teamWins: Int, teamLosses: Int/*, teamSchedule: NSMutableArray*/) {
        self.teamName = teamName
        self.teamColor = teamColor
        self.teamCaptain = teamCaptain
        self.teamCaptainName = teamCaptain.playerName
//        self.teamRoster = teamRoster
        self.teamWins = teamWins
        self.teamLosses = teamLosses
//        self.teamSchedule = teamSchedule
    }
    func addPlayer(newPlayer: Player) {
        teamRoster.addObject(newPlayer)
    }
    
//    func setUpSchedule() {
//        print("setting up schedule\n")
//    }
    
    func saveTeamData() {
        var teamData = PFObject(className:"Team")
        teamData["teamName"] = teamName
        teamData["teamColor"] = colorToHex(teamColor)
//        teamData["teamCaptain"] = teamCaptain
//        teamData["teamRoster"] = teamRoster
        teamData["teamCaptainName"] = teamCaptainName
        teamData["teamWins"] = teamWins
        teamData["teamLosses"] = teamLosses
//        teamData["teamSchedule"] = teamSchedule
        teamData.saveInBackground()
    }
    
    func getData() {
        var query = PFQuery(className:"Team")
        query.getObjectInBackgroundWithId("xWMyZEGZ") {
            (team: PFObject!, error: NSError!) -> Void in
            if error == nil {
                NSLog("%@", team)
            } else {
                NSLog("%@", error)
            }
        }
    }
    
    func colorToHex(colorValue: Color) -> Int { //Find hex value of a Color
        switch colorValue {
        case .Red:
            return 16711680 //FF0000
        case .Yellow:
            return 16776960 //FFFF00
        case .Blue:
            return 255 //0000FF
        case .Green:
            return 65280 //00FF00
        case .White:
            return 16119285 //F5F5F5
        case .Black:
            return 0 //000000
        case .Brown:
            return 7029286 //6B4226
        case .Purple:
            return 10170623 //9B30FF
        case .Orange:
            return 16753920 //FFA500
        case .Pink:
            return 16738740 //FF69B4
        default:
            return -1
        }
    }
    
    func hexToColor(hexValue: Int) -> Color { //finds Color from hex value
        switch hexValue {
        case 16711680:
            return .Red
        case 16776960:
            return .Yellow
        case 255:
            return .Blue
        case 65280:
            return .Green
        case 16119285:
            return .White
        case 0:
            return .Black
        case 7029286:
            return .Brown
        case 10170623:
            return .Purple
        case 16753920:
            return .Orange
        case 16738740:
            return .Pink
        default:
            print("unknown color")
            exit(1)
        }
    }
    
    func reloadTeamData() {
//        var query = PFQuery(className:"Team")
//        query.whereKey("teamName", containedIn: teamName)
//            query.
//            (gameScore: PFObject!, error: NSError!) -> Void in
//            if error == nil {
//                NSLog("%@", gameScore)
//            } else {
//                NSLog("%@", error)
//            }
//        }
    }
}