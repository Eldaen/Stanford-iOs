//
//  ViewController.swift
//  Concentration
//
//  Created by Денис Сизов on 07.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // lazy нужен чтобы св-во game инициализировалось только тогда, когда его кто-то вызовет. Иначе тут ошибка, хз пока почему точно.
    private lazy var game = ConcentrationGame(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return ( buttonCollection.count + 1 ) / 2 // +1 чтобы 0 не было никогда
    }

    private(set) var touchesCount = 0 {
        didSet { // Если меняется значение, то обновляем на экране, property Observer
            touchesLabel.text = "Touches: \(touchesCount)"
        }
    }
    
    private var emojiCollection = ["🦊", "🐰", "🐝", "🦄", "🐭", "🐤", "🐵", "🐌", "🦞", "🐋", "🐓", "🕷"]
    private var emojiDictionary = [Int:String]()
    
    //Возвращает эмодзи для переданного идентификатора карты
    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            emojiDictionary[card.identifier] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtenstion) // remove возвращает значение из массива по индексу и удаляет его, т.е. забираем эмодзи из массива
        }
        return emojiDictionary[card.identifier] ?? "?" // ?? Значит, кто если первое не nil, то возвращаем его.
    }
    
    // Изменяет вид того что на экране после обработки в Модели
    private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1) // если карточки совпали, то ставим прозрачность на 0
            }
        }
    }
    
    
    
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private weak var touchesLabel: UILabel!
    @IBAction private func buttonAction(_ sender: UIButton) { // функция нажатия на кнопку, кнопки в коллекции
        touchesCount += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
}

extension Int {
    var arc4randomExtenstion: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self))) // Рандомное число по размеру коллекции через .count, двойная конвертация нужна из-за того
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self)))) // abs возвращает абсолютное значение, т.к. рандом по отрицательной величине не работает, а так будет.
        } else {
            return 0
        }
    }
}

