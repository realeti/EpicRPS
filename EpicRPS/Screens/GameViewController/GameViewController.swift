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
    
    // MARK: - Private properties
    private var gameView: GameView!
    private let timer = RoundTimer()
    private var isPaused = false
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        gameView = GameView()
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        toggleEnableRpsButtons()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        rotateProgressView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gameStatusLabelAnimate()
    }
    
    // MARK: - Private methods
    /// Поворачивает progressViews на +/– 90 градусов
    private func rotateProgressView() {
        gameView.timerProgress.transform = CGAffineTransform(
            rotationAngle: .pi * 0.5
        )
        gameView.playerScoreProgress.transform = CGAffineTransform(
            rotationAngle: .pi * -0.5
        )
        gameView.opponentScoreProgress.transform = CGAffineTransform(rotationAngle: .pi * 0.5)
    }
    
    /// Выбор руки (камень / ножницы / бумага)
    private func choiceHand(_ hand: GameSymbol) {
        let randomHandOpponent = [
            K.Hands.Opponent.rock,
            K.Hands.Opponent.paper,
            K.Hands.Opponent.scissors
        ]
        
        switch hand {
        case .rock:
            gameView.playerHand.image = K.Hands.Player.rock
        case .paper:
            gameView.playerHand.image = K.Hands.Player.paper
        case .scissors:
            gameView.playerHand.image = K.Hands.Player.scissors
        }
        
        gameView.opponentHand.image = randomHandOpponent.randomElement() ?? K.Hands.Opponent.rock
    }
    
    /// Включает/выключает доступность RPS-кнопок (Rock, Paper, Scissors) после нажатия
    private func toggleEnableRpsButtons() {
        gameView.paperButton.isUserInteractionEnabled.toggle()
        gameView.rockButton.isUserInteractionEnabled.toggle()
        gameView.scissorsButton.isUserInteractionEnabled.toggle()
    }
    
    // MARK: - Animations
    /// Анимация заголовка статуса игры ("Fight!")
    private func gameStatusLabelAnimate() {
        UIView.animate(withDuration: 0.25,
                       delay: 0.5,
                       animations: {
            [weak self] in
            guard let self else { return }
            gameView.gameStatusLabel.alpha = 1
            gameView.gameStatusLabel.transform = CGAffineTransform(
                scaleX: 1.25,
                y: 1.25
            )
        }) { _ in
            UIView.animate(withDuration: 0.25, delay: 1) { [weak self] in
                guard let self else { return }
                gameView.gameStatusLabel.alpha = 0
                gameView.gameStatusLabel.transform = CGAffineTransform(
                    scaleX: 0.5,
                    y: 0.5
                )
            } completion: { [weak self] _ in
                guard let self else { return }
                timer.isPaused ? () : timer.startTimer(label: gameView.timerLabel, progress: gameView.timerProgress)
                toggleEnableRpsButtons()
                gameView.gameStatusLabel.transform = CGAffineTransform(
                    scaleX: 1,
                    y: 1
                )
            }

        }
    }
    
    /// Анимация лейбла "Pause" при нажатии на кнопку паузы
    private func pauseLabelAnimate() {
        if gameView.gameStatusLabel.alpha == 0 {
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self else { return }
                gameView.gameStatusLabel.text = "PAUSE"
                gameView.gameStatusLabel.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self else { return }
                gameView.gameStatusLabel.alpha = 0
            }
        }
    }
    
    /// Анимация смены рук
    private func animateHands(_ gameSymbol: GameSymbol) {
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: { [weak self] in
            guard let self else { return }
            
            // скрываем руки
            gameView.opponentHand.frame.origin.y = view.frame.minY - gameView.opponentHand.frame.height
            gameView.playerHand.frame.origin.y = view.frame.maxY + gameView.playerHand.frame.height
        }) { [weak self] _ in
            guard let self else { return }
            
            // выбираем жест
            choiceHand(gameSymbol)
            
            UIView.animate(withDuration: 0.25, delay: 0.75) { [weak self] in
                guard let self else { return }
                
                // показываем руки
                gameView.opponentHand.frame.origin.y = gameView.gameStatusLabel.frame.minY - gameView.opponentHand.frame.height
                gameView.opponentHand.snp.updateConstraints { [weak self] make in
                    guard let self else { return }
                    make.bottom.equalTo(gameView.gameStatusLabel.snp.top)
                }
                gameView.playerHand.frame.origin.y = gameView.gameStatusLabel.frame.maxY
                gameView.playerHand.snp.updateConstraints { [weak self] make in
                    guard let self else { return }
                    make.top.equalTo(gameView.gameStatusLabel.snp.bottom)
                }
            }
        }
    }
    
    // MARK: - Actions
    /// Действие по клику на кнопку паузы в rightBarButtonItem
    @objc private func pauseButtonPressed() {
        pauseLabelAnimate()
        
        if !timer.isPaused {
            timer.pauseTimer()
            toggleEnableRpsButtons()
        } else {
            timer.startTimer(label: gameView.timerLabel, progress: gameView.timerProgress)
            toggleEnableRpsButtons()
        }
        
        timer.isPaused.toggle()
    }
    
    /// Действие по клику на кнопки Rock / Paper / Scissors
    @objc private func rpsButtonPressed(_ sender: UIButton) {
        sender.tintColor = K.Colors.yellow
        
        switch sender.tag {
        case 0:
            animateHands(.rock)
        case 1:
            animateHands(.paper)
        case 2:
            animateHands(.scissors)
        default:
            break
        }
        
        toggleEnableRpsButtons()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self else { return }
            sender.tintColor = .white
            toggleEnableRpsButtons()
            
            timer.startTimer(
                label: gameView.timerLabel,
                progress: gameView.timerProgress
            )
        }
        
        timer.resetTimer(
            label: gameView.timerLabel,
            progress: gameView.timerProgress
        )
    }
    
}

// MARK: - Setup UI
private extension GameViewController {
    func setupUI() {
        gameView.playerAvatar.image = K.GamerAvatar.Image.player
        gameView.playerScoreProgress.progress = 0.66
        
        gameView.opponentAvatar.image = K.GamerAvatar.Image.opponent
        gameView.opponentScoreProgress.progress = 0.33
        
        gameView.playerHand.image = K.Hands.Player.start
        gameView.opponentHand.image = K.Hands.Opponent.start
        
        gameView.gameStatusLabel.text = "FIGHT!"
        gameView.gameStatusLabel.alpha = 0
        
        gameView.timerLabel.text = "0:" + timer.roundDuration.description
        
        gameView.rockButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        gameView.paperButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        gameView.scissorsButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        
        navigationController?.navigationBar.tintColor = K.Colors.gray
        gameView.navigationTitleLabel.text = "Игра"
        navigationItem.titleView = gameView.navigationTitleLabel
        navigationItem.rightBarButtonItem = gameView.pauseButton
        
        gameView.pauseButton.target = self
        gameView.pauseButton.action = #selector(pauseButtonPressed)
    }
}
