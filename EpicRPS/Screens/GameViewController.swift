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
    
    private let rockButton = UIButton(image: K.rockImageRpsButton)
    private let paperButton = UIButton(image: K.paperImageRpsButton)
    private let scissorsButton = UIButton(image: K.scissorsImageRpsButton)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Actions
    @objc private func pauseButtonPressed() {
        
    }
    
    @objc private func rpsButtonPressed(_ sender: UIButton) {
        sender.tintColor = sender.tintColor == .white ? .rpsButtonPressed : .white
    }
}

// MARK: - Setup UI
private extension GameViewController {
    func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(rockButton)
        view.addSubview(paperButton)
        view.addSubview(scissorsButton)
        rockButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(rpsButtonPressed), for: .touchUpInside)
        
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
        rockButton.snp.makeConstraints {
            $0.width.height.equalTo(K.widthRpsButtonLayer)
            $0.trailing.equalTo(paperButton.snp.leading).offset(-K.leadingTrailingOffsetRpsButton)
            $0.bottom.equalToSuperview().offset(-K.bottomOffsetRockScissorsButton)
        }
        
        paperButton.snp.makeConstraints {
            $0.width.height.equalTo(K.widthRpsButtonLayer)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-K.bottomOffsetPaperButton)
        }
        
        scissorsButton.snp.makeConstraints {
            $0.width.height.equalTo(K.widthRpsButtonLayer)
            $0.leading.equalTo(paperButton.snp.trailing).offset(K.leadingTrailingOffsetRpsButton)
            $0.bottom.equalToSuperview().offset(-K.bottomOffsetRockScissorsButton)
        }
    }
}


struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        GameViewController().showPreview()
    }
}
