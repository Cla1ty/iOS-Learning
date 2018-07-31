//
//  PlayerDetailsViewController.swift
//  Rating
//
//  Created by Dwi Ariyanto on 7/24/18.
//  Copyright © 2018 Dwi Ariyanto. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    
    var player: Player?
    
    var game: String = "Chees" {
        didSet{
            detailLabel.text = game
        }
    }

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue){
        if let gamePickViewController = segue.source as? GamePickerViewController,
            let selectedGame = gamePickViewController.selectedGame {
            game = selectedGame
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail",
            let playerName = nameTextField.text {
            player = Player(name: playerName, game: game, rating: 1)
        }
        if segue.identifier == "PickGame",
            let gamePickerViewController = segue.destination as? GamePickerViewController {
            gamePickerViewController.selectedGame = game
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("Init PlayerDetailViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("Deinit PlayerDetailController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension PlayerDetailsViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
}
