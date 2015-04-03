//
//  PlayerViewController.swift
//  iTTFU
//
//  Created by Jon Atkins on 12/11/14.
//  Copyright (c) 2014 AIT. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var player: Player!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(player.playerName)
        playerNameLabel.text = player.playerName
        if player.gender == "Male" {
            let maleImage = UIImage(named: "Generic_Male_Avatar.jpg")
            playerImageView.image =  maleImage
        }
        else if player.gender == "Female" {
            let femaleImage = UIImage(named: "Generic_Female_Avatar.jpg")
            playerImageView.image =  femaleImage
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
