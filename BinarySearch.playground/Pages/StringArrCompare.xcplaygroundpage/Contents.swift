//: [Previous](@previous)

import UIKit
import Foundation

var correctlyAnsweredQuestion =  Array(repeating: false, count: 10)
correctlyAnsweredQuestion.count
correctlyAnsweredQuestion[3] = true
print(correctlyAnsweredQuestion)




func removeSpecialCharsFromString(text: String) -> String {
    let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
    return text.filter {okayChars.contains($0) }
}


var str = "this, is a long (string). that, has"

var neStr = removeSpecialCharsFromString(text: str)

str.replacingOccurrences(of: "this", with: "")
print(neStr)


let s1 = "House and senate"
let s2 = "the Senate and House (of Representatives)"

s1.compare(s2, options: .anchored)

s1.sorted().allSatisfy(s2.contains )

s1.sorted() == s2.sorted()


//: [Next](@next)
