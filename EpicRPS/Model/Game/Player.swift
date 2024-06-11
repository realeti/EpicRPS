//
//  Player.swift
//  EpicRPS
//
//  Created by Apple M1 on 11.06.2024.
//

import Foundation

class Player {
    var name: String
    var avatar: String
    var wins: Int
    var losses: Int
    
    init(name: String, avatar: String, wins: Int, losses: Int) {
        self.name = name
        self.avatar = avatar
        self.wins = wins
        self.losses = losses
    }
}
