//
//  GameAudioType.swift
//  EpicRPS
//
//  Created by Apple M1 on 13.06.2024.
//

import Foundation

enum GameAudioType: String {
    case wav = "wav"
    case mp3 = "mp3"
    
    var `extension`: String {
        switch self {
        case .wav: 
            return "wav"
        case .mp3:
            return "mp3"
        }
    }
}
