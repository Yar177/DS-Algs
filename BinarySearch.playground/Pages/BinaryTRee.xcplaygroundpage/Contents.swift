//: [Previous](@previous)

import Foundation
import UIKit



//       10
//      /  \
//     5    14
//    /    /  \
//   1    11   20


class Node{
    let value: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

let oneNode = Node(value: 11, leftChild: nil, rightChild: nil)

let fiveNode = Node(value: 5, leftChild: oneNode, rightChild: nil)

let twentyNode = Node(value: 20, leftChild: nil, rightChild: nil)
let elevenNode = Node(value: 11, leftChild: nil, rightChild: nil)
let forteen = Node(value: 14, leftChild: elevenNode, rightChild: twentyNode)

let tenRootNode = Node(value: 10, leftChild: fiveNode, rightChild: forteen)





func searchBinaryTree(node: Node?, searchValue: Int) -> Bool{
    if node == nil{
        return false
    }
    if node?.value == searchValue{
        return true
    }else if searchValue < node!.value{
        return searchBinaryTree(node: node?.leftChild, searchValue: searchValue)
    }else{
        return searchBinaryTree(node: node?.rightChild, searchValue: searchValue)
    }
}

searchBinaryTree(node: tenRootNode, searchValue: 14)
tenRootNode.leftChild?.value

let list = [1, 5, 10, 11, 14, 20]
let index = list.firstIndex(where: {$0 == 11})



//: [Next](@next)
