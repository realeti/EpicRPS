//
//  ResultView.swift
//  EpicRPS
//
//  Created by Drolllted on 12.06.2024.
//

import UIKit
import SnapKit

class ResultView: UIView {
    
    var winCoin: Int = 0
    var loseCoin: Int = 0
    
    lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .brown
        view.image = UIImage(resource: .backgroundLose)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    lazy var switchOn: UISwitch = {
        let switchOn = UISwitch()
        switchOn.isOn = false
        switchOn.onTintColor = .green
        
        return switchOn
    }()
    
    //MARK: - Stack Image and text
    
    lazy var roundedView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.image = UIImage(resource: .loseYou)
        view.layer.cornerRadius = 90
        return view
    }()
    
    lazy var loseOrWinLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "You Lose"
        label.textColor = UIColor(red: 27/255, green: 18/255, blue: 46/255, alpha: 1.0)
        label.font = UIFont(name: "Rubik-Medium", size: 21)
        return label
    }()
    
    lazy var stackImageAndText: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .center
        return stack
    }()
    
    //MARK: - Count Setup
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "\(winCoin) - \(loseCoin)"
        label.textColor = .white
        label.font = UIFont(name: "Rubik", size: 41)
        return label
    }()
    
    //MARK: - Stack Buttons
    
    lazy var homeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(resource: .buttonHome), for: .normal)
        button.layer.cornerRadius = 26
        return button
    }()
    
    lazy var restartButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(resource: .buttonReload), for: .normal)
        button.layer.cornerRadius = 26
        return button
    }()
    
    lazy var stackButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 50
        stack.alignment = .center
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setup UI
    
    private func setupViews() {
        addSubview(backgroundView)
        
        backgroundView.addSubview(mainStack)
        backgroundView.addSubview(switchOn)
        
        mainStack.addArrangedSubview(stackImageAndText)
        mainStack.addArrangedSubview(countLabel)
        mainStack.addArrangedSubview(stackButtons)
        
        stackImageAndText.addArrangedSubview(roundedView)
        stackImageAndText.addArrangedSubview(loseOrWinLabel)
        
        stackButtons.addArrangedSubview(homeButton)
        stackButtons.addArrangedSubview(restartButton)
    }
    
    private func setupUI() {
        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            
        }
        
        switchOn.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(backgroundView.snp.centerX)
            make.width.equalTo(80)
        }
        
        mainStack.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.centerX.equalTo(backgroundView.snp.centerX)
            make.centerY.equalTo(backgroundView.snp.centerY)
        }
        
        //MARK: - Setup Stack Image and Result
        
        roundedView.snp.makeConstraints { make in
            make.width.height.equalTo(176)
           
        }
        
        loseOrWinLabel.snp.makeConstraints { make in
            make.height.equalTo(27)
           
        }
        
        //MARK: - Count Win or Lose
        
        countLabel.snp.makeConstraints { make in
            
        }
        
        //MARK: - Setup Stack Buttons
        
        homeButton.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(67)
            make.centerY.equalTo(stackButtons.snp.centerY)
        }
        
        restartButton.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(67)
            make.centerY.equalTo(stackButtons.snp.centerY)
        }
    }
}
