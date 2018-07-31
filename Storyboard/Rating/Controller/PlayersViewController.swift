//
//  PlayerViewControllerTableViewController.swift
//  Rating
//
//  Created by Dwi Ariyanto on 7/24/18.
//  Copyright © 2018 Dwi Ariyanto. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    var players = SampleData.generatePlayerData()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell

        let player = players[indexPath.row]
        cell.player = player
            
        return cell
    }
}

extension PlayersViewController{
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {}
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        guard let playerDetailsViewController = segue.source as? PlayerDetailsViewController,
        let player = playerDetailsViewController.player else {
            return
        }
        
        players.append(player)
        
        let indexPath = IndexPath(row: players.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
    }
}
