//: [Previous](@previous)

import Foundation

var arr1 = [1, 2, 3]
var arr2 = arr1

func address(o: UnsafeRawPointer) -> Int{
    return Int(bitPattern: o)
}



//: [Next](@next)
