//
//  GameViewController.swift
//  EpicRPS
//
//  Created by Алексей on 11.06.2024.
//

import UIKit
import SnapKit
import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        GameViewController().showPreview()
    }
}

final class GameViewController: UIViewController {
    
    // MARK: - UI
    private var gameView: GameView!
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        gameView = GameView()
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        rotateProgressView()
    }
    
    // MARK: - Private methods
    /// Поворачивает progressViews на +/– 90 градусов
    private func rotateProgressView() {
        gameView.timerProgress.transform = CGAffineTransform(
            rotationAngle: .pi * -0.5
        )
        gameView.playerScoreProgress.transform = CGAffineTransform(
            rotationAngle: .pi * -0.5
        )
        gameView.opponentScoreProgress.transform = CGAffineTransform(rotationAngle: .pi * 0.5)
    }
    
    // MARK: - Actions
    /// Действие по клику на кнопку паузы в rightBarButtonItem
    @objc private func pauseButtonPressed() {
        
    }
    
    /// Действие по клику на кнопки Rock / Paper / Scissors
    @objc private func rpsButtonPressed(_ sender: UIButton) {
        sender.tintColor = sender.tintColor == .white ? K.Colors.yellow : .white
    }
}

// MARK: - Setup UI
private extension GameViewController {
    func setupUI() {
        gameView.playerAvatar.image = .player
        gameView.playerScoreProgress.progress = 0.66
        
        gameView.opponentAvatar.image = .opponent
        gameView.opponentScoreProgress.progress = 0.33
        
        gameView.playerHand.image = .playerStart
        gameView.opponentHand.image = .opponentStart
        
        gameView.gameStatusLabel.text = "FIGHT"
        
        gameView.timerProgress.progress = 0.5
        gameView.timerLabel.text = "0:30"
        
        gameView.rockButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        gameView.paperButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        gameView.scissorsButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        
        navigationController?.navigationBar.tintColor = K.Colors.gray
        gameView.navigationTitleLabel.text = "Игра"
        navigationItem.titleView = gameView.navigationTitleLabel
        navigationItem.rightBarButtonItem = gameView.pauseButton
        
        gameView.pauseButton.action = #selector(pauseButtonPressed)
    }
}
