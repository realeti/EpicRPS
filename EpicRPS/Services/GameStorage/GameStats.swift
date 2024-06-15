//
//  GameStats.swift
//  EpicRPS
//
//  Created by Apple M1 on 15.06.2024.
//

import Foundation

final class GameStats {
    // MARK: - Singleton Instance
    static let shared = GameStats()
    
    // MARK: - Properties
    private let storage = UserDefaults.standard
    
    // MARK: - Keys
    private let playersKey = Key.players.rawValue
    private let playerNameKey = Key.playerName.rawValue
    private let opponentNameKey = Key.opponentName.rawValue
    
    private let nameKey = PlayerDataKey.name.rawValue
    private let avatarKey = PlayerDataKey.avatar.rawValue
    private let winsKey = PlayerDataKey.wins.rawValue
    private let lossesKey = PlayerDataKey.losses.rawValue
    
    enum Key: String {
        case players
        case playerName
        case opponentName
    }
    
    enum PlayerDataKey: String {
        case name
        case avatar
        case wins
        case losses
    }
    
    // MARK: - Local Player name
    var playerName: String {
        get {
            return storage.string(forKey: playerNameKey) ?? K.defaultPlayerName
        }
        set (newName) {
            storage.set(newName, forKey: playerNameKey)
        }
    }
    
    // MARK: - Local Opponent name
    var opponentName: String {
        get {
            return storage.string(forKey: opponentNameKey) ?? K.defaultOpponentName
        }
        set (newName) {
            storage.set(newName, forKey: opponentNameKey)
        }
    }
    
    // MARK: - Load Player data
    func loadPlayerData(_ playerName: String) -> PlayerProtocol? {
        guard let playerData = storage.dictionary(forKey: playersKey)?[playerName] as? [String: Any] else {
            return nil
        }
        
        guard let name = playerData[nameKey] as? String,
              let avatar = playerData[avatarKey] as? String,
              let wins = playerData[winsKey] as? Int,
              let losses = playerData[lossesKey] as? Int else {
            return nil
        }
        
        let player = Player(name: name, avatar: avatar, wins: wins, losses: losses)
        return player
    }
    
    // MARK: - Save Player data
    func savePlayerData(_ player: PlayerProtocol) {
        var playersDictionary = storage.dictionary(forKey: playersKey) as? [String: [String: Any]] ?? [:]
        
        playersDictionary[player.name] = [
            nameKey: player.name,
            avatarKey: player.avatar,
            winsKey: player.wins,
            lossesKey: player.losses
        ]
        
        storage.set(playersDictionary, forKey: playersKey)
    }
    
    // MARK: - Load all Players
    func loadAllPlayers() -> [PlayerProtocol] {
        guard let playersDictionary = storage.dictionary(forKey: playersKey) as? [String: [String: Any]] else {
            return []
        }
        
        var players: [PlayerProtocol] = []
        
        for playerData in playersDictionary.values {
            guard let name = playerData[nameKey] as? String,
                  let avatar = playerData[avatarKey] as? String,
                  let wins = playerData[winsKey] as? Int,
                  let losses = playerData[lossesKey] as? Int else {
                continue
            }
            
            let player = Player(name: name, avatar: avatar, wins: wins, losses: losses)
            players.append(player)
        }
        
        return players
    }
}
