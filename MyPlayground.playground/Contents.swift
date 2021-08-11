import UIKit

var greeting = "Hello, playground"


// Выполнение с использованием функций

struct Worker {
    var name: String
    var monthlySalary: Double
    var weeksPerMonth: Int
    var hoursPerDay: Double
}

var worker1 = Worker(name: "Bob", monthlySalary: 10_000, weeksPerMonth: 4, hoursPerDay: 8)

func weeklySalary (monthlySalary: Double, weeksPerMonth: Int) -> Double {
    return monthlySalary / Double(weeksPerMonth)
}

func hourlySalary (monthlySalary: Double, weeksPerMonth: Int, hoursPerDay: Double) -> Double {
    return monthlySalary / Double(weeksPerMonth) / (hoursPerDay * 5)
}

worker1.monthlySalary
weeklySalary(monthlySalary: worker1.monthlySalary, weeksPerMonth: worker1.weeksPerMonth)
hourlySalary(monthlySalary: worker1.monthlySalary, weeksPerMonth: worker1.weeksPerMonth, hoursPerDay: worker1.hoursPerDay)


// Выполнение через computed properties

struct Worker2 {
    var name: String
    var monthlySalary: Double
    var weeksPerMonth: Int
    var hoursPerDay: Double
    
    var weeklySalary: Double {
        return monthlySalary / Double(weeksPerMonth)
    }
    var hourlySalary: Double {
        return monthlySalary / Double(weeksPerMonth) / (hoursPerDay * 5)
    }
}

var worker2 = Worker2(name: "Frank", monthlySalary: 20_000, weeksPerMonth: 4, hoursPerDay: 8)

worker2.weeklySalary
worker2.hourlySalary


// Использование get и set

struct Worker3 {
    var name: String
    var monthlySalary: Double
    var weeksPerMonth: Int
    var hoursPerDay: Double
    
    var weeklySalary: Double {
        get {
            return monthlySalary / Double(weeksPerMonth)
        }
        set {
            monthlySalary = newValue * 4
        }
    }
    var hourlySalary: Double {
        get {
            return monthlySalary / Double(weeksPerMonth) / (hoursPerDay * 5)
        } set {
            monthlySalary = newValue * hoursPerDay * Double(weeksPerMonth) * 5
        }
        
    }
}

var worker3 = Worker3(name: "Bob3", monthlySalary: 10_000, weeksPerMonth: 4, hoursPerDay: 8)

worker3.monthlySalary

worker3.weeklySalary = 3000
worker3.monthlySalary

worker3.hourlySalary = 200
worker3.monthlySalary
