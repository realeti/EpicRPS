//
//  SettingVC.swift
//  EpicRPS
//
//  Created by Алексей on 16.06.2024.
//

import UIKit

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
    
    
    private lazy var gametimeLabel: UILabel = {
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
        element.layer.borderWidth = 1
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    
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
    
    
    private lazy var SecondConteynerView: UIView = {
        let element = UIView()
        element.layer.borderColor = UIColor.black.cgColor
        element.layer.cornerRadius = 20
        element.layer.borderWidth = 1
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var MusicView: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 130, y: 130, width: 130, height: 40)
        element.layer.cornerRadius = 15
        element.backgroundColor = UIColor(red: 0.95, green: 0.67, blue: 0.51, alpha: 1.00)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private lazy var gameWithFriendView: UIView = {
        let element = UIView()
        element.frame = CGRect(x: 130, y: 130, width: 130, height: 40)
        element.layer.cornerRadius = 15
        element.backgroundColor = UIColor(red: 0.95, green: 0.67, blue: 0.51, alpha: 1.00)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var fonMusicLabel: UILabel = {
        let element = UILabel()
        element.text = "Фоновая музыка"
        element.font = UIFont(name: "Poppins-Black", size: 16)
        element.textColor = .white
        element.tintColor = .blue
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var gameWithFriendLabel: UILabel = {
        let element = UILabel()
        element.text = "Игра с другом"
        element.font = UIFont(name: "Poppins-Black", size: 16)
        element.textColor = .white
        element.tintColor = .blue
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private lazy var melodiyButton: UIButton = {
        let element = UIButton()
        element.setTitle("Мелодия 1 >", for: .normal)
        let font = UIFont(name: "Rubik", size: 14)
        element.titleLabel?.font = font
        element.addTarget(self, action: #selector(melodiyButtonpressed), for: .touchUpInside)
        element.backgroundColor = UIColor(red: 0.95, green: 0.67, blue: 0.51, alpha: 1.00)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    @objc func melodiyButtonpressed () {
        print ("tap")
    }
    
    private lazy var SwitchUI: UISwitch = {
        let element = UISwitch ()
        element.frame = CGRect(x: 100, y: 100, width: 50, height: 30)
        element.setOn(true, animated: false)
       //element.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
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
        
        ConteynerView.addSubview(gametimeLabel)
        ConteynerView.addSubview(thirtyUIbutton)
        ConteynerView.addSubview(sixtyUIbutton)
        
        

        view.addSubview(SecondConteynerView)
        SecondConteynerView.addSubview(MusicView)
        SecondConteynerView.addSubview(gameWithFriendView)
        
        MusicView.addSubview(fonMusicLabel)
        fonMusicLabel.addSubview(melodiyButton)
        
        gameWithFriendView.addSubview(gameWithFriendLabel)
        gameWithFriendView.addSubview(SwitchUI)
    
        
//        firstStackView.backgroundColor = .green
//        secondStackView.backgroundColor = .purple
        
        
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            ConteynerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ConteynerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            ConteynerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            ConteynerView.heightAnchor.constraint(equalToConstant: 130),
            
            gametimeLabel.topAnchor.constraint(equalTo: ConteynerView.topAnchor,constant: 22),
            gametimeLabel.leadingAnchor.constraint(equalTo: ConteynerView.leadingAnchor,constant: 30),
            
            
            thirtyUIbutton.topAnchor.constraint(equalTo: gametimeLabel.bottomAnchor,constant: 17),
            thirtyUIbutton.leadingAnchor.constraint(equalTo: ConteynerView.leadingAnchor,constant: 33),
            thirtyUIbutton.bottomAnchor.constraint(equalTo: ConteynerView.bottomAnchor,constant: -15),
            thirtyUIbutton.widthAnchor.constraint(equalToConstant: 134),
            
            sixtyUIbutton.topAnchor.constraint(equalTo: gametimeLabel.bottomAnchor,constant: 17),
//            sixtyUIbutton.leadingAnchor.constraint(equalTo: thirtyUIbutton.trailingAnchor,constant: 30),
            sixtyUIbutton.trailingAnchor.constraint(equalTo: ConteynerView.trailingAnchor,constant: -33),
            sixtyUIbutton.bottomAnchor.constraint(equalTo: ConteynerView.bottomAnchor,constant: -15),
            sixtyUIbutton.widthAnchor.constraint(equalToConstant: 134),
            
            
           SecondConteynerView.topAnchor.constraint(equalTo: ConteynerView.bottomAnchor,constant: 20),
           SecondConteynerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
           SecondConteynerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
           SecondConteynerView.heightAnchor.constraint(equalToConstant: 165),
            
            MusicView.topAnchor.constraint(equalTo: SecondConteynerView.topAnchor, constant: 20),
            MusicView.leadingAnchor.constraint(equalTo: SecondConteynerView.leadingAnchor,constant: 20),
            MusicView.trailingAnchor.constraint(equalTo: SecondConteynerView.trailingAnchor,constant: -20),
            
            MusicView.heightAnchor.constraint(equalToConstant: 49),
            MusicView.widthAnchor.constraint(equalToConstant: 308),
            
           melodiyButton.centerYAnchor.constraint(equalTo: MusicView.centerYAnchor),
           melodiyButton.trailingAnchor.constraint(equalTo: MusicView.trailingAnchor, constant:-25),
           melodiyButton.heightAnchor.constraint(equalToConstant: 24),
            
            
            
            gameWithFriendView.topAnchor.constraint(equalTo: MusicView.bottomAnchor,constant: 20),
            gameWithFriendView.leadingAnchor.constraint(equalTo: SecondConteynerView.leadingAnchor,constant: 20),
            gameWithFriendView.trailingAnchor.constraint(equalTo: SecondConteynerView.trailingAnchor,constant: -20),
            
           gameWithFriendView.heightAnchor.constraint(equalToConstant: 49),
           gameWithFriendView.widthAnchor.constraint(equalToConstant: 308),
            
            fonMusicLabel.centerYAnchor.constraint(equalTo: MusicView.centerYAnchor),
            fonMusicLabel.leadingAnchor.constraint(equalTo: MusicView.leadingAnchor, constant: 25),
            fonMusicLabel.heightAnchor.constraint(equalToConstant: 24),
            
            gameWithFriendLabel.centerYAnchor.constraint(equalTo: gameWithFriendView.centerYAnchor),
            gameWithFriendLabel.leadingAnchor.constraint(equalTo: gameWithFriendView.leadingAnchor,constant: 25),
            
           SwitchUI.centerYAnchor.constraint(equalTo: gameWithFriendView.centerYAnchor),
           SwitchUI.trailingAnchor.constraint(equalTo: gameWithFriendView.trailingAnchor,constant: -25),
            
            
            
        
        ])
        
    }
}
//MARK: - Превью



//struct ViewControllerProvider2: PreviewProvider {
//    static var previews: some View {
//        SettingsViewController().showPreview()
//      
//    }
//}

//MARK: - EXTENSIONS



