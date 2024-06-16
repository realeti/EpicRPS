//
//  LoadViewController.swift
//  EpicRPS
//
//  Created by Илья Малинов on 13.06.2024.
//

import Foundation
import UIKit
import SnapKit

class LoadViewController: UIViewController {
    
    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = view.frame
        imageView.image = UIImage(named: K.backgroundLoadVC)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let playerImage = UIImageView(contentMode: .scaleAspectFit)
    
    private let playerVictoriesLabel = UILabel()
    
    private let playerLosesLabel = UILabel()
    
    private let opponentImage = UIImageView(contentMode: .scaleAspectFit)
    
    private let opponentVictoriesLabel = UILabel()
    
    private let opponentLosesLabel = UILabel()

    private lazy var vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.font = .init(name: K.fontBold700, size: K.gameStatusLabelFontSize)
        label.textColor = .yellowRPS
        return label
    }()
    
    private lazy var getReadyLabel: UILabel = {
        let label = UILabel()
        label.text = "Get Ready..."
        label.font = .init(name: K.fontBold700, size: K.playerLabelFontSize)
        label.textColor = .yellowRPS
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var playerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var oponentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Private properties
    private var player: PlayerProtocol?
    private var opponent: PlayerProtocol?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayers()
        setupUI()
        setupConstraints()
        startTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initAudio()
    }
}
    
// MARK: - Setup UI
private extension LoadViewController {
    func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(verticalStackView)
        verticalStackView.addSubview(playerStackView)
        playerStackView.addSubview(playerImage)
        playerStackView.addSubview(playerVictoriesLabel)
        playerStackView.addSubview(playerLosesLabel)
        verticalStackView.addSubview(vsLabel)
        verticalStackView.addSubview(oponentStackView)
        oponentStackView.addSubview(opponentImage)
        oponentStackView.addSubview(opponentVictoriesLabel)
        oponentStackView.addSubview(opponentLosesLabel)
        verticalStackView.addSubview(getReadyLabel)
        
        let playerWins = player?.wins ?? 0
        let playerLosses = player?.losses ?? 0
        
        let playerAvatarName = player?.avatar ?? K.defaultPlayerAvatar
        let opponentAvatarName = opponent?.avatar ?? K.defaultOpponentAvatar
        
        let opponentWins = opponent?.wins ?? 0
        let opponentsLosses = opponent?.losses ?? 0
        
        playerImage.image = UIImage(named: playerAvatarName)
        opponentImage.image = UIImage(named: opponentAvatarName)
        playerVictoriesLabel.text = "\(playerWins) Victories/"
        playerVictoriesLabel.textColor = .white
        playerVictoriesLabel.setSubTextColor(pSubString: "\(playerWins)", pColor: .yellowRPS)
        playerLosesLabel.text = "\(playerLosses) Lose"
        playerLosesLabel.textColor = .white
        playerLosesLabel.setSubTextColor(pSubString: "\(playerLosses)", pColor: .red)
        
        opponentVictoriesLabel.text = "\(opponentWins) Victories/"
        opponentVictoriesLabel.textColor = .white
        opponentVictoriesLabel.setSubTextColor(pSubString: "\(opponentWins)", pColor: .yellowRPS)
        opponentLosesLabel.text = "\(opponentsLosses) Lose"
        opponentLosesLabel.textColor = .white
        opponentLosesLabel.setSubTextColor(pSubString: "\(opponentsLosses)", pColor: .red)
        
        playerVictoriesLabel.font = .init(name: K.fontBold700, size: K.playerLabelFontSize)
        playerLosesLabel.font = .init(name: K.fontBold700, size: K.playerLabelFontSize)
        opponentVictoriesLabel.font = .init(name: K.fontBold700, size: K.playerLabelFontSize)
        opponentLosesLabel.font = .init(name: K.fontBold700, size: K.playerLabelFontSize)
        
        navigationItem.backButtonTitle = ""
        navigationItem.hidesBackButton = true
    }
}

// MARK: - Setup Constraints
private extension LoadViewController {
    func setupConstraints() {
        verticalStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        vsLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        playerImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(70)
            $0.height.equalTo(100)
        }
        playerVictoriesLabel.snp.makeConstraints{
            $0.top.equalTo(playerImage.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        playerLosesLabel.snp.makeConstraints{
            $0.top.equalTo(playerVictoriesLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        opponentVictoriesLabel.snp.makeConstraints{
            $0.top.equalTo(opponentImage.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        opponentLosesLabel.snp.makeConstraints{
            $0.top.equalTo(opponentVictoriesLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        opponentImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(70)
            $0.height.equalTo(100)
        }
        playerStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalTo(vsLabel.snp.top)
            $0.centerX.equalToSuperview()
        }
        oponentStackView.snp.makeConstraints {
            $0.top.equalTo(vsLabel.snp.bottom)
            $0.bottom.equalTo(getReadyLabel.snp.top)
            $0.centerX.equalToSuperview()
        }
        getReadyLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
        }
    }
}

// MARK: - Setup Players
private extension LoadViewController {
    func setupPlayers() {
        let playerName = GameStats.shared.playerName
        let opponentName = GameStats.shared.opponentName
        
        player = GameStats.shared.loadPlayerData(playerName)
        opponent = GameStats.shared.loadPlayerData(opponentName, isOpponent: true)
    }
}

// MARK: - Init audio
private extension LoadViewController {
    func initAudio() {
        GameAudio.shared.prepareLoadAudio()
    }
}

// MARK: - Navigate to game
private extension LoadViewController {
    func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.navigateToGame()
        }
    }
    
    func navigateToGame() {
        let gameVC = GameViewController()
        gameVC.player = self.player
        gameVC.opponent = self.opponent
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
}
