//
//  GameAudioType.swift
//  EpicRPS
//
//  Created by Apple M1 on 13.06.2024.
//

import Foundation

enum GameAudioType {
    case wav
    case mp3
    
    var `extension`: String {
        switch self {
        case .wav: 
            return "wav"
        case .mp3:
            return "mp3"
        }
    }
}
