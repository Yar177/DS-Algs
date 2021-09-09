//: [Previous](@previous)

import Foundation

/*
 _  _         _      _____     _    _
| || |__ _ __| |_   |_   _|_ _| |__| |___ ___
| __ / _` (_-< ' \    | |/ _` | '_ \ / -_|_-<
|_||_\__,_/__/_||_|   |_|\__,_|_.__/_\___/__/

 */

// Strings, Integers, Floating point numbers and Booleans
// are all hashable by default.
let stringsAreHashable = "abc".hashValue

struct GridPoint {
    var x: Int
    var y: Int
    
    var hashValue: Int {
        // XOR properties together seeded with a prime number
        return x.hashValue ^ y.hashValue &* 16777619
    }
}

let mainBase = GridPoint(x: 131, y: 541)
let hashCode = mainBase.hashValue

// Modulus operator
let even = 2 % 2
let odd = 3 % 2 // remainder 1

let initialSize = 16
let index = hashCode % initialSize // guaranteed fit

let indexPositive = abs(index)


// Linked List
class HashEntry {
    var key: String
    var value: String
    var next: HashEntry?
    
    init(_ key: String, _ value: String) {
        self.key = key
        self.value = value
    }
}

class HashTable {
    private static let initialSize = 256
    private var entries = Array<HashEntry?>(repeating: nil, count: initialSize)
    func put(_ key: String, _ value: String){
        let index = getindex(key)
        
    }
    
}

let hashTable = HashTable()
hashTable.put("John Smith", "521-1234")
hashTable.put("Lisa Smith", "521-8976")
hashTable.put("Sam Doe", "521-5030")
hashTable.put("Sandra Dee", "521-9655")
hashTable.put("Ted Baker", "418-4165")

hashTable.prettyPrint()

hashTable.get("John Smith")
hashTable.get("Lisa Smith")
hashTable.get("Sam Doe")
hashTable.get("Sandra Dee")
hashTable.get("Ted Baker")
hashTable.get("Tim Lee")

hashTable["Kevin Flynn"] = "The grid"
hashTable["Kevin Flynn"]


//: [Next](@next)
