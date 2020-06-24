//
//  Standford.swift
//  standford
//
//  Created by Cristian Restituyo on 18.06.20.
//  Copyright © 2020 Cristian Restituyo. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards =  [Card]()
    private var indexOfOneAndOnlyFacedUpCard: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFacedUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = index == newValue
            }
        }
    }
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Standford.chooseCard(at: \(index)): Chosen index not in the card")
        if(!cards[index].isMatched){
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                // Check if card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                
            } else {
                // either no cards or 2 cards are faced up
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
        // cards[index].isFacedUp = !cards[index].isFacedUp
    }
    
    init(numOfPairsOfCards:Int){
        assert(numOfPairsOfCards > 0, "Standford.init(numOfPairsOfCards: \(numOfPairsOfCards)): You must have at least one pair of cards")
        for _ in 0..<numOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO:
        // Shuffle the Cards
        
    }
    
}
