//
//  GameSettings.swift
//  EpicRPS
//
//  Created by Apple M1 on 15.06.2024.
//

import Foundation

protocol GameSettingsProtocol {
    var roundTimeInSeconds: Float { get set }
    var backgroundMusic: String { get set }
}

final class GameSettings: GameSettingsProtocol {
    // MARK: - Singleton Instance
    static let shared = GameSettings()
    
    // MARK: - Properties
    private let storage = UserDefaults.standard
    
    // MARK: - Keys
    private let gameTimeKey = Key.roundTime.rawValue
    private let backgroundMusicKey = Key.backgroundMusic.rawValue
    
    enum Key: String {
        case roundTime
        case backgroundMusic
    }
    
    private init() {}
}

// MARK: - Load & save Round time
extension GameSettings {
    var roundTimeInSeconds: Float {
        get {
            let roundTime = storage.float(forKey: gameTimeKey)
            return roundTime > 0.0 ? roundTime : K.maxRoundTime
        }
        set {
            storage.set(newValue, forKey: gameTimeKey)
        }
    }
}

// MARK: - Load & save Background music
extension GameSettings {
    var backgroundMusic: String {
        get {
            return storage.string(forKey: backgroundMusicKey) ?? K.Sounds.background1
        }
        set {
            storage.set(newValue, forKey: backgroundMusicKey)
        }
    }
}
