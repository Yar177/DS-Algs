//: [Previous](@previous)

import Foundation
import UIKit

enum SocialPlatform: String, CaseIterable{
    case twitter = "twitter"
    case facebook = "facebook"
    case inst = "inst"
    case linkedIn = "linkedIn"
}


func shareImage(on platform: SocialPlatform){
    switch platform{
    case .twitter:
        print("twitter")
    case .facebook:
        print("facebook")
    case .inst:
        print("inst")
    case .linkedIn:
        print("linkedIn")
    }
}
//shareImage(on: .inst)

for platform in SocialPlatform.allCases{
    print(platform.rawValue)
}

enum SociaMedialPlatform{
    case twitter(followers: Int)
    case youtube(subscibers: Int)
    case inst
    case linkedIn
}

func getSponserElig(for platform: SociaMedialPlatform){
    switch platform {
    case .twitter(let followers) where followers > 10_000:
        print("eligebale")
    case .youtube, .inst, .linkedIn, .twitter:
        print("not eligable")
    }
}

getSponserElig(for: .twitter(followers: 1100))


enum Planet: Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet{
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)
let earth = Planet.earth





//: [Next](@next)
