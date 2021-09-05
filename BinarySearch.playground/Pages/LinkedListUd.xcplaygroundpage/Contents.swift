//: [Previous](@previous)

import Foundation

var greeting = "Hello, LinkeList"

print(greeting)



//MARK: LinkedList

class Node{
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

let node3 = Node(3)
let node2 = Node(2, node3)

let node1 = Node(1, node2)

//print(node2.data)

func printLinkedList(_ headNode: Node){
    print(headNode.data)
    var node = headNode
    while node.next != nil {
        print(node.next!.data)
        node = node.next!
    }
}

func printLinkedList1(_ head: Node?){
    if head == nil {return}
    
    var node = head
    print(node!.data)
    
    while node?.next != nil {
        print(node!.next!.data)
        node = node?.next
    }
}

printLinkedList(node1)

print(node1.next!.data)



class LinkList {
    private var head: Node?
        
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }

    func getFirst() -> Int? {
        guard head != nil else {
            return nil
        }
        return head!.data
    }

    func addBack(_ data: Int) {
        let newNode = Node(data)
        if head == nil {
            head = newNode
            return
        }
        var node = head!
        while(node.next != nil){
            node = node.next!
        }
        node.next = newNode
    }

    func getLast() -> Int? {
        if head == nil {return nil}
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        return node.data
    }

    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        let newNode = Node(data)
        var currentNode  = head
        for _ in 0..<position - 1 {
            currentNode = currentNode?.next
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
        
    }
    
    func deleteFirst() {
        head = head?.next
    }

    func deleteLast() {
        if head == nil{return}
        var nextNode = head
        var currentNode: Node?
        
        while nextNode?.next != nil{
            currentNode = nextNode
            nextNode = nextNode?.next
        }
        currentNode?.next = nil
    }
    
    func delete(at position: Int) {
        if position == 0{
            self.deleteFirst()
            return
        }
        var nextNode = head
        var previousNode: Node?
        for _ in 0..<position{
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nextNode?.next
    }
    
    var isEmpty: Bool {
        return false
    }
    
    func clear() {
    }
    
    func printLinkedList() {
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
}

let linkedList = LinkList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)

linkedList.printLinkedList()

linkedList.addFront(4)

linkedList.printLinkedList()

linkedList.addBack(5)

linkedList.printLinkedList()

print(linkedList.getFirst())
print(linkedList.getLast())

linkedList.insert(position: 2, data: 6)
linkedList.printLinkedList()

linkedList.deleteFirst()
linkedList.printLinkedList()

linkedList.deleteLast()
linkedList.printLinkedList()



















//: [Next](@next)
