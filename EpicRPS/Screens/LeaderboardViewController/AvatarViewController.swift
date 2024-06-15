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
    private lazy var backgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = .black
        element.alpha = 0.59
        return element
    }()
    
    private lazy var closeButton: UIButton = {
        let element = UIButton(type: .system)
        element.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        element.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        element.tintColor = .white
        return element
    }()
    
    private lazy var customView: UIView = {
       let element = UIView()
        element.backgroundColor = .white
        element.layer.cornerRadius = 25
        return element
    }()
    
    private lazy var backgroundCollection: UIView = {
        let element = UIView()
        element.layer.cornerRadius = 30
        element.layer.borderWidth = 1
        element.layer.borderColor = .init(
            red: 239/255,
            green: 241/255,
            blue: 247/255,
            alpha: 1
        )
        element.backgroundColor = .init(
            red: 252/255,
            green: 252/255,
            blue: 252/255,
            alpha: 1
        )
        return element
    }()
    
    private lazy var okButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("OK", for: .normal)
        element.layer.cornerRadius = 16
        element.titleLabel?.font = .init(name: K.fontBold700, size: 16)
        element.backgroundColor = .init(
            red: 234/255,
            green: 153/255,
            blue: 117/255,
            alpha: 1
        )
        let titleColor: UIColor = .init(
            red: 252/255,
            green: 217/255,
            blue: 195/255,
            alpha: 1
        )
        element.setTitleColor(titleColor, for: .normal)
        return element
    }()
    
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        view.addSubview(backgroundView)
        view.addSubview(closeButton)
        view.addSubview(customView)
        customView.addSubview(okButton)
        customView.addSubview(backgroundCollection)
        
        okButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
    }
}

// MARK: - Setup Constraints
private extension AvatarViewController {
    func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalToSuperview().offset(-25)
        }
        
        customView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
            make.height.equalTo(328)
        }
        
        backgroundCollection.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.trailing.equalToSuperview().inset(11)
            make.bottom.equalTo(okButton.snp.top).offset(-42)
        }
        
        okButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(37)
            make.width.equalTo(136)
            make.bottom.equalToSuperview().inset(35)
        }
    }
}
