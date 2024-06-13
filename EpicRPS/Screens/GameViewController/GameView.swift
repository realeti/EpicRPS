//
//  GameView.swift
//  EpicRPS
//
//  Created by Алексей on 13.06.2024.
//

import UIKit
import SnapKit

final class GameView: UIView {
    
    // MARK: - UI
    lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
//        element.frame = 
        element.image = UIImage(named: K.backgroundGameVC)
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    lazy var navigationTitleLabel: UILabel = {
        let element = UILabel()
        element.textColor = K.Colors.gray
        element.font = .init(name: K.fontName, size: K.sizeTitleLabel)
        return element
    }()
    lazy var pauseButton: UIBarButtonItem = {
        let element = UIBarButtonItem()
        element.image = .pauseButton
        element.style = .plain
        element.target = self
        return element
    }()
    
    let rockButton = UIButton(image: K.RPSButton.rockImageRpsButton)
    let paperButton = UIButton(image: K.RPSButton.paperImageRpsButton)
    let scissorsButton = UIButton(image: K.RPSButton.scissorsImageRpsButton)
    
    let timerProgress = UIProgressView(progressColor: K.Colors.green)
    lazy var timerLabel: UILabel = {
        let element = UILabel()
        element.font = .init(name: K.fontMedium500, size: K.TimerLabel.sizeTimerLabel)
        element.textColor = .white
        element.sizeToFit()
        return element
    }()
    
    let playerScoreProgress = UIProgressView(
        progressColor: K.Colors.yellow
    )
    let opponentScoreProgress = UIProgressView(
        progressColor: K.Colors.yellow
    )
    lazy var separatorView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        return element
    }()
    
    let playerAvatar = UIImageView(contentMode: .scaleAspectFit)
    let opponentAvatar = UIImageView(contentMode: .scaleAspectFit)
    
    let playerHand = UIImageView(contentMode: .scaleAspectFit)
    let opponentHand = UIImageView(contentMode: .scaleAspectFit)
    
    lazy var gameStatusLabel: UILabel = {
        let element = UILabel()
        element.font = .init(name: K.fontBold700, size: K.gameStatusLabelFontSize)
        element.textColor = K.Colors.yellow
        element.sizeToFit()
        return element
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MARK: - Setup UI
private extension GameView {
    func setupUI() {
        addSubview(backgroundImageView)
        addSubview(opponentHand)
        addSubview(playerHand)
        addSubview(gameStatusLabel)
        addSubview(rockButton)
        addSubview(paperButton)
        addSubview(scissorsButton)
        addSubview(timerProgress)
        addSubview(timerLabel)
        addSubview(playerScoreProgress)
        addSubview(opponentScoreProgress)
        addSubview(separatorView)
        addSubview(playerAvatar)
        addSubview(opponentAvatar)
    }
}

// MARK: - Setup Constraints
private extension GameView {
    func setupConstraints() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        rockButton.snp.makeConstraints {
            $0.width.height.equalTo(K.RPSButton.widthRpsButtonLayer)
            $0.trailing.equalTo(paperButton.snp.leading).offset(-K.RPSButton.leadingTrailingOffsetRpsButton)
            $0.bottom.equalToSuperview().offset(-K.RPSButton.bottomOffsetRockScissorsButton)
        }
        
        paperButton.snp.makeConstraints {
            $0.width.height.equalTo(K.RPSButton.widthRpsButtonLayer)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-K.RPSButton.bottomOffsetPaperButton)
        }
        
        scissorsButton.snp.makeConstraints {
            $0.width.height.equalTo(K.RPSButton.widthRpsButtonLayer)
            $0.leading.equalTo(paperButton.snp.trailing).offset(K.RPSButton.leadingTrailingOffsetRpsButton)
            $0.bottom.equalToSuperview().offset(-K.RPSButton.bottomOffsetRockScissorsButton)
        }
        
        timerProgress.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(K.TimerProgress.heightTimerProgress)
            $0.width.equalTo(K.TimerProgress.widthTimerProgress)
            $0.leading.equalToSuperview().offset(-K.TimerProgress.leadingTimerProgress)
        }
        
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(timerProgress.snp.bottom).offset(K.TimerLabel.topOffsetTimerLabel)
            $0.leading.equalToSuperview().offset(K.TimerLabel.leadingOffsetTimerLabel)
        }
        
        opponentScoreProgress.snp.makeConstraints {
            $0.height.equalTo(K.TimerProgress.heightTimerProgress)
            $0.width.equalTo(K.ScoreProgress.widthScoreProgress)
            $0.trailing.equalToSuperview().offset(K.ScoreProgress.trailingScoreProgress)
            $0.bottom.equalToSuperview().offset(-K.ScoreProgress.topBottomOffsetScoreProgress)
        }
        
        playerScoreProgress.snp.makeConstraints {
            $0.height.equalTo(K.TimerProgress.heightTimerProgress)
            $0.width.equalTo(K.ScoreProgress.widthScoreProgress)
            $0.trailing.equalToSuperview().offset(K.ScoreProgress.trailingScoreProgress)
            $0.top.equalToSuperview().offset(K.ScoreProgress.topBottomOffsetScoreProgress)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(K.Separator.topSeparator)
            $0.width.equalTo(K.Separator.widthSeparator)
            $0.height.equalTo(K.Separator.heightSeparator)
            $0.trailing.equalToSuperview().offset(-K.Separator.trailingSeparator)
        }
        
        opponentAvatar.snp.makeConstraints {
            $0.width.equalTo(K.GamerAvatar.widthGamerAvatar)
            $0.height.equalTo(K.GamerAvatar.heightGamerAvatar)
            $0.trailing.equalToSuperview().offset(-K.GamerAvatar.trailingOffsetGamerAvatar)
            $0.top.equalTo(K.GamerAvatar.bottomOffsetOpponentAvatar)
        }
        
        playerAvatar.snp.makeConstraints {
            $0.width.equalTo(K.GamerAvatar.widthGamerAvatar)
            $0.height.equalTo(K.GamerAvatar.heightGamerAvatar)
            $0.trailing.equalToSuperview().offset(-K.GamerAvatar.trailingOffsetGamerAvatar)
            $0.top.equalTo(K.GamerAvatar.topOffsetPlayerAvatar)
        }
        
        gameStatusLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        playerHand.snp.makeConstraints {
            $0.top.equalTo(gameStatusLabel.snp.bottom).offset(K.Hands.topBottomOffsetHands)
            $0.trailing.equalToSuperview().offset(-K.Hands.trailingOffsetPlayerHand)
        }
        
        opponentHand.snp.makeConstraints {
            $0.bottom.equalTo(gameStatusLabel.snp.top).offset(-K.Hands.topBottomOffsetHands)
            $0.leading.equalToSuperview().offset(K.Hands.leadingOffsetOpponentHand)
        }
    }
}
