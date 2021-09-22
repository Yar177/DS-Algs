//: [Previous](@previous)

import Foundation


class BubbleSort{
    func sort(_ array:[Int]) -> [Int]{
        var arr = array
        let n = arr.count
        for i in 0..<n-1{
            for j in 0..<n-i-1{
                if arr[j] > arr[j+1]{
                let temp = arr[j]
                arr[j] = arr[j+1]
                arr[j + 1] = temp
                }
            }
        }
        return arr
    }
}

let a = [2,4,5,2,1,4,5,6,3]
let bub = BubbleSort()
bub.sort(a)


func mergeSoer(_ array:[Int]) -> [Int]{
    
}


//: [Next](@next)
