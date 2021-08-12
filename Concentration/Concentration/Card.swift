//
//  Card.swift
//  Concentration
//
//  Created by Денис Сизов on 10.08.2021.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator () -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    // Каждый раз при создании карты ей даёт уникальный ID
    init() {
        self.identifier = Card.identifierGenerator()
    }
}
