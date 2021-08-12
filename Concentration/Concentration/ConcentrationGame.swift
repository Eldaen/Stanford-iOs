//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Денис Сизов on 10.08.2021.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]() // массив карт, сразу нужно вызвать ()
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices { // проверяем карточки на перевёрнутость. Если больше одной перевёрнуто, тогда единственная перевёрнутая должна быть равна nil, т.е. не единственная
                if cards[index].isFaceUp {
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
                cards[index].isFaceUp = ( index == newValue ) // вот так хитро записано, что в цикле перебирает все карты и true ставит только тому индексу, который равен newValue, т.е. indexOfOneAndOnlyFaceUpCard = index, где index и будет это newValue
            }
        }
    }
    
    func chooseCard (at index: Int) {
        
        if !cards[index].isMatched { // если карточки не совпали
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index  { // Юзаем optional binding, проверяем, есть ли уже перевёрнутая карточка и не нажимаем ли мы на уже перевёрнутую
                if cards[matchingIndex].identifier == cards[index].identifier { // если перевёрнутая карточка совпала со свеженажатой, то отмечаем их как совпавшие
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
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
        cards.shuffle()
    }
    
}
