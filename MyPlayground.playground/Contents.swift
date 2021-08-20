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
//var menuItem = fastFoodMenu.hamburger(numberOfPatties: 2)
//
////switch menuItem {
////case .hamburger: break
////case .fries:
////    print("Fries")
////    print("Great, awesome")
////case .drink: print("Drink")
////default: print("Something else")
////}
//
//// вот так можно использовать ассациированные данные в енумах
//switch menuItem {
//case .hamburger(let pattyCount):        print("A burger with \(pattyCount) patties")
//case .fries(let size):                  print("A \(size) portion of fries")
//case .drink(let liter, let brand):      print("A \(liter)L of \(brand) Drink")
//default: print("Something else")
//}


// Методы и переменные в ENUM-ах

//enum FastFoodMenu {
//    case hamburger(numberOfPatties: Int)
//    case fries(size: FryOrderSize)
//    case drink(String, liter: Double)
//    case cookie
//
//    func isIncludedInSpecialOrder(number: Int) -> Bool {
//        switch self {
//        case .hamburger(let pattyCount): return pattyCount == number
//        case .cookie, .fries: return true
//        case .drink (_, let liter): return liter == 0.5
//        }
//    }
//}
//
//enum FryOrderSize {
//    case small
//    case large
//}

// Optionals

var someNumber: Int? = 3

//print(someNumber!)

// if let

//if let number = someNumber { // если someNumber = nil, тогда условие не выполнится
//    print(number)
//} else {
//    print("There is no number")
//}

//// Nil coalescing operator
//
//print (someNumber ?? 123) // если someNumber = nil, тогда вызовет 123, а если нет, то someNumber
//

// guard

//func multiplyByTwo (number: Int?) {
//    guard let guardNumber = number else {
//        print("There is nil")
//        return
//    }
//    print("\(guardNumber) x 2 is \(guardNumber * 2)")
//}
//
//multiplyByTwo(number: someNumber)

// Optional chaining

//struct iPhone {
//    var model: String
//    var memory: Int
//    var color: String
//}
//
//var myIPhone: iPhone?
//myIPhone = iPhone(model: "12 Pro", memory: 256, color: "Gray")
//
//let deviceColor = myIPhone?.color // автоматически становится опциональным типом и возвращает nil
//
//if let phoneColor = deviceColor {
//    print("Phone color is \(phoneColor)")
//}


// for in цикл stride

//for i in 1...5 {
//    print(i)
//}
//
//print("----------")
//
//for i in 1..<5 {
//    print(i)
//}

//for i in stride(from: 1.5, to: 5, by: 0.5) // 5ка здесь не попадёт, получается полузамкнутый диапазон
//{
//    print(i)
//}
//
//print("----------")
//
//for i in stride(from: 2, through: 10, by: 2)
//{
//    print(i)
//}
//


// Tuples - кортежи. Такой инструмент для группирования значений

let money = ("$", 100)

money.0
money.1


let money1 = (currency: "$", amount: 100)

money1.amount
money1.currency

money1.0
money1.1
