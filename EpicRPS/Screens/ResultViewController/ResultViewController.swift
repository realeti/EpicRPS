//
//  ResultViewController.swift
//  EpicRPS
//
//  Created by Drolllted on 12.06.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultView: ResultView!
    var playerScore: Int = 0
    var opponentScore: Int = 0
    
    var finalResult: GameResult = .lose
    
    var playerAvatar: String?
    var opponentAvatar: String?
    
    override func loadView() {
        resultView = ResultView()
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.homeButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        resultView.restartButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
        
        stateOfPlay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultView.countLabel.text = "\(playerScore) - \(opponentScore)"
        resultView.countLabel.reloadInputViews()
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - Obj-c functions
    
    @objc func goHome() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func restartGame() {
        navigationController?.pushViewController(LoadViewController(), animated: true)
    }
    
    
    func stateOfPlay() {
        switch finalResult {
        case .win:
            resultView.backgroundView.image = UIImage(resource: .backgroundWin)
            resultView.loseOrWinLabel.text = "You Win"
            resultView.loseOrWinLabel.textColor = UIColor(red: 255/255, green: 178/255, blue: 76/255, alpha: 1.0)
            resultView.avatarImageView.image = UIImage(named: playerAvatar ?? K.defaultPlayerAvatar)
            
        case .lose:
            
            resultView.backgroundView.image = UIImage(resource: .backgroundLose)
            resultView.loseOrWinLabel.text = "You Lose"
            resultView.loseOrWinLabel.textColor = UIColor(red: 27/255, green: 18/255, blue: 46/255, alpha: 1.0)
            resultView.avatarImageView.image = UIImage(named: opponentAvatar ?? K.defaultOpponentAvatar)
        }
    }
}
