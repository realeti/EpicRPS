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
        element.font = .init(name: "Rubik-Regular", size: 25)
        return element
    }()
    
    private lazy var pauseButton: UIBarButtonItem = {
        let element = UIBarButtonItem()
        element.image = .pauseButton
        element.style = .plain
        element.target = self
        return element
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Actions
    @objc private func pauseButtonPressed() {
        
    }
}

// MARK: - Setup UI
private extension GameViewController {
    func setupUI() {
        view.addSubview(backgroundImageView)
        
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
        
    }
}


struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        GameViewController().showPreview()
    }
}
