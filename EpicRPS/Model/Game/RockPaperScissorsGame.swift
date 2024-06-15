//
//  RockPaperScissorsGame.swift
//  EpicRPS
//
//  Created by Apple M1 on 11.06.2024.
//

import Foundation

class RockPaperScissorsGame {
    
    // MARK: - Game Properties
    
    var maxWins = K.maxWins
    
    var playerScore = 0
    var opponentScore = 0
    
    // MARK: - Game delegates
    
    weak var delegate: GameOverProtocol?
    
    // MARK: - Play Game
    
    func play(playerSymbol: GameSymbol, opponentSymbol: GameSymbol) {
        if playerSymbol == opponentSymbol {
            return
        }
        
        switch (playerSymbol, opponentSymbol) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            playerScore += 1
        default:
            opponentScore += 1
        }
        
        checkPlayersScore()
    }
    
    func roundTimeout() {
        opponentScore += 1
        checkPlayersScore()
    }
    
    private func checkPlayersScore() {
        if playerScore >= maxWins || opponentScore >= maxWins {
            endGame()
        }
    }
    
    // MARK: - End Game
    
    private func endGame() {
        let finalResult = getResult()
        delegate?.gameDidEnd(playerScore, opponentScore, finalResult)
        resetGame()
    }
    
    private func getResult() -> GameResult {        
        return playerScore > opponentScore ? .win : .lose
    }
    
    private func resetGame() {
        playerScore = 0
        opponentScore = 0
    }
}
