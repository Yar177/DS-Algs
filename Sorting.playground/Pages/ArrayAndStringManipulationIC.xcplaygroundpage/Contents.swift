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
func mergeRange(_ meetings:[Meeting]) -> [Meeting]{
    var sortedMeetings = meetings.sorted(by: {$0.startTime < $1.startTime})
    var mergeMeetings = [sortedMeetings[0]]
    for i in 1..<sortedMeetings.count{
        let currentMeeting = sortedMeetings[i]
        let lastMegedMeeting = mergeMeetings[mergeMeetings.count - 1]
        if currentMeeting.startTime <= lastMegedMeeting.endTime{
            lastMegedMeeting.endTime = max(lastMegedMeeting.endTime, currentMeeting.endTime)
        }else{
            mergeMeetings.append(currentMeeting)
        }
    }
    return sortedMeetings
}

print(mergeRange(allMeetings))


func isPalindreeome(_ x: Int) -> Bool{
    var num = x
    var reveresed = 0
    while num > 0{
        let reminder = num % 10
        print(reminder)
        reveresed = reveresed * 10 + reminder
        print(reveresed)
        num = num / 10
        print(num)
    }
    return x == reveresed
}


isPalindreeome(1881)





























//: [Next](@next)
