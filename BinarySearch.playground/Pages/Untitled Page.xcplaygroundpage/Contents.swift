import UIKit

var greeting = "Hello, playground"
var searchArray:[Int] = []
for i in 0...2100{
    searchArray.append(i)
}
//print(searchArray)

func binarySearch(item:Int, array:[Int]) -> Int{
    var low = 0
    var high:Int = array.count - 1
    var conter = 0
    while low <= high{
        print("count #\(conter)")
        conter += 1
        var mid = (low + high) / 2
        if array[mid] == item{
            return mid
        }else if mid > item{
            high = mid - 1
        }else if mid < item{
            low = mid + 1
        }
    }
    return 0
}

binarySearch(item: 2233, array: searchArray)






