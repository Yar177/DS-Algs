//: [Previous](@previous)

import Foundation

func binarySearch(for input:Int, in arr:[Int]) -> Bool{
    //floorIndex and ceillingIndex as walls
    var floorIndex = 0
    var ceillingIndex = arr.count
    
    while floorIndex < ceillingIndex{
        let distance = ceillingIndex - floorIndex
        let halfDistance = distance / 2
        let guessIndex = floorIndex + halfDistance
        
        let guessVal = arr[guessVal]
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



binarySearch(for 3, in [3,4,5,6,3,2,1])













//: [Next](@next)
