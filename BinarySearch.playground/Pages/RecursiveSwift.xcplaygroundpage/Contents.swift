//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


var fibmemo:[UInt:UInt] = [0:0, 1:1]

func fib1(_ n: UInt) -> UInt{
    if let results = fibmemo[n]{
        return results
    }else{
        fibmemo[n] = fib1(n - 1) + fib1( n - 2)
    }
    return fibmemo[n]!
}



fib1(5)




//: [Next](@next)
