//: [Previous](@previous)

import Foundation

var greeting = "Hello, LinkeList"

print(greeting)



//MARK: LinkedList

class Node<T>{
    var data: T
    var next: Node?
    
    init(_ data: T, _ next: Node?) {
        self.data = data
        self.next = next
    }
}

let node1 = Node(1, node2)
let node2 = Node(2, node3)
let node3 = Node(3, nil)

print(node2.data)










//: [Next](@next)
