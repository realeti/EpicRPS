//
//  UIButton + Extension.swift
//  EpicRPS
//
//  Created by Алексей on 11.06.2024.
//

import UIKit

extension UIButton {
    convenience init(image: String) {
        self.init(type: .system)
        self.alpha = 0.75
        self.layer.backgroundColor = K.Colors.blue.cgColor
        self.setImage(UIImage(named: image), for: .normal)
        self.tintColor = .white
        self.layer.cornerRadius = K.RPSButton.widthRpsButtonLayer / 2
    }
}
