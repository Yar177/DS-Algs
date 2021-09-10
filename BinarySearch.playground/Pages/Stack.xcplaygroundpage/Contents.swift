//: [Previous](@previous)

import Foundation

struct Stack<Element>{
    private var storage: [Element] = []
    init() {}
    
}


extension Stack: CustomStringConvertible{
    var description: String{
        let topDivider = "--------Top--------"
        let bottomDivider = "--------End--------"
        let stackElements = storage.map{"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}
















//: [Next](@next)
