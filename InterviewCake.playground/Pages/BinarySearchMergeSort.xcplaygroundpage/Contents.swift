//: [Previous](@previous)

import Foundation
import Darwin

func binarySearch(for input:Int, in arr:[Int]) -> Bool{
    //floorIndex and ceillingIndex as walls
    var floorIndex = -1
    var ceillingIndex = arr.count
    
    while floorIndex + 1 < ceillingIndex{
        let halfDistance = (ceillingIndex - floorIndex) / 2
        let guessIndex = floorIndex + halfDistance
        let guessVal = arr[guessIndex]
        print("ceillingIndex:\(ceillingIndex) - halfDistance: \(halfDistance) - guessIndex: \(guessIndex) - guessVal\(guessVal)")

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

var arr1 = [0,1,1,1,2,3,3,4,4,5,6,6,7,8,8,8,8,9,10,11,12]
binarySearch(for: 12, in: arr1)



func mergeSortIc(_ array:[Int]) -> [Int]{
    if array.count < 2 {
        return array
    }
    let midIndex = array.count / 2
    let leftArray = Array(array[0..<midIndex])
    let rightArray = Array(array[midIndex..<array.count])
    
    let sortedLeft = mergeSortIc(leftArray)
    let sortRight = mergeSortIc(rightArray )
    
    var sortedArray = Array(repeating: 0, count: array.count)
    
    var currentSortedLeftIndex = 0
    var currentSortedRightIndex = 0
    for currentSortedIndex in 0..<array.count{
        if currentSortedLeftIndex < sortedLeft.count && (currentSortedRightIndex >= sortRight.count || sortedLeft[currentSortedLeftIndex] < sortRight[currentSortedRightIndex]){
            sortedArray[currentSortedIndex] = sortedLeft[currentSortedLeftIndex]
            currentSortedLeftIndex += 1
        }else{
            sortedArray[currentSortedIndex] = sortRight[currentSortedRightIndex]
            currentSortedRightIndex += 1
        }
    }
    return sortedArray
}


mergeSortIc([4,2,4,2,2,1,3,9,1,49,4,7,3,6,4,6])

let newArr = Array(arr1[0...])


func product1ToN(_ n: Int) -> Int{
    return n > 1 ? n * product1ToN(n - 1) : 1
}

product1ToN(4)

//: [Next](@next)
