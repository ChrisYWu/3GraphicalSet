//
//  CardsAreaView.swift
//  3GraphicalSet
//
//  Created by Chris Wu on 11/16/18.
//  Copyright © 2018 Wu Personal Team. All rights reserved.
//

import UIKit

class CardsAreaView: UIView {
    
    //MARK: Instance variables
    private var cardButtons = [Card: CardView]() { didSet { setNeedsDisplay(); setNeedsLayout() } }
    private var grid = Grid(layout: Grid.Layout.aspectRatio(1.6))
    
    //MARK: Debug Helper
    //private static var layoutCallCount:Int = 0
    
    //MARK: Public APIs
    func removeCard(_ card: Card) {
        if cardButtons.keys.first(where: {$0 == card }) != nil {
            cardButtons[card]?.displayState = .onDisplay
            cardButtons[card]?.removeFromSuperview()
            cardButtons.removeValue(forKey: card)
        }
    }
    
    func addCard(_ card: Card) {
        let cv = CardView()
        cv.number = card.number
        cv.shade = card.shading
        cv.shape = card.symbol
        
        switch card.color {
        case 0: cv.color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        case 1: cv.color = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        case 2: cv.color = UIColor.purple
        default: break
        }
        
        cv.displayState = .onDisplay
                
        cardButtons[card] = cv
        addSubview(cv)
    }
    
    func removeAll() {
        for card in cardButtons.keys {
            cardButtons[card]?.displayState = .onDisplay
            cardButtons[card]?.removeFromSuperview()
        }
        cardButtons.removeAll()
    }
    
    func setCardDisplayState(_ card: Card, displayState: CardDisplayState ) {
        cardButtons[card]?.displayState = displayState
    }
    
//    @objc func shuffle(byHandlingGestureRecognizedBy recognizer: UIRotationGestureRecognizer) {
//        switch recognizer.state {
//        case .ended:
//            let numberOfCards = cardButtons.count
//            var cardArray = [Card]()
//
//            print("Shuffle triggered, numberOfCards = \(numberOfCards)")
//
//            for card in cardButtons.keys {
//                cardButtons[card]?.removeFromSuperview()
//                cardArray.append(card)
//            }
//            cardButtons.removeAll()
//            
//            print("cardArray = \(cardArray)")
//            
//            for _ in 0 ..< numberOfCards {
//                addCard(cardArray.remove(at: cardArray.count.arc4random))
//                print("cardArray.count = \(cardArray.count)")
//            }
//        default: break
//        }
//    }
    
    override func layoutSubviews() {
        grid.cellCount = cardButtons.count
        grid.frame = bounds
                
        var count = 0
        for card in cardButtons.keys {
            if let cell = grid[count] {
                cardButtons[card]?.frame = cell.zoom(by: 0.85)
                count += 1
            }
        }
    }
        
    func getCardAtHitPoint(_ point: CGPoint) -> Card? {
        var retval: Card?
        for card in cardButtons.keys {
            if let cv = cardButtons[card] {
                if cv.frame.contains(point) {
                    retval = card
                }
            }
        }
        return retval
    }
    
    
}
