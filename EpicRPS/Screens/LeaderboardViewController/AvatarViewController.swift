//
//  SelectAvatarVC.swift
//  EpicRPS
//
//  Created by Алексей on 14.06.2024.
//

import UIKit
import SnapKit

final class AvatarViewController: UIViewController {
    
    // MARK: - UI
    private lazy var closeButton: UIButton = {
        let element = UIButton(type: .system)
        element.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        element.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        element.tintColor = .white
        return element
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
    
    // MARK: - Actions
    @objc private func closeScreen() {
        dismiss(animated: true)
    }
}

// MARK: - Set Views
private extension AvatarViewController {
    func setViews() {
        view.backgroundColor = .black
        view.alpha = 0.59
        view.addSubview(closeButton)
    }
}

// MARK: - Setup Constraints
private extension AvatarViewController {
    func setupConstraints() {
        closeButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
    }
}
