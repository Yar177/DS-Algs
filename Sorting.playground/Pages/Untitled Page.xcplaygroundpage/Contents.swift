import UIKit


//MARK: Selection Sort
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

selectionSort(array: [8, 4,  3, 2, 0, 1,3,5,1,2,5,1,6,3,8,0])


//MARK: Bubble Sort

func bubbleSort(a:[Int]) -> [Int]{
    var arr = a
    for i in 0..<arr.count{
        for j in 1..<arr.count - i{
            if arr[j] < arr[j - 1] {
                let temp = arr[j - 1]
                arr[j - 1] = arr[j]
                arr[j] = temp
                print("--------------")
                print(arr)
               
            }
            
        }
        print("----....>......-----")
    }
    return arr
}

bubbleSort(a: [8, 4,  3, 2, 0, 1,3,5,1,2,5,1,6,3,8,0])



//MARK: Decrease and Conqure

//MARK: Insertion Sort

func insertionSort(_ a:[Int],_ n: Int) -> [Int]{
    if (n <= 1){
        return a
    }
    print(a)
    insertionSort(a, n - 1)
    var arr = a
    var j = n - 2
    print(j)
    while j >= 0 && arr[j] > arr[j+1] {
        arr.swapAt(j, j + 1)
        j = j - 1
    }
    return  arr
}
let intArr = [8, 4,  3, 2, 0, 1,3,5,1,2,5,1,6,3,8,0]
insertionSort(intArr, intArr.count )
