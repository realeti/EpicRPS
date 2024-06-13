//
//  GameAudio.swift
//  EpicRPS
//
//  Created by Apple M1 on 13.06.2024.
//

import AVFoundation

protocol GameAudioProtocol: AnyObject {
    var backgroundMusicPlayer: AVAudioPlayer? { get }
    var selectSymbolMusicPlayer: AVAudioPlayer? { get }
    var punchMusicPlayer: AVAudioPlayer? { get }
    
    func prepareLoadAudio()
    func playBackgroundMusic()
    func playSelectSymbolMusic()
    func stopBackgroundMusic()
}

final class GameAudio: GameAudioProtocol {
    static let shared = GameAudio()
    
    var backgroundMusicPlayer: AVAudioPlayer?
    var selectSymbolMusicPlayer: AVAudioPlayer?
    var punchMusicPlayer: AVAudioPlayer?
    
    // MARK: - Prepeare loadings
    
    func prepareLoadAudio() {
        backgroundMusicPlayer = loadAudio(
            fileName: "123",
            fileType: .wav,
            loops: -1,
            volume: 0.8
        )
        
        selectSymbolMusicPlayer = loadAudio(
            fileName: "321",
            fileType: .wav
        )
        
        punchMusicPlayer = loadAudio(
            fileName: "333",
            fileType: .wav
        )
    }
    
    // MARK: - Play Background music
    
    func playBackgroundMusic() {
        backgroundMusicPlayer?.play()
    }
    
    // MARK: - Play Select Symbol music
    
    func playSelectSymbolMusic() {
        selectSymbolMusicPlayer?.stop()
        selectSymbolMusicPlayer?.currentTime = 0.0
        selectSymbolMusicPlayer?.play()
    }
    
    // MARK: - Stop Background music
    
    func stopBackgroundMusic() {
        backgroundMusicPlayer?.stop()
    }
    
    // MARK: - Load Audio
        
    private func loadAudio(fileName: String, fileType: GameAudioType, loops: Int = 0, volume: Float = 1.0) -> AVAudioPlayer? {
        let audioUrl = Bundle.main.url(forResource: fileName, withExtension: fileType.extension)
        
        guard let audioUrl else { return nil }
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
            
            audioPlayer.volume = volume
            audioPlayer.numberOfLoops = loops
            audioPlayer.prepareToPlay()
            
            return audioPlayer
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}