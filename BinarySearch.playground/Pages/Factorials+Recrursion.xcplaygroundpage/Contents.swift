//: [Previous](@previous)

import Foundation
import UIKit

func factorial(_ value: UInt) -> UInt{
    if value == 0{
        return 1
    }
    var product: UInt = 1
    for i in 1...value{
        product = product * i
    }
    return product
}

print(factorial(value: 3))

//: [Next](@next)
