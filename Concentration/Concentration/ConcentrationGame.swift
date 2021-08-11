//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Денис Сизов on 10.08.2021.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]() // массив карт, сразу нужно вызвать ()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard (at index: Int) {
        
        if !cards[index].isMatched { // если карточки не совпали
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index  { // Юзаем optional binding, проверяем, есть ли уже перевёрнутая карточка и не нажимаем ли мы на уже перевёрнутую
                if cards[matchingIndex].identifier == cards[index].identifier { // если перевёрнутая карточка совпала со свеженажатой, то отмечаем их как совпавшие
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else { // перевёрнём лицом вниз все карточки кроме той что нажали, раз уж не совпало
                for id in cards.indices { //cards.indices это все доступные индексы массива
                    cards[id].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // Генерим массив карточек при инициализации, смотря сколько пар передали
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card] // Добавляем в массив cards две одинаковые карточки, можно ещё через cards.append(card) 2 раза
        }
    }
    
}
