//
//  TableCell.swift
//  EpicRPS
//
//  Created by Алексей on 14.06.2024.
//

import UIKit
import SnapKit

final class TableCell: UITableViewCell {
    
    // MARK: - UI
    private lazy var background: UIView = {
        let element = UIView()
        element.layer.cornerRadius = 20
        return element
    }()
    private lazy var avatar: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        return element
    }()
    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.font = .init(name: K.fontBold700, size: 14)
        element.textColor = .init(
            red: 172/255,
            green: 180/255,
            blue: 195/255,
            alpha: 1
        )
        return element
    }()
    private lazy var badges: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        return element
    }()
    private lazy var matchLabel: UILabel = {
        let element = UILabel()
        element.font = .init(name: K.fontBold700, size: 13)
        element.textColor = .init(
            red: 92/255,
            green: 92/255,
            blue: 92/255,
            alpha: 1
        )
        return element
    }()
    private lazy var rateLabel: UILabel = {
        let element = UILabel()
        element.font = .init(name: K.fontMedium500, size: 18)
        element.textColor = .init(
            red: 92/255,
            green: 92/255,
            blue: 92/255,
            alpha: 1
        )
        return element
    }()
    
    // MARK: - Override methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatar.image = nil
        nameLabel.text = nil
        badges.image = nil
        matchLabel.text = nil
        rateLabel.text = nil
    }
    
    func configure(indexPath: IndexPath, modelItem: MockLeaderData) {
        avatar.image = UIImage(named: modelItem.avatar)
        nameLabel.text = modelItem.name
        matchLabel.text = modelItem.match.description
        rateLabel.text = modelItem.rate.description + "%"
        
        switch indexPath.row {
        case 0:
            badges.image = .goldBadge
            nameLabel.textColor = .init(
                red: 252/255,
                green: 189/255,
                blue: 17/255,
                alpha: 1
            )
            background.backgroundColor = .init(
                red: 251/255,
                green: 212/255,
                blue: 58/255,
                alpha: 0.44
            )
        case 1:
            badges.image = .silverBadge
            nameLabel.textColor = .init(
                red: 195/255,
                green: 196/255,
                blue: 203/255,
                alpha: 1
            )
            background.backgroundColor = .init(
                red: 244/255,
                green: 245/255,
                blue: 249/255,
                alpha: 1
            )
        case 2:
            badges.image = .bronzeBadge
            nameLabel.textColor = .init(
                red: 208/255,
                green: 161/255,
                blue: 143/255,
                alpha: 1
            )
            background.backgroundColor = .init(
                red: 245/255,
                green: 238/255,
                blue: 229/255,
                alpha: 1
            )
        default:
            background.backgroundColor = .clear
            badges.isHidden = true
            matchLabel.textColor = .init(
                red: 172/255,
                green: 180/255,
                blue: 195/255,
                alpha: 1
            )
            rateLabel.textColor = .init(
                red: 172/255,
                green: 180/255,
                blue: 195/255,
                alpha: 1
            )
        }
    }
}

// MARK: - Set Views
private extension TableCell {
    func setViews() {
        selectionStyle = .none
        
        addSubview(background)
        addSubview(avatar)
        addSubview(nameLabel)
        addSubview(badges)
        addSubview(matchLabel)
        addSubview(rateLabel)
    }
}

// MARK: - Setup Constraints
private extension TableCell {
    func setupConstraints() {
        background.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-4)
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-7)
        }
        
        avatar.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16.5)
            $0.width.height.equalTo(35)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(avatar.snp.trailing).offset(18)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(124)
        }
        
        matchLabel.snp.makeConstraints {
            $0.leading.equalTo(rateLabel.snp.leading).offset(-65)
            $0.centerY.equalToSuperview()
        }
        
        rateLabel.snp.makeConstraints {
            $0.leading.equalTo(badges.snp.leading).offset(-60)
            $0.centerY.equalToSuperview()
        }
        
        badges.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(19)
        }
    }
}
