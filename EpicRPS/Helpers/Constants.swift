//
//  Constants.swift
//  EpicRPS
//
//  Created by Apple M1 on 10.06.2024.
//

import UIKit

struct K {
    static let fontName = "Rubik-Regular"
    
    static let centerYView = UIScreen.main.bounds.height / 2
    static let backgroundColorRpsButtonLayer = "blueBackground"
    static let widthRpsButtonLayer: CGFloat = 80
    static let rockImageRpsButton = "rock"
    static let paperImageRpsButton = "paper"
    static let scissorsImageRpsButton = "scissors"
    static let leadingTrailingOffsetRpsButton: CGFloat = 16
    static let bottomOffsetPaperButton: CGFloat = 80
    static let bottomOffsetRockScissorsButton: CGFloat = 30
    static let heightProgress: CGFloat = 10
    static let widthTimerProgress: CGFloat = 166
    static let sizeTitleLabel: CGFloat = 25
    static let sizeTimerLabel: CGFloat = 12
    static let leadingOffsetTimerLabel: CGFloat = 22
    static let topOffsetTimerLabel: CGFloat = 85
    static let leadingTimerProgress: CGFloat = 48
    static let trailingScoreProgress: CGFloat = 44
    static let widthScoreProgress: CGFloat = 147
    static let topBottomOffsetScoreProgress = UIScreen.main.bounds.height / 2 + 68
    static let topSeparator = centerYView
    static let heightSeparator: CGFloat = 1
    static let widthSeparator: CGFloat = 18
    static let trailingSeparator: CGFloat = 20.5
    static let widthGamerAvatar: CGFloat = 35.85
    static let heightGamerAvatar: CGFloat = 41.38
    static let topOffsetPlayerAvatar: CGFloat = centerYView + widthScoreProgress - heightGamerAvatar / 2
    static let bottomOffsetOpponentImage: CGFloat = centerYView - widthScoreProgress - heightGamerAvatar / 2
    static let trailingOffsetGamerImage: CGFloat = 11.5
    static let topBottomOffsetHands: CGFloat = 45
    static let leadingOffsetOpponentHand: CGFloat = 62.56
    static let trailingOffsetPlayerHand: CGFloat = 77.06
    
    private init() {}
}
