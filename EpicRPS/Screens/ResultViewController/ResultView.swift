//
//  ResultView.swift
//  EpicRPS
//
//  Created by Drolllted on 12.06.2024.
//

import UIKit
import SnapKit

class ResultView: UIView {
    
    lazy var roundedView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
