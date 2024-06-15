//
//  LeaderboardViewController.swift
//  EpicRPS
//
//  Created by Алексей on 14.06.2024.
//

import UIKit
import SwiftUI
import SnapKit

//struct LeaderboardViewControllerProvider: PreviewProvider {
//    static var previews: some View {
//        LeaderboardViewController().showPreview()
//    }
//}

final class LeaderboardViewController: UIViewController {
    
    // MARK: - UI
    private lazy var navigationTitleLabel: UILabel = {
        let element = UILabel()
        element.textColor = K.Colors.gray
        element.font = .init(name: K.fontName, size: K.sizeTitleLabel)
        return element
    }()
    private lazy var avatarBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        element.layer.cornerRadius = 23
        return element
    }()
    private lazy var avatarButton: UIButton = {
        let element = UIButton()
        element.setImage(K.GamerAvatar.Image.player, for: .normal)
        return element
    }()
    private lazy var playerNameTextField: UITextField = {
        let element = UITextField()
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
        element.font = .init(name: K.fontBold700, size: 16)
        element.textColor = .init(
            red: 74/255,
            green: 100/255,
            blue: 149/255,
            alpha: 1
        )
        element.tintColor = .init(
            red: 74/255,
            green: 100/255,
            blue: 149/255,
            alpha: 1
        )
        element.text = "Player 1 "
        return element
    }()
    private lazy var tableBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        element.layer.cornerRadius = 50
        return element
    }()
    private lazy var top10ImageView: UIImageView = {
        let element = UIImageView()
        element.image = .top10
        element.contentMode = .scaleAspectFit
        return element
    }()
    private lazy var playersLabel: UILabel = {
        let element = UILabel()
        element.text = "Players"
        element.font = .init(name: K.fontBold700, size: 13)
        element.alpha = 0.26
        element.textColor = .init(
            red: 74/255,
            green: 100/255,
            blue: 149/255,
            alpha: 1
        )
        return element
    }()
    private lazy var matchLabel: UILabel = {
        let element = UILabel()
        element.text = "Match"
        element.font = .init(name: K.fontBold700, size: 13)
        element.alpha = 0.26
        element.textColor = .init(
            red: 74/255,
            green: 100/255,
            blue: 149/255,
            alpha: 1
        )
        return element
    }()
    private lazy var rateLabel: UILabel = {
        let element = UILabel()
        element.text = "Rate"
        element.font = .init(name: K.fontBold700, size: 13)
        element.alpha = 0.26
        element.textColor = .init(
            red: 74/255,
            green: 100/255,
            blue: 149/255,
            alpha: 1
        )
        return element
    }()
    private lazy var tableView: UITableView = {
        let element = UITableView()
        element.dataSource = self
        element.delegate = self
        element.register(TableCell.self, forCellReuseIdentifier: TableCell.description())
        element.separatorStyle = .none
        element.showsVerticalScrollIndicator = false
        return element
    }()
    
    // MARK: - Private properties
    private var mockData = MockLeaderData.getData()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }
}

// MARK: - UITableViewDataSource
extension LeaderboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableCell.description(),
            for: indexPath
        ) as? TableCell else {
            print("return default cell")
            return UITableViewCell()
        }
        let modelItem = mockData[indexPath.row]
        cell.configure(indexPath: indexPath, modelItem: modelItem)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension LeaderboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
}

// MARK: - Set Views
private extension LeaderboardViewController {
    func setViews() {
        view.backgroundColor = UIColor(resource: .snow)
        view.addSubview(avatarBackgroundView)
        avatarBackgroundView.addSubview(avatarButton)
        view.addSubview(playerNameTextField)
        view.addSubview(tableBackgroundView)
        view.addSubview(top10ImageView)
        view.addSubview(playersLabel)
        view.addSubview(matchLabel)
        view.addSubview(rateLabel)
        view.addSubview(tableView)
                
        navigationController?.navigationBar.tintColor = K.Colors.gray
        navigationTitleLabel.text = "Leaderboard"
        navigationItem.titleView = navigationTitleLabel
    }
}

// MARK: - Setup Constraints
private extension LeaderboardViewController {
    func setupConstraints() {
        
        avatarBackgroundView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(6)
            $0.leading.equalToSuperview().offset(17)
            $0.width.height.equalTo(46)
        }
        
        avatarButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        playerNameTextField.snp.makeConstraints {
            $0.top.equalTo(avatarBackgroundView.snp.top)
            $0.leading.equalTo(avatarBackgroundView.snp.trailing).offset(7)
            $0.height.equalTo(45)
            $0.trailing.equalToSuperview().offset(-56)
        }
        
        tableBackgroundView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(avatarButton.snp.bottom).offset(45)
        }
        
        top10ImageView.snp.makeConstraints {
            $0.top.equalTo(playerNameTextField.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
        }
        
        playersLabel.snp.makeConstraints {
            $0.top.equalTo(top10ImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(40)
        }
        matchLabel.snp.makeConstraints {
            $0.top.equalTo(top10ImageView.snp.bottom).offset(10)
            $0.trailing.equalTo(rateLabel.snp.leading).offset(-27)
        }
        rateLabel.snp.makeConstraints {
            $0.top.equalTo(top10ImageView.snp.bottom).offset(10)
            $0.trailing.equalTo(tableView.snp.trailing).offset(-48)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(playersLabel.snp.bottom).offset(25)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(19)
            $0.trailing.equalToSuperview().offset(-12)
        }
    }
}
