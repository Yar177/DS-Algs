//: [Previous](@previous)

import Foundation


struct NameStruct{
    var firstName: String
    var lastName: String
}

var joe = NameStruct(firstName: "Joe", lastName: "Doe")
var patrick = joe

print("\(joe), \(patrick)")

patrick.firstName = "Pat"
patrick.lastName = "Hamo"

print("\(joe), \(patrick)")



class NameClass: NSCopying{
    
    func copy(with zone: NSZone? = nil) -> Any {
        return NameClass(firstName: self.firstName, lastName: self.lastName)
    }
    
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension NameClass: CustomStringConvertible{
    var description: String {
        return "NameClass(firstName: \(firstName), lastName: \(lastName)"
    }
}

var joeClass = NameClass(firstName: "Joe", lastName: "Doe")
var patrickClass = joeClass.copy() as! NameClass

print("\(joeClass), \(patrickClass)")

patrickClass.firstName = "Pat"
patrickClass.lastName = "Hamo"

print("\(joeClass), \(patrickClass)")



//: [Next](@next)
