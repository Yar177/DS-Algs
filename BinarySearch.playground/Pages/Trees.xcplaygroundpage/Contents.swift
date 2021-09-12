//: [Previous](@previous)

import Foundation

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

let tee = TreeNode<String>("Tea")
let coffee = TreeNode<String>("Coffee")

hot.add(tea)
hot.add(coffee)

let soda = TreeNode<String>("Soda")
let milk = TreeNode<String>("Milk")

cold.add(soda)
cold.add(milk)

beverages.add(hot)
beverages.add(cold)

print(beverages.children[0].value)

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








//: [Next](@next)
