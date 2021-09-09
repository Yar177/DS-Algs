//: [Previous](@previous)

import Foundation

class Stack<T>{
    private var array:[T] = []
    func push(_ item: T){
        array.append(item)
    }
    func pop() -> T?{
        array.popLast()
    }
    func peek() -> T?{
        array.last
    }
    var isEmpty: Bool{
        array.isEmpty
    }
    var count: Int{
        array.count
    }
    
}


struct StackStruct<T>{
    fileprivate var array:[T] = []
    mutating func push(_ item: T){
        array.append(item)
    }
    mutating func pop() -> T?{
        array.popLast()
    }
    var peek: T?{
        array.last
    }
    var isEmpty: Bool{
        array.isEmpty
    }
    var count: Int{
        array.count
    }
}



class Queue<T>{
    private var array: [T] = []
    
    func enqueue(_ item: T){
        array.append(item)
    }
    
    func dequeue() -> T?{
        if isEmpty {
            return nil
        }else{
            return array.removeFirst()
        }
    }
    
    var isEmpty: Bool{
        return array.isEmpty
    }
    
    var count: Int{
        return array.count
    }
    
    
    func peek() -> T?{
        return array.first
    }
}


/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 
 Shoot for correctness. Not performance.
 */

func solutionQueueRight(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }

    var result = A

    // treat like a queue enqueuing and dequeuing off the end
    for _ in 1...K {
        let last = result.last!
        result.insert(last, at: 0)
        result.remove(at: A.count)
    }

    return result
}

solutionQueueRight(A: [1, 2, 3, 4, 5], K: 1) // [5, 1, 2, 3, 4]
solutionQueueRight(A: [1, 2, 3, 4, 5], K: 2) // [4, 5, 1, 2, 3]
solutionQueueRight(A: [1, 2, 3, 4, 5], K: 3) // [3, 4, 5, 1, 2]

solutionQueueRight(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]








/*
 Rotate array to left N times.
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [8, 9, 7, 6, 3]
     [8, 9, 7, 6, 3] -> [9, 7, 6, 3, 8]
     [9, 7, 6, 3, 8] -> [7, 6, 3, 8, 9]

 Shoot for correctness. Not performance.
 */

func solutionQueueLeft(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    
    // treat like a queue enqueuing and dequeuing off the end
    for _ in 1...K {
        // Do your work here...
    }
    
    return result
}

solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 1) // [2, 3, 4, 5, 1]
solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 2) // [3, 4, 5, 1, 2]
solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 3) // [4, 5, 1, 2, 3]

solutionQueueLeft(A: [3, 8, 9, 7, 6], K: 3) // [7, 6, 3, 8, 9]






//: [Next](@next)
