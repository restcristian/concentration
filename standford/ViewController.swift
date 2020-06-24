//
//  ViewController.swift
//  standford
//
//  Created by Cristian Restituyo on 18.06.20.
//  Copyright © 2020 Cristian Restituyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game =  Concentration(numOfPairsOfCards: numOfPairsOfCards)
    
    var numOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }

    private(set) var counter = 0 {
        didSet {
            flipCountLabel.text = "Flip: \(counter)"
        }
    }
   
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        counter+=1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Index out of bounds")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
                button.setTitle("", for: UIControl.State.normal)
            }
        }
    }
    
    private var emojisChoices = ["👻", "🎃", "🥳", "🎓", "🤪",  "🇩🇪"]
    
    private var emoji = Dictionary<Int, String>()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil , emojisChoices.count > 0 {
                emoji[card.identifier] = emojisChoices.remove(at: emojisChoices.count.arc4random)
            }
        return emoji[card.identifier] ??  "?"
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int.init( arc4random_uniform(UInt32.init(self)))
        } else if self < 0 {
            return -Int.init( arc4random_uniform(UInt32.init(abs(self))))
        } else {
            return 0
        }
    }
}

