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
    return newStr
}


nextChar("cool")
let cc = "cool"



func cipher(_ str: String, rotatingFactor: Int = 1) -> String{
    var newStr = ""
    for c in str{
        if let orgChar = c.unicodeScalars.first {
            let nextUnicode = orgChar.value + UInt32(rotatingFactor)
            if let newChar = UnicodeScalar(nextUnicode){
                newStr.append(Character(UnicodeScalar(newChar)))
            }
        }
    }
    return newStr
}

extension String{
var stripped: String {
       let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
       return self.filter {okayChars.contains($0) }
   }
}


//: [Next](@next)
