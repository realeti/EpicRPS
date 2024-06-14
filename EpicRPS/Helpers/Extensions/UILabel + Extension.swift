//
//  UILabel + Extension.swift
//  EpicRPS
//
//  Created by Илья Малинов on 13.06.2024.
//

import UIKit

extension UILabel {
    func setSubTextColor(pSubString : String, pColor : UIColor){
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: self.text!);
        let range = attributedString.mutableString.range(of: pSubString, options:NSString.CompareOptions.caseInsensitive)
        if range.location != NSNotFound {
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: pColor, range: range);
        }
        self.attributedText = attributedString
    }
}
