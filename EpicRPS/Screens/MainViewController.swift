//
//  MainViewController.swift
//  EpicRPS
//
//  Created by Apple M1 on 10.06.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI
    
    lazy var rulesButton = UIBarButtonItem(
        image: UIImage(resource: .rules), style: .plain, target: self, action: #selector(rulesButtonPressed))
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor(resource: .snow)
        navigationItem.rightBarButtonItem = rulesButton
    }
    
    @objc func rulesButtonPressed(_ sender: UIButton) {
        print("press")
    }
}

extension MainViewController {
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
    }
}
