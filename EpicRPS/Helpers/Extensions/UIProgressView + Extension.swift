//
//  UIProgressView + Extension.swift
//  EpicRPS
//
//  Created by Алексей on 11.06.2024.
//

import UIKit

extension UIProgressView {
    convenience init(progressColor: UIColor, trackColor: UIColor = K.Colors.blue) {
        self.init()
        self.progressTintColor = progressColor
        self.trackTintColor = trackColor
    }
}
