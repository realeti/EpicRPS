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
        self.layer.backgroundColor = K.RPSButton.backgroundColorRpsButtonLayer.cgColor
        self.setImage(UIImage(named: image), for: .normal)
        self.tintColor = .white
        self.layer.cornerRadius = K.RPSButton.widthRpsButtonLayer / 2
    }
}
