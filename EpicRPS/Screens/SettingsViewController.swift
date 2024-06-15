//
//  SettingsViewController.swift
//  EpicRPS
//
//  Created by Руслан Алламбергенов on 15.06.2024.
//

import Foundation
import UIKit
import SwiftUI

class SettingsViewController: UIViewController {
    
    
    private lazy var SettingsLabel: UILabel = {
        let element = UILabel()
        element.text = "Settings"
        element.font = UIFont(name: "Rubik", size: 25)
        element.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.23, alpha: 1.00)
        element.tintColor = .blue
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    //MARK: - 1 раздел
    
    
    private lazy var gametime: UILabel = {
        let element = UILabel()
        element.text = "Время игры"
        element.font = UIFont(name: "Rubik", size: 25)
        element.textColor = UIColor(red: 0.24, green: 0.23, blue: 0.23, alpha: 1.00)
        element.tintColor = .blue
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var ConteynerView: UIView = {
        let element = UIView()
        element.layer.borderColor = UIColor.black.cgColor
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var firstStackView = UIStackView (text: "fitstStackView")
    
    //кнопка 30 сек
    private lazy var thirtyUIbutton : UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("30 сек.", for: .normal)
        element.frame = CGRect(x: 130, y: 130, width: 130, height: 40)
        element.layer.cornerRadius = 15
        element.titleLabel?.font = .systemFont(ofSize: 18)
        element.tintColor = .white
        let font = UIFont(name: "Rubik", size: 18)
        element.titleLabel?.font = font
        element.backgroundColor = UIColor(red: 0.95, green: 0.67, blue: 0.51, alpha: 1.00)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    

    
    // кнопка 60 сек
    private lazy var sixtyUIbutton : UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("60 сек.", for: .normal)
        element.frame = CGRect(x: 130, y: 130, width: 130, height: 40)
        element.layer.cornerRadius = 15
        element.titleLabel?.font = .systemFont(ofSize: 18)
        element.tintColor = .white
        let font = UIFont(name: "Rubik", size: 18)
        element.titleLabel?.font = font
        element.backgroundColor = UIColor(red: 0.95, green: 0.67, blue: 0.51, alpha: 1.00)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    //MARK: - 2 раздел
    
    private lazy var secondStackView = UIStackView (text: "secondStackView")
    
    
    
    
    
    
// MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupUI()
        setupConstraints()
        
    }
}

//MARK: - Serup UI
extension SettingsViewController {
    private func setupUI() {
        
        navigationItem.titleView = SettingsLabel
        view.addSubview(ConteynerView)
        ConteynerView.addSubview(gametime)
        ConteynerView.addSubview(thirtyUIbutton)
        ConteynerView.addSubview(sixtyUIbutton)
        
        
    
        
//        firstStackView.backgroundColor = .green
//        secondStackView.backgroundColor = .purple
        
        
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            ConteynerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ConteynerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            ConteynerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            
            gametime.topAnchor.constraint(equalTo: view.topAnchor,constant: 126),
            gametime.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
 
            
            thirtyUIbutton.topAnchor.constraint(equalTo: view.topAnchor,constant: 170),
            thirtyUIbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 33),
            
            sixtyUIbutton.topAnchor.constraint(equalTo: view.topAnchor,constant: 170),
            sixtyUIbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 217)
            
            
            
            
        ])
        
    }
}
//MARK: - Превью



struct ViewControllerProvider2: PreviewProvider {
    static var previews: some View {
        SettingsViewController().showPreview()
      
    }
}

//MARK: - EXTENSIONS



