//
//  MainView.swift
//  EpicRPS
//
//  Created by Drolllted on 12.06.2024.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    lazy var mainImageLogo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "main")
        
        return image
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "startButton"), for: .normal)
        button.layer.cornerRadius = 15
        
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .black)
        button.tintColor = UIColor(red: 182/255, green: 124/255, blue: 98/255, alpha: 1.0)
        
        return button
    }()
    
    lazy var resultButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "startButton"), for: .normal)
        button.layer.cornerRadius = 15
        
        button.setTitle("RESULT", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .black)
        button.tintColor = UIColor(red: 182/255, green: 124/255, blue: 98/255, alpha: 1.0)
        
        return button
    }()
    
    lazy var stackButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "Snow")
        
        addSubview(mainImageLogo)
        addSubview(stackButtons)
        
        stackButtons.addArrangedSubview(startButton)
        stackButtons.addArrangedSubview(resultButton)
        
        
        setUIModels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUIModels() {
        //MARK: - mainImageLogo
        
        mainImageLogo.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(276)
        }
        
        //MARK: - Button Start
        
        startButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(53)
        }
        
        resultButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(53)
        }
        
        stackButtons.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(80)
        }
    }
    
}
