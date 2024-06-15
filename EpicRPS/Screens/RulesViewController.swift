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
        element.spacing = 20
        element.distribution = .fillEqually
        //        element.backgroundColor = .white
        element.spacing = 1
        element.distribution = .fillEqually
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

    
    //MARK: - 1 СТРОКА
    
    private lazy var firstStackView = UIStackView (text: "fitstStackView")
    private lazy var firstUIlabel = UILabel (text: "1")
    private lazy var firstView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 1.00, green: 0.82, blue: 0.37, alpha: 1.00)
        element.layer.cornerRadius = 14.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private lazy var firstTextUIlabel = UILabel (textUilabel: "Игра проводится между игроком и комьютером.")
    
    //MARK: - Вторая строка
    
    private lazy var secondStackView = UIStackView (text: "secondStackView")
    private lazy var secondUIlbel = UILabel(text: "2")
    private lazy var secondView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 1.00, green: 0.82, blue: 0.37, alpha: 1.00)
        element.layer.cornerRadius = 14.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var secondTextUIlabel = UILabel (textUilabel: "Жесты:")
    
    //MARK: - Третья Строка
    
    private lazy var thirdStackView = UIStackView (text: "thirdStackView")
    private lazy var thirdUIlbel = UILabel(text: "3")
    
    private lazy var thirdView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 1.00, green: 0.82, blue: 0.37, alpha: 1.00)
        element.layer.cornerRadius = 14.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var thirdTextUIlabel = UILabel (textUilabel: "У игрока есть 30 сек. для выбора жеста.")
    
    //MARK: - Четвертая Строка
    
    private lazy var fourthStackView = UIStackView (text: "fourthStackView")
    private lazy var fourthUIlbel = UILabel(text: "4")
    
    private lazy var fourthView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 1.00, green: 0.82, blue: 0.37, alpha: 1.00)
        element.layer.cornerRadius = 14.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var fourthTextUIlabel = UILabel (textUilabel: "Игра ведётся до трёх побед одного из участников.")
    
    //MARK: - Пятая Строка
    
    private lazy var fifthStackView = UIStackView (text: "fifthStackView")
    private lazy var fifthUIlbel = UILabel(text: "5")
    
    private lazy var fifthView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 1.00, green: 0.82, blue: 0.37, alpha: 1.00)
        element.layer.cornerRadius = 14.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    var colorTextfifthUilabel: String = ""
    
    // colorTextfifthUilabel

    private lazy var fifthTextUIlabel = UILabel (textUilabel: "За каждую победу игрок получает 500 баллов, которые можно посмотреть на доске лидеров. ")
   
  

  
    
    
    //MARK: - Строка с иконками
    
    private lazy var rockStackView = UIStackView (text: "rockStackView")
    private lazy var rockImageView = UIImageView (imageName: "rock" )
    private lazy var rockTextUIlabel = UILabel (textUilabel: "Кулак > Ножницы")
    private lazy var rockView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 0.14, green: 0.15, blue: 0.53, alpha: 1.00)
        element.layer.cornerRadius = 14.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var paperStackView = UIStackView (text: "paperStackView")
    private lazy var paperImageView = UIImageView (imageName: "paper" )
    private lazy var paperTextUIlabel = UILabel (textUilabel: "Бумага > Кулак")
    private lazy var paperView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 0.14, green: 0.15, blue: 0.53, alpha: 1.00)
        element.layer.cornerRadius = 14.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var scissorsStackView = UIStackView (text: "scissorsStackView")
    private lazy var scissorsImageView = UIImageView (imageName: "scissors" )
    private lazy var scissorsTextUIlabel = UILabel (textUilabel: "Ножницы > Бумага")
    private lazy var scissorsView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 0.14, green: 0.15, blue: 0.53, alpha: 1.00)
        element.layer.cornerRadius = 14.5
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
        
    }
}


// MARK: - Setup UI

extension RulesViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        
        navigationItem.titleView = rulesLabel
        navigationController?.navigationBar.tintColor = K.Colors.gray
        
        //mainStackView.addArrangedSubview(rulesLabel)
        
        mainStackView.addArrangedSubview(firstStackView)
        mainStackView.addArrangedSubview(secondStackView)
        mainStackView.addArrangedSubview(rockStackView)
        mainStackView.addArrangedSubview(paperStackView)
        mainStackView.addArrangedSubview(scissorsStackView)
        mainStackView.addArrangedSubview(thirdStackView)
        mainStackView.addArrangedSubview(fourthStackView)
        mainStackView.addArrangedSubview(fifthStackView)
        
        
        firstStackView.addArrangedSubview(firstView)
        secondStackView.addArrangedSubview(secondView)
        rockStackView.addArrangedSubview(rockView)
        paperStackView.addArrangedSubview(paperView)
        scissorsStackView.addArrangedSubview(scissorsView)
        thirdStackView.addArrangedSubview(thirdView)
        fourthStackView.addArrangedSubview(fourthView)
        fifthStackView.addArrangedSubview(fifthView)
        
        firstView.addSubview(firstUIlabel)
        secondView.addSubview(secondUIlbel)
        rockView.addSubview(rockImageView)
        paperView.addSubview(paperImageView)
        scissorsView.addSubview(scissorsImageView)
        thirdView.addSubview(thirdUIlbel)
        fourthView.addSubview(fourthUIlbel)
        fifthView.addSubview(fifthUIlbel)
        
        firstStackView.addArrangedSubview(firstTextUIlabel)
        secondStackView.addArrangedSubview(secondTextUIlabel)
        rockStackView.addArrangedSubview(rockTextUIlabel)
        paperStackView.addArrangedSubview(paperTextUIlabel)
        scissorsStackView.addArrangedSubview(scissorsTextUIlabel)
        thirdStackView.addArrangedSubview(thirdTextUIlabel)
        fourthStackView.addArrangedSubview(fourthTextUIlabel)
        fifthStackView.addArrangedSubview(fifthTextUIlabel)
        

        
        
        
    }
        // MARK: - Setup Constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 26),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            
            
            //Констрейны 1,2 разделов
            firstView.heightAnchor.constraint(equalToConstant: 29),
            firstView.widthAnchor.constraint(equalToConstant: 29),
            firstView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor,constant: 5),
            firstUIlabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            firstUIlabel.centerYAnchor.constraint(equalTo: firstView.centerYAnchor),
            
            
            secondView.heightAnchor.constraint(equalToConstant: 29),
            secondView.widthAnchor.constraint(equalToConstant: 29),
            secondView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor,constant: 5),
            secondUIlbel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            secondUIlbel.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
            
            //Констрейны иконок (камень, ножницы, бумага )
            
            rockStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor,constant: 65),
            rockStackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 197),
            rockView.heightAnchor.constraint(equalToConstant: 30),
            rockView.widthAnchor.constraint(equalToConstant: 30),
            rockImageView.topAnchor.constraint(equalTo: rockView.topAnchor,constant: 7),
            rockImageView.leadingAnchor.constraint(equalTo: rockView.leadingAnchor,constant: 7),
            rockImageView.trailingAnchor.constraint(equalTo: rockView.trailingAnchor,constant: -7),
            rockImageView.bottomAnchor.constraint(equalTo: rockView.bottomAnchor,constant: -7),
            
            paperStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor,constant: 65),
            paperStackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 234),
            paperView.heightAnchor.constraint(equalToConstant: 30),
            paperView.widthAnchor.constraint(equalToConstant: 30),
            paperImageView.topAnchor.constraint(equalTo: paperView.topAnchor,constant: 5),
            paperImageView.leadingAnchor.constraint(equalTo: paperView.leadingAnchor,constant: 7),
            paperImageView.trailingAnchor.constraint(equalTo: paperView.trailingAnchor,constant: -7),
            paperImageView.bottomAnchor.constraint(equalTo: paperView.bottomAnchor,constant: -5),
            
            scissorsStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor,constant: 65),
            scissorsStackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 271),
            scissorsView.heightAnchor.constraint(equalToConstant: 30),
            scissorsView.widthAnchor.constraint(equalToConstant: 30),
            scissorsImageView.topAnchor.constraint(equalTo: scissorsView.topAnchor,constant: 5),
            scissorsImageView.leadingAnchor.constraint(equalTo: scissorsView.leadingAnchor,constant: 7),
            scissorsImageView.trailingAnchor.constraint(equalTo: scissorsView.trailingAnchor,constant: -7),
            scissorsImageView.bottomAnchor.constraint(equalTo: scissorsView.bottomAnchor,constant: -5),
            
            //Констрейны 3,4,5 разделов
            thirdView.heightAnchor.constraint(equalToConstant: 29),
            thirdView.widthAnchor.constraint(equalToConstant: 29),
            thirdView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor,constant: 5),
            thirdUIlbel.centerXAnchor.constraint(equalTo: thirdView.centerXAnchor),
            thirdUIlbel.centerYAnchor.constraint(equalTo: thirdView.centerYAnchor),
            
            fourthView.heightAnchor.constraint(equalToConstant: 29),
            fourthView.widthAnchor.constraint(equalToConstant: 29),
            fourthView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor,constant: 5),
            fourthUIlbel.centerXAnchor.constraint(equalTo: fourthView.centerXAnchor),
            fourthUIlbel.centerYAnchor.constraint(equalTo: fourthView.centerYAnchor),
            
            fifthView.heightAnchor.constraint(equalToConstant: 29),
            fifthView.widthAnchor.constraint(equalToConstant: 29),
            fifthView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor,constant: 5),
            fifthUIlbel.centerXAnchor.constraint(equalTo: fifthView.centerXAnchor),
            fifthUIlbel.centerYAnchor.constraint(equalTo: fifthView.centerYAnchor),
            fifthStackView.heightAnchor.constraint(equalToConstant: 70),
            
            
            
            
            
            
        ])
        
    }
}
    //MARK: - EXTENSIONS

extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = "\(text)"
        self.backgroundColor = UIColor(red: 1.00, green: 0.82, blue: 0.37, alpha: 1.00)
        self.font = UIFont(name: "Dela Gothic One", size: 16)
        // selflement.layer.cornerRadius = 10
        self.textAlignment = .center
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIStackView {
    convenience init(text:String) {
        self.init()
        self.axis = .horizontal
        self.spacing = 20
        self.alignment = .center
//        self.backgroundColor = .red
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

extension UILabel {
    convenience init(textUilabel: String) {
        self.init()
        self.text = "\(textUilabel)"
        self.numberOfLines = 4
        //self.backgroundColor = .white
        self.attributedText = NSMutableAttributedString(string: textUilabel)
        self.font = UIFont(name: "Rubik", size: 16)
        self.textAlignment = .left
//        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.shadowOffset = CGSize(width: 1, height: 0)
        self.shadowColor = UIColor.black.withAlphaComponent(0.25)
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 6
        
    }
}

extension UIImageView {
    convenience init(imageName: String) {
        self.init()
        //self.frame = CGRect(x: 0, y: 0, width: 11.31, height: 12.5)
        self.image = UIImage (named: imageName)
        self.clipsToBounds = true
        //self.contentMode = .scaleAspectFit
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension String{

func attributedString(subStr: String) -> NSMutableAttributedString{
    let range = (self as NSString).range(of: subStr)
    let attributedString = NSMutableAttributedString(string:self)
    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
    
    return attributedString
  }
}
 

//MARK: - Превью



struct ViewControllerProvider1: PreviewProvider {
    static var previews: some View {
        RulesViewController().showPreview()
      
    }
}
