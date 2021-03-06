
//
//  Card.swift
//  2SetGame
//
//  Created by Chris Wu on 11/2/18.
//  Copyright © 2018 Wu Personal Team. All rights reserved.
//

import Foundation

struct Card : Hashable, CustomStringConvertible{
    var color = 0
    var number = 0
    var symbol = 0
    var shading = 0
    
    var state = CardState.inDeck
    
    var shortDescription: String {
        return "color=\(color) number=\(number) symbol=\(symbol) shading=\(shading)"
    }
    
    var description: String {
        return "state=\(state) " + shortDescription
    }
    
    func matchesWithOtherTwo(firstCard: Card, secondCard: Card) -> Bool {
        return
            color.sameOrMutexIn3(firstNumber: firstCard.color, secondNumber: secondCard.color) &&
                number.sameOrMutexIn3(firstNumber: firstCard.number, secondNumber: secondCard.number) &&
                symbol.sameOrMutexIn3(firstNumber: firstCard.symbol, secondNumber: secondCard.symbol) &&
                shading.sameOrMutexIn3(firstNumber: firstCard.shading, secondNumber: secondCard.shading)
    }
        
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.color == rhs.color && lhs.number == rhs.number && lhs.symbol == rhs.symbol && lhs.shading == rhs.shading
    }
}

enum CardState: Int {
    case inDeck = 0
    case onDisplay = 1
    case recycled = 2
}
