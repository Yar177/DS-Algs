//: [Previous](@previous)

import Foundation
import CoreGraphics

protocol Serializable{
    func serialize()
}

class JSONSerializer: Serializable{
    func serialize(){
        print("JSONSerializer \(#function)")
    }
}

class ListSerializer: Serializable{
    func serialize(){
        print("ListSerializer \(#function)")
    }
}

class XMLSerializer: Serializable{
    func serialize(){
        print("XMLSerializer \(#function)")
    }
}


enum Searilizars{
    case json
    case list
    case xml
}

func makeSerializer(_ type: Searilizars) -> Serializable? {
 let result: Serializable?
    switch type{
    case .json: result = JSONSerializer()
    case .list: result = ListSerializer()
    case .xml: result = XMLSerializer()
    }
    return result
}


let jsonSerilizer = makeImage(self: .json)


//: [Next](@next)
