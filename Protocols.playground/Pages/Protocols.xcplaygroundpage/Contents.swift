import UIKit

protocol Taggable {
    var tag : String{get set}
    var data: Data{get}
    static var counter: Int{get}
    
    mutating func update(data: Data) -> Bool
    static func incrementCounter()
    
    init(tag: String, data: Data)
}


struct TaggedDate: Taggable{
    var tag: String
    
    var data: Data
    
    static var counter: Int = 0
    
    mutating func update(data: Data) -> Bool {
        self.data = data
        return true
    }
    
    static func incrementCounter() {
        counter += 1
    }
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

protocol TaggableInheratance {
    var tag : String{get set}
    var data: Data{get}
    init(tag: String, data: Data)
}

protocol TaggedPresistable: TaggableInheratance, CustomStringConvertible, Equatable{
    init(tag: String, contentOf url: URL) throws
    func presist(to url: URL) throws
}


protocol TaggedEncodable: TaggableInheratance{
    var base64: String {get}
}


//Protocol Composition
struct MyData: TaggedEncodable, TaggedPresistable{
    var base64: String {
        return self.data.base64EncodedString()
    }
    
    init(tag: String, contentOf url: URL) throws {
        let data = try Data.init(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    func presist(to url: URL) throws {
        try self.data.write(to: url)
    }
    
    var tag: String
    
    var data: Data
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    var description: String{
        return "MyData(\(tag)"
    }
}


