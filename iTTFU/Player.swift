//
//  Player.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/7/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import Foundation

class Player {
//    var firstName: NSString?
//    var lastName: NSString?
//    var nickname: NSString?
    var playerName = ""
    let year = 2018
    let gender = ""
    let grade = "C-"
    var goals = 0
    var assists = 0
    var notes: String? = nil
    
    init(playerName: NSString, year: Int, gender: NSString, grade: NSString) {
        self.playerName = playerName
        self.year = year
        self.gender = gender
        self.grade = grade
    }
    
    init() {
        playerName = ""
        
    }
    
    func addNotes(notes: String) {
        self.notes! = notes
    }
}