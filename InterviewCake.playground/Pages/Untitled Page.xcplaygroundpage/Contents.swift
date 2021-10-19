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











































































































