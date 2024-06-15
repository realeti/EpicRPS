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
    private lazy var backgroundView: UIView = {
        let element = UIView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeScreen))
        element.addGestureRecognizer(tap)
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
    
    private lazy var label: UILabel = {
        let element = UILabel()
        element.text = "Введите имя игрока"
        element.font = UIFont(name: K.fontName, size: 14)
        element.textColor = UIColor(
            red: 124/255,
            green: 124/255,
            blue: 123/255,
            alpha: 1
        )
        return element
    }()
    
    private lazy var okButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("OK", for: .normal)
        element.layer.cornerRadius = 16
        element.titleLabel?.font = .init(name: K.fontBold700, size: 16)
        element.backgroundColor = UIColor(
            red: 234/255,
            green: 153/255,
            blue: 117/255,
            alpha: 1
        )
        let titleColor: UIColor = UIColor(
            red: 252/255,
            green: 217/255,
            blue: 195/255,
            alpha: 1
        )
        element.setTitleColor(titleColor, for: .normal)
        return element
    }()
    
    private lazy var playerNameTextField: UITextField = {
        let element = UITextField()
        element.delegate = self
        element.layer.borderColor = CGColor(
            red: 237/255,
            green: 237/255,
            blue: 237/255,
            alpha: 1
        )
        element.layer.borderWidth = 1
        element.layer.cornerRadius = 20
        element.backgroundColor = .white
        element.indent(size: 16)
        element.font = UIFont(name: K.fontBold700, size: 16)
        element.textColor = UIColor(
            red: 60/255,
            green: 61/255,
            blue: 59/255,
            alpha: 1
        )
        element.tintColor = UIColor(
            red: 60/255,
            green: 61/255,
            blue: 59/255,
            alpha: 1
        )
        
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
        playerNameTextField.endEditing(true)
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension NicknameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        playerNameTextField.endEditing(true)
    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if !textField.text!.isEmpty {
//            return true
//        } else {
//            return false
//        }
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if let playerName = textField.text {
            
        }
        
        closeScreen()
    }
}

// MARK: - Set Views
private extension NicknameViewController {
    func setViews() {
        view.addSubview(backgroundView)
        view.addSubview(closeButton)
        view.addSubview(customView)
        customView.addSubview(okButton)
        customView.addSubview(label)
        customView.addSubview(playerNameTextField)
        playerNameTextField.becomeFirstResponder()
        okButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
    }
}

// MARK: - Setup Constraints
private extension NicknameViewController {
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
            make.bottom.equalTo(okButton.snp.bottom).offset(20)
        }
            
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(31)
            $0.leading.equalToSuperview().offset(18)
        }
        
        playerNameTextField.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(45)
            $0.bottom.equalTo(okButton.snp.top).offset(-40)
        }
        
        okButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(37)
            make.width.equalTo(136)
            make.bottom.equalToSuperview().inset(35)
        }
    }
}
