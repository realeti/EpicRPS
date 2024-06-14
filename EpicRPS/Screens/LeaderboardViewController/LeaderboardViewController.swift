//
//  LeaderboardViewController.swift
//  EpicRPS
//
//  Created by Алексей on 14.06.2024.
//

import UIKit
import SwiftUI
import SnapKit

struct LeaderboardViewControllerProvider: PreviewProvider {
    static var previews: some View {
        LeaderboardViewController().showPreview()
    }
}

final class LeaderboardViewController: UIViewController {
    
    // MARK: - UI
    private lazy var navigationTitleLabel: UILabel = {
        let element = UILabel()
        element.textColor = K.Colors.gray
        element.font = .init(name: K.fontName, size: K.sizeTitleLabel)
        return element
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
}

// MARK: - Set Views
private extension LeaderboardViewController {
    func setViews() {
        view.backgroundColor = K.Colors.snow
        
        navigationController?.navigationBar.tintColor = K.Colors.gray
        navigationTitleLabel.text = "Leaderboard"
        navigationItem.titleView = navigationTitleLabel
    }
}

// MARK: - Setup Constraints
private extension LeaderboardViewController {
    func setupConstraints() {
        
    }
}
