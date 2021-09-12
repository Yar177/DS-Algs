//: [Previous](@previous)

import Foundation

struct Stack<Element>{
    private var storage: [Element] = []
    init() {}
    
    mutating func push(_ element: Element){
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
}


extension Stack: CustomStringConvertible{
    var description: String{
        let topDivider = "----Top----\n"
        let bottomDivider = "\n----End----"
        let stackElements = storage.map{"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

var stack = Stack<Int>()

stack.push(20)
stack.push(1)
stack.push(12)
stack.push(230)
stack.push(4)
stack.push(3)
print(stack)

stack.pop()
print(stack)















//: [Next](@next)
