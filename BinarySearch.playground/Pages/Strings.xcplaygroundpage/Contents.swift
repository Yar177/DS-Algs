//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

func nextChar(_ str:String, _ rotatingFactor:UInt32 = 1) -> String{
    var newStr = ""
    for c in str{
        if let firstChar = c.unicodeScalars.first {
        let nextUnicode = firstChar.value + rotatingFactor
        if let var4 = UnicodeScalar(nextUnicode) {
            newStr.append(Character(UnicodeScalar(var4)))
        }
    }
    }
//    if let firstChar = str.unicodeScalars.first {
//        let nextUnicode = firstChar.value + rotatingFactor
//        print(type(of: firstChar.value))
//        if let var4 = UnicodeScalar(nextUnicode) {
//            var nextString = ""
//            nextString.append(Character(UnicodeScalar(var4)))
//            print(nextString)
//        }
//    }
    
    return newStr
}


nextChar("cool")




//: [Next](@next)
