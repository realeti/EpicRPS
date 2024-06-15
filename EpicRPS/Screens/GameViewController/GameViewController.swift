//
//  GameViewController.swift
//  EpicRPS
//
//  Created by Алексей on 11.06.2024.
//

import UIKit
import SnapKit
import SwiftUI

/*struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        GameViewController().showPreview()
    }
}*/

final class GameViewController: UIViewController {
    
    // MARK: - Private properties
    private var gameView: GameView!
    private let timer = RoundTimer()
    private let game = RockPaperScissorsGame()
    private var scoreProgressPlayer = Float(0)
    private var scoreProgressOponnent = Float(0)
    
    // MARK: - Public properties
    var player: PlayerProtocol?
    var opponent: PlayerProtocol?
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        gameView = GameView()
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegates()
        toggleEnableRpsButtons()
        timer.startTimer(label: gameView.timerLabel, progress: gameView.timerProgress)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: gameView.navigationBackButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        rotateProgressView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playBackgroundMusic()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gameStatusLabelAnimate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        GameAudio.shared.stopBackgroundMusic()
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
        let possibleHands: [GameSymbol] = [.rock, .paper, .scissors]
        
        let playerSymbol: GameSymbol = hand
        let opponentSymbol: GameSymbol = possibleHands.randomElement() ?? .rock
        
        switch playerSymbol {
        case .rock:
            gameView.playerHand.image = K.Hands.Player.rock
        case .paper:
            gameView.playerHand.image = K.Hands.Player.paper
        case .scissors:
            gameView.playerHand.image = K.Hands.Player.scissors
        }
        
        switch opponentSymbol {
        case .rock:
            gameView.opponentHand.image = K.Hands.Opponent.rock
        case .paper:
            gameView.opponentHand.image = K.Hands.Opponent.paper
        case .scissors:
            gameView.opponentHand.image = K.Hands.Opponent.scissors
        }
        
        let result = game.play(playerSymbol: playerSymbol, opponentSymbol: opponentSymbol)
        
        if result == .draw {
            showDrawLabel()
        }
        updateGameProgress(result: result)
    }
        
    private func updateGameProgress(result: GameRoundResult) {
        switch result {
        case .win:
            updatePlayerProgress()
        case .lose:
            updateOpponentProgress()
        case .draw:
            break
        }
    }
    
    /// Включает/выключает доступность RPS-кнопок (Rock, Paper, Scissors) после нажатия
    private func toggleEnableRpsButtons() {
        gameView.paperButton.isUserInteractionEnabled.toggle()
        gameView.rockButton.isUserInteractionEnabled.toggle()
        gameView.scissorsButton.isUserInteractionEnabled.toggle()
    }
    
    /// Воспроизведение фоновой мелодии
    private func playBackgroundMusic() {
        let currentMusic = GameSettings.shared.backgroundMusic
        
        switch currentMusic {
        case K.Sounds.background2:
            GameAudio.shared.playBackgroundMusic2()
        default:
            GameAudio.shared.playBackgroundMusic1()
        }
    }
    
    /// Воспроизведение звука по нажатию RPS-кнопок
    private func playSelectSymbolSound() {
        GameAudio.shared.playSelectSymbolMusic()
    }
    
    private func restartTimer() {
        timer.resetTimer(
            label: gameView.timerLabel,
            progress: gameView.timerProgress
        )
        timer.startTimer(
            label: gameView.timerLabel,
            progress: gameView.timerProgress
        )
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
                toggleEnableRpsButtons()
                gameView.gameStatusLabel.transform = CGAffineTransform(
                    scaleX: 1,
                    y: 1
                )
            }

        }
    }
    
    /// Показываем лейбл "DRAW"
    private func showDrawLabel() {
        gameView.gameStatusLabel.text = K.gameDraw
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       animations: {
            [weak self] in
            guard let self else { return }
            gameView.gameStatusLabel.alpha = 1
            gameView.gameStatusLabel.transform = CGAffineTransform(
                scaleX: 1.25,
                y: 1.25
            )
        }) { _ in
            UIView.animate(withDuration: 0.25, delay: 0.5) { [weak self] in
                guard let self else { return }
                gameView.gameStatusLabel.alpha = 0
                gameView.gameStatusLabel.transform = CGAffineTransform(
                    scaleX: 0.5,
                    y: 0.5
                )
            } completion: { [weak self] _ in
                guard let self else { return }
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
                gameView.gameStatusLabel.text = K.gamePause
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
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.gameView.opponentHand.alpha = 0
            self?.gameView.playerHand.alpha = 0
        } completion: { [weak self] _ in
            self?.choiceHand(gameSymbol)
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.gameView.opponentHand.alpha = 1
                self?.gameView.playerHand.alpha = 1
            }
        }
    }
  
    // MARK: - Actions
    /// Действие по клику на кнопку паузы в rightBarButtonItem
    @objc private func pauseButtonPressed() {
        pauseLabelAnimate()
        
        if !timer.isPaused {
            timer.timer?.invalidate()
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
        playSelectSymbolSound()
        
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
        }
        
        restartTimer()
    }
    
    /// Действие по клику на кнопку Назад в leftBarButtonItem
    @objc private func backButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Setup UI
private extension GameViewController {
    func setupUI() {
        gameView.playerAvatar.image = K.GamerAvatar.Image.player
        
        gameView.opponentAvatar.image = K.GamerAvatar.Image.opponent
        
        gameView.playerHand.image = K.Hands.Player.start
        gameView.opponentHand.image = K.Hands.Opponent.start
        
        gameView.gameStatusLabel.text = K.gameFight
        gameView.gameStatusLabel.alpha = 0
        
        gameView.timerLabel.text = "0:" + Int(timer.roundDuration).description
        
        gameView.rockButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        gameView.paperButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        gameView.scissorsButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        gameView.navigationBackButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        navigationController?.navigationBar.tintColor = K.Colors.gray
        gameView.navigationTitleLabel.text = K.gameTitle
        navigationItem.titleView = gameView.navigationTitleLabel
        navigationItem.rightBarButtonItem = gameView.pauseButton
        
        gameView.pauseButton.target = self
        gameView.pauseButton.action = #selector(pauseButtonPressed)
    }
}

// MARK: - Setup Delegates
private extension GameViewController {
    func setupDelegates() {
        game.delegate = self
        timer.delegate = self
    }
}

extension GameViewController: TimerProtocol {
    func timerDidEnded() {
        game.roundTimeout()
        updateOpponentProgress()
        restartTimer()
    }
}

extension GameViewController: GameOverProtocol {
    func gameDidEnd(_ playerScore: Int, _ opponentScore: Int, _ finalResult: GameResult) {
        let resultVC = ResultViewController()
        resultVC.playerScore = playerScore
        resultVC.opponentScore = opponentScore
        resultVC.finalResult = finalResult
        resultVC.playerAvatar = player?.avatar
        resultVC.opponentAvatar = opponent?.avatar
        
        updatePlayerStats(for: finalResult)
        navigationController?.pushViewController(resultVC, animated: true)
    }
}

// MARK: - Update Player stats
private extension GameViewController {
    func updatePlayerStats(for finalResult: GameResult) {
        switch finalResult {
        case .win:
            player?.wins += 1
            opponent?.losses += 1
        case .lose:
            player?.losses += 1
            opponent?.wins += 1
        }
        
        if let player {
            GameStats.shared.savePlayerData(for: player)
        }
        
        if let opponent {
            GameStats.shared.savePlayerData(for: opponent)
        }
    }
}

// MARK: - Update Players progress
extension GameViewController: ProgressProtocol {
    func updatePlayerProgress() {
        scoreProgressPlayer += 1
        let percentProgress = scoreProgressPlayer/Float(3)
        gameView.playerScoreProgress.setProgress(percentProgress, animated: true)
    }
    
    func updateOpponentProgress() {
        scoreProgressOponnent += 1
        let percentProgress = scoreProgressOponnent/Float(3)
        gameView.opponentScoreProgress.setProgress(percentProgress, animated: true)
    }
    
    func resetProgress() {
        gameView.playerScoreProgress.progress = 0
        gameView.opponentScoreProgress.progress = 0
    }
}
