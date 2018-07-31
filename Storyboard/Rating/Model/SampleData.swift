//
//  SampleData.swift
//  Rating
//
//  Created by Dwi Ariyanto on 7/24/18.
//  Copyright © 2018 Dwi Ariyanto. All rights reserved.
//

import Foundation

final class SampleData{
    static func generatePlayerData() -> [Player]{
        return [
            Player(name: "Name1", game: "Game 1", rating: 2),
            Player(name: "Name2", game: "Game 2", rating: 4),
            Player(name: "Name3", game: "Game 3", rating: 5),
        ]
    }
}
