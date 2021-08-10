//: [Previous](@previous)

import Foundation
import UIKit

func factorial(_ value: UInt) -> UInt{
    if value == 0{return 1}
    var product: UInt = 1
    for i in 1...value{
        product = product * i
    }
    return product
}

func recursiveFactorial(value: UInt) -> UInt{
    if value == 0{return 1}
    return value * recursiveFactorial(value: value - 1)
}

//print(factorial(3))
print(recursiveFactorial(value: 5))

//: [Next](@next)
