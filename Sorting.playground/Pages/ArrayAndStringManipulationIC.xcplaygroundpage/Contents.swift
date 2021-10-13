//: [Previous](@previous)

import Foundation

func product1ToN(_ n: Int) -> Int{
    return (n > 1) ? (n * product1ToN(n - 1 )) : 1
}
product1ToN(10)

func prod12N(_ n:Int) -> Int{
    var res = 1
    for num in 1...n{
        res *= num
    }
    return res
}
prod12N(10)

var arr = [1,2,3,6,3,4,1,3,5,6,7,5,3,2,6]

func squareOutPlace(_ nums: [Int]) -> [Int]{
    var sqArr = nums
    for i in 0..<nums.count{
        sqArr[i] *= nums[i]
    }
    return sqArr
}
squareOutPlace(arr)

func squareInPlace(_ nums: inout [Int]) -> Void{
    for i in 0..<nums.count{
        nums[i] *= nums[i]
    }
}
squareInPlace(&arr)


var dynamicArray:[Int] = []
let fixedArray:[Int] = Array(repeating: 2, count: 12)

dynamicArray.append(33)
//fixedArray.append(22)

print(dynamicArray)
print(fixedArray)






































//: [Next](@next)
