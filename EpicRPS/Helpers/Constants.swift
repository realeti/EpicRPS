//
//  Constants.swift
//  EpicRPS
//
//  Created by Apple M1 on 10.06.2024.
//

import Foundation
import UIKit

struct K {
    static let fontName = "Rubik-Regular"
    static let fontMedium500 = "Rubik-Medium"
    static let fontBold700 = "Rubik-Bold"
    static let centerYView = UIScreen.main.bounds.height / 2
    static let sizeTitleLabel: CGFloat = 25
    static let backgroundGameVC = "backgroundGameVC"
    static let gameStatusLabelFontSize: CGFloat = 56
    static let backgroundLoadVC = "backgroundLoadVC"
    static let playerLabelFontSize: CGFloat = 19.5
    
    
    // MARK: - Game Properties
    
    static let maxWins = 3
    static let maxRoundTime: Float = 30.0
    static let gameTitle = "Игра"
    static let gameFight = "FIGHT!"
    static let gamePause = "PAUSE"
    static let gameDraw = "DRAW"
    
    // MARK: - Game Storage
    
    static let defaultPlayerName = "Player"
    static let defaultOpponentName = "Ryan Gosling"
    
    // MARK: - Player avatars
    
    static let defaultPlayerAvatar = "player"
    static let defaultOpponentAvatar = "opponent"
    
    // MARK: - Game Sounds
    
    enum Sounds {
        static let background1 = "background-music-1"
        static let background2 = "background-music-2"
        static let selectSymbol = "select-symbol"
        static let punch = "punch"
    }
    
    enum RPSButton {
        static let widthRpsButtonLayer: CGFloat = 80
        static let rockImageRpsButton = "rock"
        static let paperImageRpsButton = "paper"
        static let scissorsImageRpsButton = "scissors"
        static let leadingTrailingOffsetRpsButton: CGFloat = 16
        static let bottomOffsetPaperButton: CGFloat = 80
        static let bottomOffsetRockScissorsButton: CGFloat = 30
        
        enum Image {
            static let rock: UIImage = .rock
            static let paper: UIImage = .paper
            static let scissors: UIImage = .scissors
        }
    }
    
    enum TimerProgress {
        static let heightTimerProgress: CGFloat = 10
        static let widthTimerProgress: CGFloat = 166
        static let leadingTimerProgress: CGFloat = 48.25
    }
    
    enum TimerLabel {
        static let sizeTimerLabel: CGFloat = 12
        static let leadingOffsetTimerLabel: CGFloat = 20
        static let topOffsetTimerLabel: CGFloat = 85
        static let widthTimerLabel: CGFloat = 30
    }
    
    enum ScoreProgress {
        static let trailingScoreProgress: CGFloat = 44
        static let widthScoreProgress: CGFloat = 147
        static let topBottomOffsetScoreProgress = UIScreen.main.bounds.height / 2 + 68
    }
    
    enum Separator {
        static let topSeparator = centerYView
        static let heightSeparator: CGFloat = 1
        static let widthSeparator: CGFloat = 18
        static let trailingSeparator: CGFloat = 20.5
    }
    
    enum GamerAvatar {
        static let widthGamerAvatar: CGFloat = 35.85
        static let heightGamerAvatar: CGFloat = 41.38
        static let topOffsetPlayerAvatar: CGFloat = centerYView + ScoreProgress.widthScoreProgress - heightGamerAvatar / 2
        static let bottomOffsetOpponentAvatar: CGFloat = centerYView - ScoreProgress.widthScoreProgress - heightGamerAvatar / 2
        static let trailingOffsetGamerAvatar: CGFloat = 11.5
        
        enum Image {
            static let player = UIImage(named: "player")
            static let opponent = UIImage(named: "opponent")
        }
        
        enum AvatarName {
            static let char1 = "character"
            static let char2 = "character-2"
            static let char3 = "character-3"
            static let char4 = "character-4"
            static let char5 = "character-5"
            static let char6 = "character-6"
            static let char7 = "character-7"
            static let char8 = "character-8"
        }
    }
    
    enum Hands {
        static let topBottomOffsetHands: CGFloat = 45
        static let leadingOffsetOpponentHand: CGFloat = 62.56
        static let trailingOffsetPlayerHand: CGFloat = 77.06
        
        enum Player {
            static let rock = UIImage(named: "playerRock")
            static let paper = UIImage(named: "playerPaper")
            static let scissors = UIImage(named: "playerScissors")
            static let start = UIImage(named: "playerStart")
        }
        
        enum Opponent {
            static let rock = UIImage(named: "opponentRock")
            static let paper = UIImage(named: "opponentPaper")
            static let scissors = UIImage(named: "opponentScissors")
            static let start = UIImage(named: "opponentStart")
        }
    }
    
    enum Colors {
        static let blue: UIColor = .blueRPS
        static let gray: UIColor = .grayRPS
        static let green: UIColor = .greenRPS
        static let yellow: UIColor = .yellowRPS
        static let marine: UIColor = .marine
    }
    
    private init() {}
}
