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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(
                top: 4,
                left: 0,
                bottom: 4,
                right: 0
            )
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(indexPath: IndexPath) {
        avatar.image = UIImage(named: K.GamerAvatar.AvatarName.char1)
        nameLabel.text = "Big Smoke"
        badges.image = .goldBadge
        matchLabel.text = "15,220"
        rateLabel.text = "91%"
        
        switch indexPath.row {
        case 0:
            nameLabel.textColor = .init(
                red: 252/255,
                green: 189/255,
                blue: 17/255,
                alpha: 1
            )
            contentView.backgroundColor = .init(
                red: 251/255,
                green: 212/255,
                blue: 58/255,
                alpha: 0.44
            )
        case 1:
            nameLabel.textColor = .init(
                red: 195/255,
                green: 196/255,
                blue: 203/255,
                alpha: 1
            )
            contentView.backgroundColor = .init(
                red: 244/255,
                green: 245/255,
                blue: 249/255,
                alpha: 1
            )
        case 2:
            nameLabel.textColor = .init(
                red: 208/255,
                green: 161/255,
                blue: 143/255,
                alpha: 1
            )
            contentView.backgroundColor = .init(
                red: 245/255,
                green: 238/255,
                blue: 229/255,
                alpha: 1
            )
        default:
            contentView.backgroundColor = .clear
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
        contentView.layer.cornerRadius = 25
        selectionStyle = .none
        
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
        contentView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.trailing.equalTo(badges.snp.centerX)
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
            $0.leading.equalTo(nameLabel.snp.trailing).offset(21)
            $0.centerY.equalToSuperview()
        }
        
        rateLabel.snp.makeConstraints {
            $0.leading.equalTo(matchLabel.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
        }
        
        badges.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
