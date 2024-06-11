//
//  GameOverProtocol.swift
//  EpicRPS
//
//  Created by Apple M1 on 11.06.2024.
//

import Foundation

protocol GameOverProtocol: AnyObject {
    func gameDidEnd(_ playerScore: Int, _ opponentScore: Int, _ finalResult: GameResult)
}
