//: [Previous](@previous)

import Foundation

func binarySearch(for input:Int, in arr:[Int]) -> Bool{
    //floorIndex and ceillingIndex as walls
    var floorIndex = -1
    var ceillingIndex = arr.count
    
    while floorIndex + 1 < ceillingIndex{
        let distance = ceillingIndex - floorIndex
        let halfDistance = distance / 2
        let guessIndex = floorIndex + halfDistance
        
        let guessVal = arr[guessIndex]
        if guessVal == input{
            return true
        }
        if guessVal > input{
            ceillingIndex = guessIndex
        }else{
            floorIndex = guessIndex
        }
    }
    return false
}

binarySearch(for: 12, in: [0,1,1,1,2,3,5])












//: [Next](@next)
