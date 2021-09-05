//: [Previous](@previous)

import Foundation

import UIKit

/*
 Write a function that determines the length of any linked list.
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    // Do your work here...
    var count = 0
    if head == nil {return count}
    var node = head
    while node != nil{
        node = node?.next
        count += 1

    }
    return count
}


func printLinkedList(_ head: Node?) {
    if head == nil { return }
    
    var result = [Int]()
    var node = head
    result.append(node!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
}

func findMergeBrute(headA: Node?, headB: Node?) -> Int? {
    let lengthA = length(headA)
    let lengthB = length(headB)
    var currentA = headA
    for _ in 0...lengthA-1{
        let a = currentA?.data
        var currentB = headB
        for _ in 0...lengthB{
            let b = currentB?.data
            currentB = currentB?.next
            if a == b{
                return a
            }
        }
        currentA = currentA?.next
    }
    return nil
}


func findMerge(headA: Node?, headB: Node?) -> Int? {
   
    return nil
}



// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

length(nil) // 0
length(node1) // 6



// 10 11 12 13 4 5 6
let node11 = Node(11, node4)
let node10 = Node(10, node11)

printLinkedList(node1)
printLinkedList(node10)

print(findMerge(headA: node1, headB: node10))

//: [Next](@next)
