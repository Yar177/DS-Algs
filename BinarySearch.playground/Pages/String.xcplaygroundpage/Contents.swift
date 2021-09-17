//: [Previous](@previous)

import Foundation


var str = "abssscded"
str.count

for (n, c) in "Swift".enumerated() {
    print("\(n): '\(c)'")
}


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
       for (i, c) in s.enumerated() {
            print("\(i): '\(c)'")
           var count = 0
           for cr in (i+1)...s.count{
               print(count += 1)

           }
        }
        
        return maxLength
    }
}
    
//for i in 0...5{
//   // print(str[i])
//}
//: [Next](@next)
