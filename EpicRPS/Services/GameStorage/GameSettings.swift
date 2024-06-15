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
    private let settingsKey = Key.settings.rawValue
    private let roundTimeKey = Key.roundTime.rawValue
    private let backgroundMusicKey = Key.backgroundMusic.rawValue
    
    enum Key: String {
        case settings
        case roundTime
        case backgroundMusic
    }
    
    private init() {}
}

// MARK: - Load & save Round time
extension GameSettings {
    var roundTimeInSeconds: Float {
        get {
            let settings = storage.dictionary(forKey: settingsKey) ?? [:]
            
            if let roundTime = settings[roundTimeKey] as? Float, roundTime > 0.0 {
                return roundTime
            } else {
                return K.maxRoundTime
            }
        }
        set (newTime) {
            var settings = storage.dictionary(forKey: settingsKey) ?? [:]
            settings[roundTimeKey] = newTime
            storage.set(settings, forKey: settingsKey)
        }
    }
}

// MARK: - Load & save Background music
extension GameSettings {
    var backgroundMusic: String {
        get {
            let settings = storage.dictionary(forKey: settingsKey) ?? [:]
            let backgroundMusic = settings[backgroundMusicKey] as? String ?? K.Sounds.background1
            return backgroundMusic
        }
        set (newMusic) {
            var settings = storage.dictionary(forKey: settingsKey) ?? [:]
            settings[backgroundMusicKey] = newMusic
            storage.set(settings, forKey: settingsKey)
        }
    }
}
