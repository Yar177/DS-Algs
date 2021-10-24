import UIKit



//MARK: LikedList
enum GetIthItemInLInkedListError: Error, CustomStringConvertible{
    case negativeIndex
    case indexGreaterThanList
    var description: String{
        switch self{
        case .negativeIndex:
            return "Index can't be negative"
        case .indexGreaterThanList:
            return "List has fewer that idex + 1 nodes"
        }
    }
}


func getIthItemInLinkedList<T: Equatable>(head: LinkedListNode<T>, i:Int) throws ->  LinkedListNode<T>{
    guard i >= 0 else{
        throw GetIthItemInLInkedListError.negativeIndex
    }
    
    var currentNode:LinkedListNode? = head
    var currentPosition = 0
    
    while currentNode != nil{
        if currentPosition == i{
            return currentNode!
        }
        
        currentNode = currentNode?.next
        currentPosition += 1
    }
    
    throw GetIthItemInLInkedListError.indexGreaterThanList
}


class  LinkedListNode<T>{
    var head: LinkedListNode?
    var next: LinkedListNode?
    
}



class Meeting: CustomStringConvertible{
    var startTime: Int
    var endTime: Int
    
    init(startTime: Int, endTime: Int){
        self.startTime = startTime
        self.endTime = endTime
    }
    var description: String{
        return "(\(startTime), \(endTime))"
    }
}


let meeting1 = Meeting(startTime: 2, endTime: 3)
let meeting2 = Meeting(startTime: 6, endTime: 9)

var allMeetings = [
    Meeting(startTime: 0, endTime: 1),
    Meeting(startTime: 3, endTime: 5),
    Meeting(startTime: 4, endTime: 8),
    Meeting(startTime: 10, endTime: 12),
    Meeting(startTime: 9, endTime: 10)
]


func mergeRange(_ meetings: [Meeting]) -> [Meeting]{
    var sortedMeetings = meetings.sorted { $0.startTime < $1.startTime}
   // sortedMeetings.sort {$0.startTime < $1.startTime}
    
    var mergedMeetings = [sortedMeetings[0]]
    for i in 1..<sortedMeetings.count{
        let currentMeeting = sortedMeetings[i]
        let lastMeergedMeeting = mergedMeetings[mergedMeetings.count - 1]
        
        if currentMeeting.startTime <= lastMeergedMeeting.endTime{
            lastMeergedMeeting.endTime = max(lastMeergedMeeting.endTime , currentMeeting.endTime)
        }else{
            mergedMeetings.append(currentMeeting)
        }
    }
    
    return mergedMeetings
}


print(mergeRange(allMeetings))



var chArray = ["a" , "b" , "d" , "r" , "y"]


func reverseeInPlace(_ chArray: inout [String]){
    var startInex = 0
    var endIndex = chArray.count - 1
    
    while startInex < endIndex{
        let temp = chArray[startInex]
        chArray[startInex] = chArray[endIndex]
        chArray[endIndex] = temp
        startInex += 1
        endIndex -= 1
    }

}

reverseeInPlace(&chArray)

var message:[Character] = ["c", "a", "k", "e", " ",
             "p", "o", "u", "n", "d", " ",
             "s", "t", "e", "a", "l"]
func reverseWords(_ str: inout [Character]){
    guard str.count > 0 else{
        return
    }
    
    reverse(&str, leftIndex: 0, rightIndex:  str.count)
   
    var currentWordStart = 0
    for i in 0..<str.count{
        if str[i] == " "{
            reverse(&str, leftIndex: currentWordStart, rightIndex: i)
            currentWordStart = i + 1
        }
    }
    reverse(&str, leftIndex: currentWordStart, rightIndex: str.count)
}

func reverse(_ str: inout [Character], leftIndex: Int, rightIndex: Int){
    var leftIndex = leftIndex
    var rightIndex = rightIndex - 1
    while leftIndex < rightIndex{
        let temp = str[leftIndex]
        str[leftIndex] = str[rightIndex]
        str[rightIndex] = temp
        leftIndex += 1
        rightIndex -= 1
    }
}

//reverseWords(&message)
//
//print(message)


//MARK: IC Solution Reverse Char Array in place
func reverseCharacters(_ str: inout [Character], from startIndex: Int, until endIndex: Int){
    guard str.count > 0 else{
        return
    }
    var leftIndex = startIndex
    var rightIndex = endIndex - 1
    while leftIndex < rightIndex{
        let temp = str[leftIndex]
        str[leftIndex] = str[rightIndex]
        str[rightIndex] = temp
        leftIndex += 1
        rightIndex -= 1
    }
}

func reverWords(_ str: inout [Character]){
    reverseCharacters(&str, from: str.startIndex, until: str.endIndex)
    
    var currentWordStrartIndex = str.startIndex
    for i in str.indices{
        if str[i] == " "{
            reverseCharacters(&str, from: currentWordStrartIndex, until: i)
            currentWordStrartIndex = str.index(after: i)
        }
    }
    reverseCharacters(&str, from: currentWordStrartIndex, until: str.endIndex)
}


reverWords(&message)
print(message   )



let myArray = [3, 4, 6, 10, 11, 15]
let alicesArray = [1, 5, 8, 12, 14, 19]

func mergeArrays(_ arr1: [Int],_ arr2:[Int]) -> [Int]{
    var resultArray:[Int] = []
    var arr1Index = arr1.startIndex
    var arr2Index = arr2.startIndex
    
//    if arr1.count < arr2.count{
//
//    }
    
    while arr1Index < arr1.count{
        if arr1[arr1Index] < arr2[arr2Index]{
            resultArray.append(arr1[arr1Index])
            arr1Index += 1
        }else{
            resultArray.append(arr2[arr2Index])
            arr2Index += 1
        }
    }
    
    
    return resultArray
}

print(mergeArrays(myArray, alicesArray))




func meregeSortedArrays(_ myArray:[Int], _ alicesArray:[Int]) -> [Int]{
    return (myArray + alicesArray).sorted()
}


print(meregeSortedArrays(myArray, alicesArray))
// prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]



//MARK: Merge to arrays IC Solution
func mergeArraysIc(_ myArray: [Int], _ alicesArray:[Int]) -> [Int]{
    var mergeArray = Array(repeating: 0, count: myArray.count + alicesArray.count)
    
    var currentIndexAlices = 0
    var currentIndexMine = 0
    var currentIndexMerged = 0
    
    while currentIndexMerged < mergeArray.count{
        let isMyArrayExhausted = currentIndexMine >= myArray.count
        let isAlicesArrayExhasuted = currentIndexAlices >= alicesArray.count
        
        if !isMyArrayExhausted && (isAlicesArrayExhasuted || myArray[currentIndexMine] < alicesArray[currentIndexAlices]){
            mergeArray[currentIndexMerged] = myArray[currentIndexMine]
            currentIndexMine += 1
        } else {
            mergeArray[currentIndexMerged] = alicesArray[currentIndexAlices]
            currentIndexAlices += 1
        }
        currentIndexMerged += 1
    }
    
    return mergeArray
}




print(mergeArraysIc(myArray, alicesArray))





var takeOutOrders = [17, 8, 24]
var dineInOrders = [12, 19, 2]
var servedOrders = [17, 8, 12, 19, 24, 2]


var takeOutOrders1 = [1, 3, 5]
var dineInOrders1 =  [2, 4, 6]
var servedOrders1 = [1, 2, 4, 6, 5, 3]


    func checkOrderOrder(_ takeOut: [Int], _ dineIn: [Int], _ servedOrders: [Int]) -> Bool{
        var isOrdersInOrder = true
        
        var takeOutCurrentIndex = 0
        var dineInCurrentIndex = 0
        var servedOrdersCurrentIndex = 0
        
        while servedOrdersCurrentIndex < servedOrders.count{
            let isTakeOutExhousted = takeOutCurrentIndex >= takeOut.count
            let isDineInExhausted = dineInCurrentIndex >= dineIn.count
            if !isTakeOutExhousted && (servedOrders[servedOrdersCurrentIndex] == takeOut[takeOutCurrentIndex]){
                takeOutCurrentIndex += 1
            }else if !isDineInExhausted && servedOrders[servedOrdersCurrentIndex] == dineIn[dineInCurrentIndex]{
                dineInCurrentIndex += 1
            }else{
                isOrdersInOrder = false
            }
            servedOrdersCurrentIndex += 1
        }
        return isOrdersInOrder
    }


print(checkOrderOrder(takeOutOrders, dineInOrders, servedOrders))
print(checkOrderOrder(takeOutOrders1, dineInOrders1, servedOrders1))













    
/*
let xs = (0..<26).map({Character(UnicodeScalar("a".unicodeScalars.first!.value + $0)!)})


let aScalars = "a".unicodeScalars
let aCode = aScalars[aScalars.startIndex].value

let letters: [Character] = (0..<26).map {
    i in Character(UnicodeScalar(aCode + i)!)
}

*/

let hScalars = "a".unicodeScalars



































































































