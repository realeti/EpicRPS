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
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        playerImage.image = .player
        opponentImage.image = .opponent
        playerVictoriesLabel.text = "10 Victories/"
        playerVictoriesLabel.textColor = .white
        playerVictoriesLabel.setSubTextColor(pSubString: "10", pColor: .yellowRPS)
        playerLosesLabel.text = "2 Lose"
        playerLosesLabel.textColor = .white
        playerLosesLabel.setSubTextColor(pSubString: "2", pColor: .red)
        
        opponentVictoriesLabel.text = "21 Victories/"
        opponentVictoriesLabel.textColor = .white
        opponentVictoriesLabel.setSubTextColor(pSubString: "21", pColor: .yellowRPS)
        opponentLosesLabel.text = "3 Lose"
        opponentLosesLabel.textColor = .white
        opponentLosesLabel.setSubTextColor(pSubString: "3", pColor: .red)
        
        playerVictoriesLabel.font = .init(name: K.fontBold700, size: K.playerLabelFontSize)
        playerLosesLabel.font = .init(name: K.fontBold700, size: K.playerLabelFontSize)
        opponentVictoriesLabel.font = .init(name: K.fontBold700, size: K.playerLabelFontSize)
        opponentLosesLabel.font = .init(name: K.fontBold700, size: K.playerLabelFontSize)
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
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
}
