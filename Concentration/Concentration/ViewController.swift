//
//  ViewController.swift
//  Concentration
//
//  Created by Денис Сизов on 07.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // lazy нужен чтобы св-во game инициализировалось только тогда, когда его кто-то вызовет. Иначе тут ошибка, хз пока почему точно.
    lazy var game = ConcentrationGame(numberOfPairsOfCards: ( buttonCollection.count + 1 ) / 2) // +1 чтобы 0 не было никогда

    var touchesCount = 0 {
        didSet { // Если меняется значение, то обновляем на экране, property Observer
            touchesLabel.text = "Touches: \(touchesCount)"
        }
    }
    
    let emojiCollection = ["🦊", "🐰", "🐝", "🦄", "🐭", "🐤", "🐵", "🐌", "🦞", "🐋", "🐓", "🕷"]
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentifier(for card: Card) -> String {
        return emojiDictionary[card.identifier] ?? "?" // ?? Значит, кто если первое не nil, то возвращаем его.
    }
    
    // Изменяет вид того что на экране после обработки в Модели
    func updateViewFromModel() {
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
    
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchesLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) { // функция нажатия на кнопку, кнопки в коллекции
        touchesCount += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
        }
    }
}

