//: [Previous](@previous)

import Foundation

var optionalNum:Int?

//optionalNum = 22

//MARK: if let
if let num = optionalNum{
    print("I have a value of \(num)")
}else{
    print("I don't have a value")
}

//MARK: guard
func guardUnrwap(number:Int?){
    guard let number = number else {
        print("Exiting func")
        return
    }
    
    print("I have a value of \(number)")
}
guardUnrwap(number: optionalNum)

//MARK: force unwraping


//: [Next](@next)
