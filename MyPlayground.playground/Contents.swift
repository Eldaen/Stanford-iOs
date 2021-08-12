import UIKit

// Enum Assosiated data, Ассоциированные данные

//enum fastFoodMenu {
//    case hamburger(numberOfPatties: Int)
//    case fries(size: fryOrderSize)
//    case drink(String, liter: Double)
//    case cookie
//}
//
//enum fryOrderSize {
//    case small
//    case large
//}
//
//// Уcтанавливаем значение нашему ENUM-у
//
//var menuItem = fastFoodMenu.hamburger(numberOfPatties: 2)
//var otherItem: fastFoodMenu = .cookie // если указать сразу тип данных, то можно так

// Checking an enum's state


enum fastFoodMenu {
    case hamburger(numberOfPatties: Int)
    case fries(size: fryOrderSize)
    case drink(String, liter: Double)
    case cookie
}

enum fryOrderSize {
    case small
    case large
}

var menuItem = fastFoodMenu.hamburger(numberOfPatties: 2)

//switch menuItem {
//case .hamburger: break
//case .fries:
//    print("Fries")
//    print("Great, awesome")
//case .drink: print("Drink")
//default: print("Something else")
//}

// вот так можно использовать ассациированные данные в енумах
switch menuItem {
case .hamburger(let pattyCount):        print("A burger with \(pattyCount) patties")
case .fries(let size):                  print("A \(size) portion of fries")
case .drink(let liter, let brand):      print("A \(liter)L of \(brand) Drink")
default: print("Something else")
}

