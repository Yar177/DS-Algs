//: [Previous](@previous)

import Foundation

func calculatePi(_ nTerms: UInt) -> Double{
    let numerator: Double = 4
    var dominator: Double = 1
    var operation: Double = -1
    var pi:Double = 0
    for _ in 0..<nTerms {
        pi += operation * (numerator/dominator)
        dominator += 2
        operation *= -1
    }
    return abs(pi)
}



print(calculatePi(48898))



//: [Next](@next)
