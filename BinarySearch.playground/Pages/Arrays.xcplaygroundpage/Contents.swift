//: [Previous](@previous)

import Foundation

var greeting = "Hello, Arrays"
print(greeting)

func shiftByK(arrayOfInt: [Int], k: Int) -> [Int]{
    var temp: [Int:Int] = [:]
    var newArray:[Int] = arrayOfInt
    for i in 0..<arrayOfInt.count{
        temp[arrayOfInt[i]] = (i + k) % arrayOfInt.count
    }
    print("this is temp: \(temp)")

    for element in temp{
        newArray[element.value] =  element.key
    }
    print("this is arrayOfInt: \(arrayOfInt)")
    print("this is newArray: \(newArray)")
    return []
}


func shiftArrayByK(arrayOfInt: [Int], k: Int) -> [Int]{
    if arrayOfInt.isEmpty{return []}
    var newArray:[Int] = arrayOfInt
    for i in 0..<arrayOfInt.count{
        newArray[(i + k) % arrayOfInt.count] = arrayOfInt[i]
    }
    print("this is arrayOfInt: \(arrayOfInt)")
    print("this is newArray: \(newArray)")
    return []
}

shiftArrayByK(arrayOfInt: [2,3,6,7,1], k: 3)
shiftByK(arrayOfInt: [2,3,6,7,1], k: 3)

//==================================================================================

func solution(_ A:[Int], _ K: Int) -> [Int]{
    guard !A.isEmpty else {
        return []
    }
    guard K > 0 else {
        return A
    }
    
    var result = A
    for _ in 1...K{
        result = rotateRightOnce(A: result)
    }
    return result
}

func rotateRightOnce(A: [Int]) -> [Int]{
    var newArray = Array<Int>(repeating: 0, count: A.count)
    for i in 0..<A.count - 1 {
        newArray[i + 1] = A[i]
    }
    newArray[0] = A.last!
    return newArray
}

solution([2,3,6,7,1], 3)





//=========================================
//My soulution


func formatString(_ s: String) -> String{
    var cleanString = cleanString(s)
    var count = 3
    while count < cleanString.count{
        cleanString.insert("-", at: cleanString.index(cleanString.startIndex, offsetBy: count))
        count += 4
    }
    return cleanString
}

func cleanString(_ startSting: String) -> String{
    let acceptedChars = Set("0123456789")
    return startSting.filter { acceptedChars.contains($0)}
}

formatString("9dids09vds0 0 s0d0=ljkdsa8848jdfs3id8- ;aedk30scv21=fvds p")
formatString("0099")


//========
//Their solution

func solutionQ2(_ S: String) -> String{
    let noSpace = S.replacingOccurrences(of: " ", with: "")
    let noDashesNoSpace = noSpace.replacingOccurrences(of: "-", with: "")
    
    var res = ""
    var count = -2
    for c in noDashesNoSpace{
        res.append(c)
        if count % 3 == 0{
            res.append("-")
        }
        count += 1
    }
    return res
}

solutionQ2("909 03309 09323-3-33 0033---   99")
solutionQ2("009")


//=================================================================================================
//My soulution


let A = ["pim" , "pom"]
let B = ["9999999999", "777888999"]
let C = "88999"

func findContact(_ contactList:[String], _ phoneNums:[String], _ searchTerm: String) -> String{
    let contact = "No Contact Found"
    for i in 0...phoneNums.count{
        if phoneNums[i].contains(searchTerm) {
            return contactList[i]
        }
    }
    return contact
}

func findContactFilter(_ contactList:[String], _ phoneNums:[String], _ searchTerm: String) -> String{
    let filteredArray = phoneNums.filter{$0.contains(searchTerm)}
    for element in filteredArray{
        return contactList[phoneNums.firstIndex(of: element)!]
    }
    let contact = filteredArray.isEmpty ? "No Contact Found" : filteredArray.first
    return  contact!
}

findContactFilter(A, B, C)
findContact(A, B, C)



//==============
//Their soulution
















//: [Next](@next)
