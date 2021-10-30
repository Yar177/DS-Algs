//: [Previous](@previous)

import Foundation


typealias combineIntAndString = (String, Int) -> String

func strigify(val1: String, val2: Int) -> String{
    return val1 + " \(val2)"
}
var aFunc = strigify
func wtf(_ val1: Int, _ val2: combineIntAndString) -> String{
    return "\(val1) \(val2("2", 2))"
}
print(wtf(2, aFunc))



var namesArray = ["Bear", "Kyle", "Jenna", "Andrew", "Adam" , "Bety", "Willi"]
var intss = [12, 2, 4,1,6,7,2,1,7,9,3,2]

namesArray.sort(by: > )
print(intss.sorted(by: >))
print(namesArray)


intss.sorted

let sortedInts = intss.sorted()

intss.forEach { (intVal) in
  //      print(intVal)
}

intss.enumerated().forEach { (tup) in
    let (index, value) = tup
  //  print("\(index) \(value)")
}

let mappedNamesArray = namesArray.map { val1 -> Int in
    val1.count
}

print(mappedNamesArray)

let filteredNameArray = namesArray.filter { nameString -> Bool in
    nameString.count > 4
}

print(filteredNameArray)

































//: [Next](@next)
