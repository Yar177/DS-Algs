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
                print(arr)
            }
        }
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


//MARK: Devide and Conquer
//MARK: Merge Sort
func mergeSort<T : Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else {return array}
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left:[T], _ reight:[T]) -> [T]{
    var leftIndex = 0
    var rightIndex = 0
    var sortedArray:[T] = []
    while leftIndex < left.count && rightIndex < reight.count {
        let leftElement = left[leftIndex]
        let rightElement = reight[rightIndex]
        if leftElement < rightElement {
            sortedArray.append(leftElement)
            leftIndex += 1
        }else if leftElement > rightElement{
            sortedArray.append(rightElement)
            rightIndex += 1
        }else{
            sortedArray.append(leftElement)
            leftIndex += 1
            sortedArray.append(rightElement)
            rightIndex += 1
        }
    }
    while leftIndex < left.count {
        sortedArray.append(left[leftIndex])
        leftIndex += 1
    }
    while rightIndex < reight.count {
        sortedArray.append(reight[rightIndex])
        rightIndex += 1
    }
    return sortedArray
}

mergeSort(intArr)


//MARK: Quick Sort
func quickSort<T: Comparable>(_ array:[T], _ startIndex: Int, _ endIndex: Int){
//    let placedItemIndex = partion
    
    
}

func partion<T: Comparable>(_ array: inout [T], _ startIndex: Int, _ endIndex: Int){
    
}


func swiftyQuickSoer<T: Comparable>(_ array: [T])->[T]{
    guard array.count > 1 else{return array}
    let pivot = array[array.count / 2]
    let less = array.filter{$0 < pivot}
    let equal = array.filter{$0 == pivot}
    let greater = array.filter{$0 > pivot}
    return swiftyQuickSoer(less) + equal + swiftyQuickSoer(greater)
}
swiftyQuickSoer(intArr)






