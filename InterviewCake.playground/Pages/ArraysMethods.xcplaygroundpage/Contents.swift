//: [Previous](@previous)

import Foundation

var phrase = "The rain in Spain stays mainly in the plain."

let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
phrase.removeAll(where: { vowels.contains($0) })

print(phrase)

phrase.allPrefixes2
phrase.allPrefixes1





extension String{
    var allPrefixes1: [Substring]{
        return (0...count).map(prefix)
    }
    
    var allPrefixes2: [Substring]{
        return [""] + indices.map{index in self[...index]}
    }
}






































//: [Next](@next)
