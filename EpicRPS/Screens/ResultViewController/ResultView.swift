//
//  ResultView.swift
//  EpicRPS
//
//  Created by Drolllted on 11.06.2024.
//

import UIKit
import SnapKit

enum Result {
    case Lose
    case Win
}

class ResultView: UIView {
    
    //MARK: - Properties
    
    //MARK: - UI Models
    
    //MARK: - Stack with Image
    
    lazy var roundedRectangle: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 43/255, green: 40/255, blue: 112/255, alpha: 1.0)
        view.layer.cornerRadius = 83
        view.clipsToBounds = true
        return view
    }()
    
    lazy var labelWinOrLose: UILabel = {
        let label = UILabel()
        label.text = "You Win"
        label.textAlignment = .center
        label.font = UIFont(name: "Rubic-Regular", size: 26)
        label.textColor = UIColor(red: 255/255, green: 178/255, blue: 76/255, alpha: 1.0)
        return label
    }()
    
    lazy var stackWithImage: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        
        return stack
    }()
    
    //MARK: - Stack Points
    lazy var winPoints: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubic-Regular", size: 41)
        label.textColor = .white
        label.textAlignment = .center
        
        label.text = "3"
        
        return label
    }()
    
    lazy var dashPoints: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubic-Regular", size: 41)
        label.textColor = .white
        label.textAlignment = .center
        
        label.text = "-"

        return label
    }()
    
    lazy var losePoints: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubic-Regular", size: 41)
        label.textColor = .white
//label.textAlignment = .center
        
        label.text = "1"
        
        return label
    }()
    
    lazy var stackPoints: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        
        stack.alignment = .center
        
        return stack
    }()
    
    //MARK: - LifeCycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackWithImage)
        addSubview(stackPoints)
        
        stackWithImage.addArrangedSubview(roundedRectangle)
        stackWithImage.addArrangedSubview(labelWinOrLose)
        
        stackPoints.addArrangedSubview(winPoints)
        stackPoints.addArrangedSubview(dashPoints)
        stackPoints.addArrangedSubview(losePoints)
        
        setUIModels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    
    private func setUIModels() {
        
        //MARK: - Status Stack
        
        roundedRectangle.snp.makeConstraints { make in
            make.height.equalTo(176)
            make.width.equalTo(176)
        }
        
        labelWinOrLose.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        stackWithImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(180)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        //MARK: - Setup points Stack
        winPoints.snp.makeConstraints { make in
            make.height.width.equalTo(15)
        }
        dashPoints.snp.makeConstraints { make in
            make.height.width.equalTo(15)
        }
        
        losePoints.snp.makeConstraints { make in
            make.height.width.equalTo(15)
        }
        
        stackPoints.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(50)
            make.top.equalTo(stackWithImage.snp.bottom).inset(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
    }
    
}
