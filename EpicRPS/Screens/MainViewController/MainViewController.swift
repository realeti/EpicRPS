//
//  MainViewController.swift
//  EpicRPS
//
//  Created by Apple M1 on 10.06.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private var mainView: MainView!
    
    lazy var rulesButton = UIBarButtonItem(
        image: UIImage(resource: .rules), style: .plain, target: self, action: #selector(rulesButtonPressed))
    lazy var settingsButton = UIBarButtonItem(image: UIImage(resource: .settings ), style: .plain, target: self, action: #selector(settingsButtonPressed))
    
    // MARK: - Life Cycle
    
    override func loadView() {
        mainView = MainView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor(resource: .snow)
        navigationItem.rightBarButtonItem = rulesButton
        navigationItem.leftBarButtonItem = settingsButton
        settingsButton.tintColor = .black
    }
    
    @objc func rulesButtonPressed(_ sender: UIButton) {
        print("press")
    }
    
    @objc func settingsButtonPressed(_ sender: UIButton) {
        print("press press")
    }

    //MARK: - Objc func
    
}