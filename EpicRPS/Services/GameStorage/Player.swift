//
//  Player.swift
//  EpicRPS
//
//  Created by Apple M1 on 11.06.2024.
//

import Foundation

protocol PlayerProtocol: AnyObject {
    var name: String { get set }
    var avatar: String { get set }
    var wins: Int { get set }
    var losses: Int { get set }
}

class Player: PlayerProtocol {
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
