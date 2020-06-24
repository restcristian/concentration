//
//  Card.swift
//  standford
//
//  Created by Cristian Restituyo on 18.06.20.
//  Copyright © 2020 Cristian Restituyo. All rights reserved.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched  = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
