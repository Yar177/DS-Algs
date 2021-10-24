//: [Previous](@previous)

import Foundation


//biderectional edges can travel in both directions vs diagraph
public protocol Edge: CustomStringConvertible{
    var u: Int {get set} //index of the from vertex
    var v: Int {get set} //index of the to vertex
    
    var reversed: Edge {get}
}


protocol Graph: class, CustomStringConvertible{
    associatedtype VertexType: Equatable
    associatedtype EdgeType: Edge
    
    var verticies: [VertexType] { get set}
    var edges: [[EdgeType]] {get set}
}

extension Graph{
    
}
























































//vertex matrix of adjency list

















































































//: [Next](@next)
