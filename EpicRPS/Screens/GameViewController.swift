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
        element.image = .backgroundGameVC
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private lazy var navigationTitleLabel: UILabel = {
        let element = UILabel()
        element.textColor = .navigation
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
    
    private let rockButton = UIButton(image: K.rockImageRpsButton)
    private let paperButton = UIButton(image: K.paperImageRpsButton)
    private let scissorsButton = UIButton(image: K.scissorsImageRpsButton)
    
    private let timerProgress = UIProgressView(progressColor: .greenProgressTint)
    private lazy var timerLabel: UILabel = {
        let element = UILabel()
        element.font = .init(name: K.fontName, size: K.sizeTimerLabel)
        element.textColor = .white
        element.sizeToFit()
        element.text = "0:30"
        return element
    }()
    
    private let playerScoreProgress = UIProgressView(
        progressColor: .yellowProgressTint
    )
    private let opponentScoreProgress = UIProgressView(
        progressColor: .yellowProgressTint
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
        element.font = .init(name: K.fontName, size: 56)
        element.textColor = .yellowProgressTint
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
    private func rotateProgressView() {
        timerProgress.transform = CGAffineTransform(rotationAngle: .pi * -0.5)
        playerScoreProgress.transform = CGAffineTransform(rotationAngle: .pi * -0.5)
        opponentScoreProgress.transform = CGAffineTransform(rotationAngle: .pi * 0.5)
    }
    
    // MARK: - Actions
    @objc private func pauseButtonPressed() {
        
    }
    
    @objc private func rpsButtonPressed(_ sender: UIButton) {
        sender.tintColor = sender.tintColor == .white ? .yellowSelectedRpsButton : .white
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
        
        rockButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        
        timerProgress.progress = 0.5
        playerScoreProgress.progress = 0.66
        opponentScoreProgress.progress = 0.33
        
        navigationController?.navigationBar.tintColor = .navigation
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
            $0.width.height.equalTo(K.widthRpsButtonLayer)
            $0.trailing.equalTo(paperButton.snp.leading).offset(-K.leadingTrailingOffsetRpsButton)
            $0.bottom.equalToSuperview().offset(-K.bottomOffsetRockScissorsButton)
        }
        
        paperButton.snp.makeConstraints {
            $0.width.height.equalTo(K.widthRpsButtonLayer)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-K.bottomOffsetPaperButton)
        }
        
        scissorsButton.snp.makeConstraints {
            $0.width.height.equalTo(K.widthRpsButtonLayer)
            $0.leading.equalTo(paperButton.snp.trailing).offset(K.leadingTrailingOffsetRpsButton)
            $0.bottom.equalToSuperview().offset(-K.bottomOffsetRockScissorsButton)
        }
        
        timerProgress.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(K.heightProgress)
            $0.width.equalTo(K.widthTimerProgress)
            $0.leading.equalToSuperview().offset(-K.leadingTimerProgress)
        }
        
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(timerProgress.snp.bottom).offset(K.topOffsetTimerLabel)
            $0.leading.equalToSuperview().offset(K.leadingOffsetTimerLabel)
        }
        
        opponentScoreProgress.snp.makeConstraints {
            $0.height.equalTo(K.heightProgress)
            $0.width.equalTo(K.widthScoreProgress)
            $0.trailing.equalToSuperview().offset(K.trailingScoreProgress)
            $0.bottom.equalToSuperview().offset(-K.topBottomOffsetScoreProgress)
        }
        
        playerScoreProgress.snp.makeConstraints {
            $0.height.equalTo(K.heightProgress)
            $0.width.equalTo(K.widthScoreProgress)
            $0.trailing.equalToSuperview().offset(K.trailingScoreProgress)
            $0.top.equalToSuperview().offset(K.topBottomOffsetScoreProgress)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(K.topSeparator)
            $0.width.equalTo(K.widthSeparator)
            $0.height.equalTo(K.heightSeparator)
            $0.trailing.equalToSuperview().offset(-K.trailingSeparator)
        }
        
        opponentAvatar.snp.makeConstraints {
            $0.width.equalTo(K.widthGamerAvatar)
            $0.height.equalTo(K.heightGamerAvatar)
            $0.trailing.equalToSuperview().offset(-K.trailingOffsetGamerImage)
            $0.top.equalTo(K.bottomOffsetOpponentImage)
        }
        
        playerAvatar.snp.makeConstraints {
            $0.width.equalTo(K.widthGamerAvatar)
            $0.height.equalTo(K.heightGamerAvatar)
            $0.trailing.equalToSuperview().offset(-K.trailingOffsetGamerImage)
            $0.top.equalTo(K.topOffsetPlayerAvatar)
        }
        
        gameStatusLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        playerHand.snp.makeConstraints {
            $0.top.equalTo(gameStatusLabel.snp.bottom).offset(K.topBottomOffsetHands)
            $0.trailing.equalToSuperview().offset(-K.trailingOffsetPlayerHand)
        }
        
        opponentHand.snp.makeConstraints {
            $0.bottom.equalTo(gameStatusLabel.snp.top).offset(-K.topBottomOffsetHands)
            $0.leading.equalToSuperview().offset(K.leadingOffsetOpponentHand)
        }
    }
}


struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        GameViewController().showPreview()
    }
}
