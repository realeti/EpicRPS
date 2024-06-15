//
//  UIButton + Extension.swift
//  EpicRPS
//
//  Created by Алексей on 11.06.2024.
//

import UIKit

extension UIButton {
    convenience init(
        image: UIImage?,
        tag: Int = 0,
        backgroundColor: CGColor = K.Colors.blue.cgColor,
        alpha: CGFloat = 0.75
    ) {
        self.init(type: .system)
        self.tag = tag
        self.alpha = alpha
        self.layer.backgroundColor = backgroundColor
        self.tintColor = .white
        self.layer.cornerRadius = K.RPSButton.widthRpsButtonLayer / 2
        self.setImage(image, for: .normal)
    }
}
