//
//  UIImageView + Extension.swift
//  EpicRPS
//
//  Created by Алексей on 11.06.2024.
//

import UIKit

extension UIImageView {
    convenience init(contentMode: UIView.ContentMode, shadow: Bool = false) {
        self.init()
        self.contentMode = contentMode
        if shadow {
            self.layer.shadowColor = K.Colors.blue.cgColor
            self.layer.shadowRadius = 0
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 0, height: 15)
            self.layer.masksToBounds = false
        }
    }
}
