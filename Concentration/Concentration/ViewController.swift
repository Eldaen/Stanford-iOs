//
//  ViewController.swift
//  Concentration
//
//  Created by Денис Сизов on 07.08.2021.
//

import UIKit

class ViewController: UIViewController {

    var touchesCount = 0 {
        didSet { // Если меняется значение, то обновляем на экране, property Observer
            touchesLabel.text = "Touches: \(touchesCount)"
        }
    }
    
    let emojiCollection = ["🦊", "🐰", "🦊", "🐰"]
    
    /*
     Функция, которая реализует сам переворот карточки.
     */
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.6288433671, blue: 1, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchesLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) { // функция нажатия на кнопку, кнопки в коллекции
        touchesCount += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
    }
}

