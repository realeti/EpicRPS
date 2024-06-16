//
//  GameStats.swift
//  EpicRPS
//
//  Created by Apple M1 on 15.06.2024.
//

import Foundation

protocol GameStatsProtocol {
    var playerName: String { get set }
    var opponentName: String { get set }
    
    func loadPlayerData(_ playerName: String, isOpponent: Bool) -> PlayerProtocol?
    func savePlayerData(for player: PlayerProtocol)
    func loadAllPlayers() -> [PlayerProtocol]
}

final class GameStats: GameStatsProtocol {
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
}

// MARK: - Load & save Player name
extension GameStats {
    var playerName: String {
        get {
            return storage.string(forKey: playerNameKey) ?? K.defaultPlayerName
        }
        set (newName) {
            storage.set(newName, forKey: playerNameKey)
        }
    }
}

// MARK: - Load & save Opponent name
extension GameStats {
    var opponentName: String {
        get {
            return storage.string(forKey: opponentNameKey) ?? K.defaultOpponentName
        }
        set (newName) {
            storage.set(newName, forKey: opponentNameKey)
        }
    }
}

// MARK: - Load Player data
extension GameStats {
    
    func loadPlayerData(_ playerName: String, isOpponent: Bool = false) -> PlayerProtocol? {
            guard let playerData = storage.dictionary(forKey: playersKey)?[playerName] as? [String: Any] else {
                let avatar = isOpponent ? K.defaultOpponentAvatar : K.defaultPlayerAvatar
                let mockPlayer = Player(name: playerName, avatar: avatar, wins: 0, losses: 0)
                return mockPlayer
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
}

// MARK: - Save Player data
extension GameStats {
    func savePlayerData(for player: PlayerProtocol) {
        var playersDictionary = storage.dictionary(forKey: playersKey) as? [String: [String: Any]] ?? [:]
        
        playersDictionary[player.name] = [
            nameKey: player.name,
            avatarKey: player.avatar,
            winsKey: player.wins,
            lossesKey: player.losses
        ]
        
        storage.set(playersDictionary, forKey: playersKey)
    }
}

// MARK: - Load all Players
extension GameStats {
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
