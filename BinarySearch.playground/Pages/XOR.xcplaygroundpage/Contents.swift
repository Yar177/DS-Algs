//: [Previous](@previous)

import Foundation

typealias OTPKey = [UInt8]
typealias OTPKeyPair = (key1: OTPKey, key2: OTPKey)

func randomOTPKey(_ length: Int) -> OTPKey {
    var randomKey: OTPKey = OTPKey()
    for _ in 0..<length {
        let randomKeyPoint = UInt8(arc4random_uniform(UInt32(UInt8.max)))
        randomKey.append(randomKeyPoint)
    }
    return randomKey
}


print(randomOTPKey(88))

//: [Next](@next)
