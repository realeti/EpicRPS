//
//  EnterPlayerNameVC.swift
//  EpicRPS
//
//  Created by Алексей on 14.06.2024.
//

import UIKit
import SnapKit

final class NicknameViewController: UIViewController {
    
    // MARK: - UI
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
}

// MARK: - Set Views
private extension NicknameViewController {
    func setViews() {
        view.backgroundColor = .black
        view.alpha = 0.59
    }
}

// MARK: - Setup Constraints
private extension NicknameViewController {
    func setupConstraints() {
        
    }
}
