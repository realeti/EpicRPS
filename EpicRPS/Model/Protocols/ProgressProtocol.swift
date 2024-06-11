//
//  ProgressProtocol.swift
//  EpicRPS
//
//  Created by Apple M1 on 11.06.2024.
//

import Foundation

protocol ProgressProtocol: AnyObject {
    func updatePlayerProgress(_ progress: Float)
    func updateOpponentProgress(_ progress: Float)
    func resetProgress()
}
