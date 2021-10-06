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
