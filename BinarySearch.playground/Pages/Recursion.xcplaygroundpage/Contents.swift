//: [Previous](@previous)

import Foundation


//1 - Base Case / 2 - Recursive Case
//Call Stack


func factorial(number: Int) -> Int{
    //base case
    if number == 0{
        return 1
    }
    //recursive case
    return number * factorial(number: number - 1)
}

//Call Stack
//5 * factorial(number: 4)
//4 * factorial(number: 3)
//3 * factorial(number: 2)
//2 * factorial(number: 1)
//1 * factorial(number: 0)
//0 * factorial(number: 1)
factorial(number: 5)


func power(num: Int, n: Int) -> Int{
    //base case
    if n == 0 {
        return 1
    }
    //recursive case
    return num * power(num: num, n: n - 1)
}


//Call Stack
// 2 * power(num: 2, n: 2) = 2 * 4 = 8
// 2 * power(num: 2, n: 1) = 2 * 2 = 4
// 2 * power(num: 2, n: 0) = 2 * 1 = 2


power(num: 2, n: 3)







//: [Next](@next)
