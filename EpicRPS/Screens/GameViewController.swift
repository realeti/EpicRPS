//
//  GameViewController.swift
//  EpicRPS
//
//  Created by Алексей on 11.06.2024.
//

import UIKit
import SnapKit
import SwiftUI

final class GameViewController: UIViewController {
    
    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.frame = view.frame
        element.image = UIImage(named: K.backgroundGameVC)
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private lazy var navigationTitleLabel: UILabel = {
        let element = UILabel()
        element.textColor = K.Colors.gray
        element.font = .init(name: K.fontName, size: K.sizeTitleLabel)
        return element
    }()
    private lazy var pauseButton: UIBarButtonItem = {
        let element = UIBarButtonItem()
        element.image = .pauseButton
        element.style = .plain
        element.target = self
        return element
    }()
    
    private let rockButton = UIButton(image: K.RPSButton.rockImageRpsButton)
    private let paperButton = UIButton(image: K.RPSButton.paperImageRpsButton)
    private let scissorsButton = UIButton(image: K.RPSButton.scissorsImageRpsButton)
    
    private let timerProgress = UIProgressView(progressColor: K.Colors.green)
    private lazy var timerLabel: UILabel = {
        let element = UILabel()
        element.font = .init(name: K.fontMedium500, size: K.TimerLabel.sizeTimerLabel)
        element.textColor = .white
        element.sizeToFit()
        return element
    }()
    
    private let playerScoreProgress = UIProgressView(
        progressColor: K.Colors.yellow
    )
    private let opponentScoreProgress = UIProgressView(
        progressColor: K.Colors.yellow
    )
    private lazy var separatorView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        return element
    }()
    
    private let playerAvatar = UIImageView(contentMode: .scaleAspectFit)
    private let opponentAvatar = UIImageView(contentMode: .scaleAspectFit)
    
    private let playerHand = UIImageView(contentMode: .scaleAspectFit)
    private let opponentHand = UIImageView(contentMode: .scaleAspectFit)
    
    private lazy var gameStatusLabel: UILabel = {
        let element = UILabel()
        element.font = .init(name: K.fontBold700, size: K.gameStatusLabelFontSize)
        element.textColor = K.Colors.yellow
        element.sizeToFit()
        return element
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        rotateProgressView()
    }
    
    // MARK: - Private methods
    /// Поворачивает progressViews на +/– 90 градусов
    private func rotateProgressView() {
        timerProgress.transform = CGAffineTransform(rotationAngle: .pi * -0.5)
        playerScoreProgress.transform = CGAffineTransform(rotationAngle: .pi * -0.5)
        opponentScoreProgress.transform = CGAffineTransform(rotationAngle: .pi * 0.5)
    }
    
    // MARK: - Actions
    /// Действие по клику на кнопку паузы в rightBarButtonItem
    @objc private func pauseButtonPressed() {
        
    }
    
    /// Действие по клику на кнопки Rock / Paper / Scissors
    @objc private func rpsButtonPressed(_ sender: UIButton) {
//        sender.layer.backgroundColor = UIColor.red.cgColor
        sender.tintColor = sender.tintColor == .white ? K.Colors.yellow : .white
    }
}

// MARK: - Setup UI
private extension GameViewController {
    func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(opponentHand)
        view.addSubview(playerHand)
        view.addSubview(gameStatusLabel)
        view.addSubview(rockButton)
        view.addSubview(paperButton)
        view.addSubview(scissorsButton)
        view.addSubview(timerProgress)
        view.addSubview(timerLabel)
        view.addSubview(playerScoreProgress)
        view.addSubview(opponentScoreProgress)
        view.addSubview(separatorView)
        view.addSubview(playerAvatar)
        view.addSubview(opponentAvatar)
        
        playerAvatar.image = .player
        opponentAvatar.image = .opponent
        
        playerHand.image = .playerStart
        opponentHand.image = .opponentStart
        
        gameStatusLabel.text = "FIGHT"
        
        timerLabel.text = "0:30"
        
        rockButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        
        timerProgress.progress = 0.5
        playerScoreProgress.progress = 0.66
        opponentScoreProgress.progress = 0.33
        
        navigationController?.navigationBar.tintColor = K.Colors.gray
        navigationTitleLabel.text = "Игра"
        navigationItem.titleView = navigationTitleLabel
        navigationItem.rightBarButtonItem = pauseButton
        
        pauseButton.action = #selector(pauseButtonPressed)
    }
}

// MARK: - Setup Constraints
private extension GameViewController {
    func setupConstraints() {
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


struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        GameViewController().showPreview()
    }
}
