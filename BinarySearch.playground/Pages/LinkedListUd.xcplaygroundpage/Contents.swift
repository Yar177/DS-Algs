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
        var currentNode = head
        var previousNode: Node?
        for _ in 0..<position{
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        previousNode?.next = currentNode?.next
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func clear() {
        head = nil
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


linkedList.delete(at: 2)
linkedList.printLinkedList()

linkedList.isEmpty
linkedList.clear()
linkedList.isEmpty
linkedList.printLinkedList()

//===================================-------------------===========================//

struct LinkedList<Value>{
    var head: LLNode<Value>?
    var tail: LLNode<Value>?
    var isEmpty:Bool{
        return head == nil
    }
    
//    init(){}

    mutating func push(_ value: Value){
        head = LLNode(value: value, next: head)
        if tail == nil{
            tail = head
        }
    }
    
    mutating func append(_ value: Value){
        guard !isEmpty else {
            push(value)
            return
        }
        let node = LLNode(value: value)
        tail?.next = node
        tail = node
    }
    
    mutating func node(at index:Int) -> LLNode<Value>?{
        var curreentIndex = 0
        var currentNode = head
        while currentNode != nil && curreentIndex < index {
            currentNode = currentNode?.next
            curreentIndex += 1
        }
        return currentNode
    }

    mutating func inseret(_ value: Value, after node: LLNode<Value>?){
        node?.next = LLNode(value: value, next: node?.next)
    }
    
    mutating func pop() -> Value?{
        defer {
            head = head?.next
            if isEmpty{
                tail = nil
            }
        }
        return head?.value
    }
    
    mutating func removeLast() -> Value?{
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        while current.next != nil{
            prev = current
            current = current.next!
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    mutating func removeAfter(after node: LLNode<Value>) -> Value?{
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList:CustomStringConvertible{
    var description: String{
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

var list = LinkedList<Int>()
list.append(9)
list.push(2)
list.push(3)
list.append(12)
list.push(22)
list.append(10)
print(list)

let midNode = list.node(at: 1)
list.inseret(55, after: midNode)
print(list)

list.pop()
print(list)

list.removeLast()
list.removeAfter(after: list.node(at: 3)!)
print(list)

class LLNode<Value>{
    var value: Value
    var next: LLNode?
    
    init(value: Value, next: LLNode? = nil) {
        self.value = value
        self.next  = next
    }
}

extension LLNode: CustomStringConvertible{
    var description: String{
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

let nodeLL1 = LLNode(value: 1)
let nodeLL2 = LLNode(value: 2)
let nodeLL3 = LLNode(value: 3)

nodeLL1.next = nodeLL2
nodeLL2.next = nodeLL3

print(nodeLL1)








//: [Next](@next)
