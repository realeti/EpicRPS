//
//  ProgressProtocol.swift
//  EpicRPS
//
//  Created by Apple M1 on 11.06.2024.
//

import Foundation

protocol ProgressProtocol {
    func updatePlayerProgress()
    func updateOpponentProgress()
    func resetProgress()
}
