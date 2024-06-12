//
//  RulesViewController.swift
//  EpicRPS
//
//  Created by Apple M1 on 10.06.2024.
//

import UIKit
import SwiftUI



class RulesViewController: UIViewController {
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 1
        element.distribution = .fillEqually
        element.spacing = 20
        element.distribution = .fillEqually
//        element.backgroundColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var rulesLabel: UILabel = {
        let element = UILabel()
        element.text = "Rules"
        element.font = UIFont(name: "Rubik", size: 25)
        element.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.23, alpha: 1.00)
        element.tintColor = .blue
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    

    private lazy var firstStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 20
        element.alignment = .center
//        element.distribution = .fill
//        element.backgroundColor = .red
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var firstUIlabel: UILabel = {
        let element = UILabel()
        element.text = "1"
        element.backgroundColor = UIColor(red: 1.00, green: 0.82, blue: 0.37, alpha: 1.00)
        element.font = UIFont(name: "Dela Gothic One", size: 16)
//        element.layer.cornerRadius = 10
        
        element.textAlignment = .center
        element.layer.masksToBounds = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var firstView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 1.00, green: 0.82, blue: 0.37, alpha: 1.00)
        element.layer.cornerRadius = 14.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var firstTextUIlabel: UILabel = {
        let element = UILabel(frame: CGRect(x: 0, y: 0, width: 16, height: 18))
        element.text = "Игра проводится между игроком и комьютером."
        element.numberOfLines = 2
        element.backgroundColor = .white
        element.font = UIFont(name: "Rubik", size: 16)
        element.textAlignment = .left
        element.layer.masksToBounds = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
//
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
    }
}

struct ViewControllerProvider1: PreviewProvider {
    static var previews: some View {
        RulesViewController().showPreview()
      
    }
}

// MARK: - Setup UI

extension RulesViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(rulesLabel)
        
        mainStackView.addArrangedSubview(firstStackView)
        firstStackView.addArrangedSubview(firstView)
        firstView.addSubview(firstUIlabel)
        firstStackView.addArrangedSubview(firstTextUIlabel)
        
    }
        // MARK: - Setup Constraints
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                
                mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 27),
                mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),

                
                firstView.heightAnchor.constraint(equalToConstant: 29),
                firstView.widthAnchor.constraint(equalToConstant: 29),
              

                
                firstUIlabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
                firstUIlabel.centerYAnchor.constraint(equalTo: firstView.centerYAnchor),
                
                
            ])
            
        }
    }
    
