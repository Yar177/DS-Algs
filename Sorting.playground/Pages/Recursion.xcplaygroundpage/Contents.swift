//: [Previous](@previous)

import Foundation


func binaryString(_ n : Int) -> [String]{
    var res = ["0" , "1"]
    for i in 2..<n{
        var newRes:[String] = []
        for s in res{
            newRes.append(s + "0")
            newRes.append(s + "1")
        }
        res += newRes
    }
    return res
}



binaryString(4)








































//: [Next](@next)
