//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var attakingPlayer: Player?
        var minTrumpValue = Value.allCases.count
        for player in players {
            if let cards = player.hand {
                for card in cards where card.isTrump == true {
                    let value = card.value.rawValue
                    if value < minTrumpValue {
                        attakingPlayer = player
                        minTrumpValue = value
                    }
                }
            }
        }
        return attakingPlayer
    }
}
