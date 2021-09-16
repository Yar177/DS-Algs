//: [Previous](@previous)

import Foundation

struct Queue<Element>{
    var elements:[Element] = []
    mutating func enqueue(_ value: Element) -> Bool{
         elements.append(value)
        return true
    }
    
    var isEmpty:Bool{
        return elements.isEmpty
    }
    mutating func dequeue() -> Element?{
        return isEmpty ? nil : elements.removeFirst()
    }
    
}

var q = Queue<Int>()
q.enqueue(3)
q.enqueue(33)
q.enqueue(2)
print(q)


class TreeNode<T>{
    var value: T
    var children: [TreeNode] = []
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode){
        self.children.append(child)
    }
}



let beverages = TreeNode<String>("Beverages")

let hot = TreeNode<String>("Hot")
let cold = TreeNode<String>("Cold")

let tea = TreeNode<String>("Tea")
let coffee = TreeNode<String>("Coffee")

hot.add(tea)
hot.add(coffee)

let soda = TreeNode<String>("Soda")
let milk = TreeNode<String>("Milk")

cold.add(soda)
cold.add(milk)

beverages.add(hot)
beverages.add(cold)

//print(beverages.children[0].value)

//Depth First Traversal
extension TreeNode{
    func depthFirst(_ visit: (TreeNode) -> Void){
        visit(self)
        children.forEach{
            $0.depthFirst(visit)
        }
    }
}

beverages.depthFirst{
    print($0.value)
}

beverages.lelveOrder{
    print($0.value)
}

//LevelOrder Traversal
extension TreeNode{
    func lelveOrder(_ visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach{
            queue.enqueue($0)
        }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach{
                queue.enqueue($0)
            }
        }
    }
}

extension TreeNode where T: Equatable{
    func search(_ value: T) -> TreeNode?{
        var result: TreeNode?
        lelveOrder{ node in
            if node.value == value{
            result = node
            }
        }
        return result
    }
}

if let sRes = beverages.search("Soda"){
    print(sRes.value)
}



class BinaryTreeNode<Element>{
    var value: Element
    var leftChild: BinaryTreeNode?
    var righChild: BinaryTreeNode?
    init(_ value: Element) {
        self.value = value
    }
}

let ten = BinaryTreeNode(10)
let nine = BinaryTreeNode(9)
let two = BinaryTreeNode(2)
let one = BinaryTreeNode(1)
let three = BinaryTreeNode(3)
let four = BinaryTreeNode(4)
let six = BinaryTreeNode(6)
let five = BinaryTreeNode(5)

ten.leftChild = nine
ten.righChild = two
nine.leftChild = one
nine.righChild = three
two.leftChild = four
two.righChild  = six

extension BinaryTreeNode{
    func traverseInOrder(visit: (Element) -> Void){
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        righChild?.traverseInOrder(visit: visit)
    }
}

ten.traverseInOrder{
    print($0)
}

let blackListPat = "[\\'/\" `]"

func checkForCharacters(_ string: String, _ characterSet: String) -> Bool {
    let invalidCharacters = CharacterSet(charactersIn: characterSet)
    if string.rangeOfCharacter(from: invalidCharacters) != nil {
        return true
    } else {
    return false
    }
}

let thisType = "string".rangeOfCharacter(from: CharacterSet(charactersIn: "is"))
print(type(of: thisType))

checkForCharacters("testing/1", blackListPat)

extension String{
    func containsCharacters(_ characterSet: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: characterSet)
        if self.rangeOfCharacter(from: invalidCharacters) != nil {
            return true
        } else {
        return false
        }
    }
}

"testing1".containsCharacters(blackListPat)


//: [Next](@next)
