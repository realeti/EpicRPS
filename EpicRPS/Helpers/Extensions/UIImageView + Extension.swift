//
//  UIImageView + Extension.swift
//  EpicRPS
//
//  Created by Алексей on 11.06.2024.
//

import UIKit

extension UIImageView {
    convenience init(contentMode: UIView.ContentMode) {
        self.init()
        self.contentMode = contentMode
    }
}
