//: [Previous](@previous)

import Foundation


var memo = [Int : Int]()

func fib(_ n: Int) -> Int{
    
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    
    if let results = memo[n] {return results}
    
    memo[n] = fib(n - 1) + fib(n - 2)
    
    return memo[n]
    
}




//: [Next](@next)
