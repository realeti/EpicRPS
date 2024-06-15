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
    var isGameEnded = false
    
    // MARK: - Game delegates
    
    weak var delegate: GameOverProtocol?
    
    // MARK: - Play Game
    
    func play(playerSymbol: GameSymbol, opponentSymbol: GameSymbol) -> GameRoundResult {
        if playerSymbol == opponentSymbol {
            return .draw
        }
        
        var result: GameRoundResult
        
        switch (playerSymbol, opponentSymbol) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            playerScore += 1
            result = .win
        default:
            opponentScore += 1
            result = .lose
        }
        
        checkPlayersScore()
        return result
    }
    
    func roundTimeout() {
        guard !isGameEnded else { return }
        
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
        isGameEnded = true
        
        delegate?.gameDidEnd(playerScore, opponentScore, finalResult)
        resetGame()
    }
    
    private func getResult() -> GameResult {
        return playerScore > opponentScore ? .win : .lose
    }
    
    private func resetGame() {
        playerScore = 0
        opponentScore = 0
        isGameEnded = false
    }
}
