import UIKit

var greeting = "Hello, Graphs"
/*
 Node = Vertex
 Connectionees btwn nodex = Edge
 Bidirectional edges
 Directed graphs aka digraphs
 
 
 */

public protocol Edge: CustomStringConvertible{
    var u: Int { get set} //index of the "from" vertex
    var v: Int {get set} //Index of the "to" vertex
    var reversed: Edge {get} //reversed edge
}


protocol Graph: class, CustomStringConvertible{
    associatedtype VertexType: Equatable
    associatedtype EdgeType: Edge
    var verticies: [VertexType] {get set}
    var edges: [[EdgeType]] {get set}
}


extension Graph{
    //How many verticies are in the graph
    public var vertexCount: Int{return verticies.count}
    
    //How many edges
    public var edgesCount: Int{return edges.joined().count}
    
    //Get vertex by its index
    public func vertexAtIndex(_ index: Int) -> VertexType{
        return verticies[index]
    }
    
    //find first occurance of vertex if it exists
    public func indexOfVertex(_ vertex: VertexType) -> Int?{
        if let i = verticies.firstIndex(of: vertex){
            return i
        }
        return nil
    }
    
    //find all the neighber of vertex at given index
    public func neighbersForVertex(_ vertex: VertexType) -> [VertexType]?{
        if let i = indexOfVertex(vertex){
            return neighbersForIndex(i)
        }
        return nil
    }
    
    
    //find all the edges of a vertex at given index
    public func edgesForIndex(_ index: Int) -> [EdgeType]{
        return edges[index]
    }
    
    //find all edges of a given vertex
    public func edgesForVertex(_ vertex: VertexType) -> [EdgeType]?{
        if let i = indexOfVertex(vertex){
            return edgesForIndex(i)
        }
            return nil
    }
    
    
    //add a vertex to a graph
    public func addVertex(_ v: VertexType) -> Int{
        verticies.append(v)
        edges.append([EdgeType]())
        return verticies.count - 1
    }
    
    
    //add an edge to the graph
    public func addEdge(_ e: EdgeType) {
        edges[e.u].append(e)
        edges[e.v].append(e.reversed as! EdgeType)
        
    }
    
    
}




//PlayGround PlayGround
var tempInt = [[1,2,4,5],[1,4,4,4],[4,4,4,4],[4,3,3,45,4]]
tempInt.joined().count















































