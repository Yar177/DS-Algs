//: [Previous](@previous)

import Foundation

var phrase = "The rain in Spain stays mainly in the plain."

let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
phrase.removeAll(where: { vowels.contains($0) })

print(phrase)





































//: [Next](@next)
