//
//  ResultViewController.swift
//  EpicRPS
//
//  Created by Drolllted on 12.06.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    private var resultView: ResultView!
    private var gameResult: GameResult = .win
    
    override func loadView() {
        resultView = ResultView()
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.switchOn.addTarget(nil, action: #selector(setupBackg), for: .valueChanged)
    }
    
    @objc func setupBackg(_ sender: UISwitch) {
//        sender.isOn.toggle()
        if sender.isOn{
            resultView.backgroundView.image = UIImage(resource: .backgroundWin)
            resultView.loseOrWinLabel.text = "You Win"
            resultView.loseOrWinLabel.textColor = UIColor(red: 255/255, green: 178/255, blue: 76/255, alpha: 1.0)
            resultView.roundedView.image = UIImage(resource: .winYou)
        }else {
            resultView.backgroundView.image = UIImage(resource: .backgroundLose)
            resultView.loseOrWinLabel.text = "You Lose"
            resultView.loseOrWinLabel.textColor = UIColor(red: 27/255, green: 18/255, blue: 46/255, alpha: 1.0)
            resultView.roundedView.image = UIImage(resource: .loseYou)
        }
    }
    
    
    func stateOfPlay() {
        switch gameResult {
        case .win:
            resultView.backgroundView.image = UIImage(resource: .backgroundWin)
            resultView.loseOrWinLabel.text = "You Win"
            resultView.loseOrWinLabel.textColor = UIColor(red: 255/255, green: 178/255, blue: 76/255, alpha: 1.0)
            resultView.roundedView.image = UIImage(resource: .winYou)
        case .lose:
            resultView.backgroundView.image = UIImage(resource: .backgroundLose)
            resultView.loseOrWinLabel.text = "You Lose"
            resultView.loseOrWinLabel.textColor = UIColor(red: 27/255, green: 18/255, blue: 46/255, alpha: 1.0)
            resultView.roundedView.image = UIImage(resource: .loseYou)
        }
    }
}
