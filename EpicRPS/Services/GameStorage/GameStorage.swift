//
//  GameStorage.swift
//  EpicRPS
//
//  Created by Apple M1 on 15.06.2024.
//

import Foundation

enum SettingsField: String {
    case roundTime
    case backgroundMusic
}

struct GameSettings {
    static let shared = GameSettings()
    private let storage = UserDefaults.standard
    
    private let gameTimeKey = SettingsField.roundTime.rawValue
    private let backgroundMusicKey = SettingsField.backgroundMusic.rawValue
    
    private init() {}
    
    var roundTimeInSeconds: Float {
        get {
            let roundTime = storage.float(forKey: gameTimeKey)
            return roundTime > 0.0 ? roundTime : K.maxRoundTime
        }
        set {
            storage.set(newValue, forKey: gameTimeKey)
        }
    }
    
    var backgroundMusic: String {
        get {
            return storage.string(forKey: backgroundMusicKey) ?? K.Sounds.background1
        }
        set {
            storage.set(newValue, forKey: backgroundMusicKey)
        }
    }
}
