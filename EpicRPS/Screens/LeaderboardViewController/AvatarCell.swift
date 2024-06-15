//
//  AvatarCell.swift
//  EpicRPS
//
//  Created by Алексей on 15.06.2024.
//

import UIKit
import SnapKit

final class AvatarCell: UICollectionViewCell {
    
    // MARK: - UI
    private lazy var avatar: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        return element
    }()
    
    private lazy var checkImage: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = .check
        element.isHidden = true
        return element
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setupConstraints()
    }
    
    // MARK: - Overrides methods
    override var isSelected: Bool {
        didSet {
            if isSelected {
                checkImage.isHidden = false
                backgroundColor = UIColor(
                    red: 108/255,
                    green: 200/255,
                    blue: 103/255,
                    alpha: 1
                )
            } else {
                checkImage.isHidden = true
                backgroundColor = UIColor(
                    red: 239/255,
                    green: 241/255,
                    blue: 247/255,
                    alpha: 1
                )
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configCell(imageName: String) {
        avatar.image = UIImage(named: imageName)
    }
}

// MARK: - Set Views
private extension AvatarCell {
    func setViews() {
        layer.cornerRadius = 15
        backgroundColor = UIColor(
            red: 239/255,
            green: 241/255,
            blue: 247/255,
            alpha: 1
        )
        
        addSubview(avatar)
        addSubview(checkImage)
    }
}

// MARK: - Setup Constraints
private extension AvatarCell {
    func setupConstraints() {
        avatar.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.center.equalToSuperview()
        }
        
        checkImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-6.17)
            make.bottom.equalToSuperview().offset(-6.66)
        }
    }
}
