//
//  GameAudio.swift
//  EpicRPS
//
//  Created by Apple M1 on 13.06.2024.
//

import AVFoundation

protocol GameAudioProtocol {
    var backgroundMusicPlayer1: AVAudioPlayer? { get }
    var backgroundMusicPlayer2: AVAudioPlayer? { get }
    var selectSymbolMusicPlayer: AVAudioPlayer? { get }
    var punchMusicPlayer: AVAudioPlayer? { get }
    
    func prepareLoadAudio()
    func playBackgroundMusic1()
    func playBackgroundMusic2()
    func playSelectSymbolMusic()
    func playPunchMusic()
    func stopBackgroundMusic()
}

final class GameAudio: GameAudioProtocol {
    // MARK: - Singleton Instance
    static let shared = GameAudio()
    
    // MARK: - Properties
    var backgroundMusicPlayer1: AVAudioPlayer?
    var backgroundMusicPlayer2: AVAudioPlayer?
    var selectSymbolMusicPlayer: AVAudioPlayer?
    var punchMusicPlayer: AVAudioPlayer?
    
    private init() {}
    
    // MARK: - Prepeare loadings
    func prepareLoadAudio() {
        prepareBackgroundMusic1()
        prepareBackgroundMusic2()
        prepareSelectSymbolMusic()
        preparePunchMusic()
    }
    
    private func prepareBackgroundMusic1() {
        backgroundMusicPlayer1 = loadAudio(
            fileName: K.Sounds.background1,
            fileType: .wav,
            loops: -1,
            volume: 0.4
        )
    }
    
    private func prepareBackgroundMusic2() {
        backgroundMusicPlayer1 = loadAudio(
            fileName: K.Sounds.background2,
            fileType: .wav,
            loops: -1,
            volume: 0.4
        )
    }
    
    private func prepareSelectSymbolMusic() {
        selectSymbolMusicPlayer = loadAudio(
            fileName: K.Sounds.selectSymbol,
            fileType: .wav
        )
    }
    
    private func preparePunchMusic() {
        punchMusicPlayer = loadAudio(
            fileName: K.Sounds.punch,
            fileType: .wav
        )
    }
    
    // MARK: - Play Background music 1
    func playBackgroundMusic1() {
        backgroundMusicPlayer1?.play()
    }
    
    // MARK: - Play Background music 2
    func playBackgroundMusic2() {
        backgroundMusicPlayer2?.play()
    }
    
    // MARK: - Play Select Symbol music
    func playSelectSymbolMusic() {
        selectSymbolMusicPlayer?.stop()
        selectSymbolMusicPlayer?.currentTime = 0.0
        selectSymbolMusicPlayer?.play()
    }
    
    // MARK: - Play Punch music
    func playPunchMusic() {
        punchMusicPlayer?.play()
    }
    
    // MARK: - Stop Background music
    func stopBackgroundMusic() {
        backgroundMusicPlayer1?.stop()
    }
}

// MARK: - Load Audio
extension GameAudio {
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
