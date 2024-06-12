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
    
    // MARK: - Game Properties
    
    static let maxWins = 3
    static let maxRoundTime: Float = 30.0
    
    enum RPSButton {
        static let widthRpsButtonLayer: CGFloat = 80
        static let rockImageRpsButton = "rock"
        static let paperImageRpsButton = "paper"
        static let scissorsImageRpsButton = "scissors"
        static let leadingTrailingOffsetRpsButton: CGFloat = 16
        static let bottomOffsetPaperButton: CGFloat = 80
        static let bottomOffsetRockScissorsButton: CGFloat = 30
    }
    
    enum TimerProgress {
        static let heightTimerProgress: CGFloat = 10
        static let widthTimerProgress: CGFloat = 166
        static let leadingTimerProgress: CGFloat = 48
    }
    
    enum TimerLabel {
        static let sizeTimerLabel: CGFloat = 12
        static let leadingOffsetTimerLabel: CGFloat = 22
        static let topOffsetTimerLabel: CGFloat = 85
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
    }
    
    enum Hands {
        static let topBottomOffsetHands: CGFloat = 45
        static let leadingOffsetOpponentHand: CGFloat = 62.56
        static let trailingOffsetPlayerHand: CGFloat = 77.06
    }
    
    enum Colors {
        static let blue: UIColor = .blueRPS
        static let gray: UIColor = .grayRPS
        static let green: UIColor = .greenRPS
        static let yellow: UIColor = .yellowRPS
    }
    
    private init() {}
}
