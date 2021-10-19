//: [Previous](@previous)

import Foundation


func binaryString(_ n : Int) -> [String]{
    var res = ["0" , "1"]
    for _ in 2...n{
        var newRes:[String] = []
        for s in res{
            newRes.append(s + "0")
            newRes.append(s + "1")
        }
        res += newRes
    }
    return res
}

func binaryStrings(_ slate: inout String, _ n: Int){
    if n == 0{
        print(slate)
    }else{
        var slate1 = slate + "1"
        var slate0 = slate + "0"
        binaryStrings(&slate0, n - 1)
        binaryStrings(&slate1, n - 1)
    }
}


func decimalStrings(_ slate: inout String, _ n: Int){
    if n == 0{
        print(slate)
    }else{
        for i in 0...9{
        var slate1 = slate + "\(i)"
            decimalStrings(&slate1, n - 1)
        }
    }
}

//print(binaryString(4))
var str = ""
//binaryStrings(&str, 4)
decimalStrings(&str, 2)








































//: [Next](@next)
