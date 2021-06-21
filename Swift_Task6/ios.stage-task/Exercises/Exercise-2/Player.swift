//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?
    
    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        for myCard in hand!{
            if myCard.value == card.value{
                return true
            }
        }
        return false
    }
    
    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for playerCard in hand!{
            for card in table{
                let value = playerCard.value
                if value == card.key.value || value == card.value.value{
                    return true
                }
            }
        }
        return false
    }
}
