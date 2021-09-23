import UIKit

func selectionSort(array:[Int]) -> [Int]{
    guard array.count > 1 else {
        return array
    }
    var array1 = array
    for i in 0..<array1.count{
        var min = i
        for x in i + 1..<array1.count{
            if array1[x] < array1[min]{
                min = x
            }
        }
        if i != min{
            array1.swapAt(i, min)
        }
    }
    return array1
}

selectionSort(array: [1,3,5,1,2,5,1,6,3,8,0])
