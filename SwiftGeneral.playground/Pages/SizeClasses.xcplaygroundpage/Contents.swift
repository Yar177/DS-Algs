//: [Previous](@previous)

import UIKit
import Foundation



let widithSizeClass = traitCollection.horizontalSizeClass
let heightSizeClass = traitCollection.verticalSizeClass
print("w: \(widithSizeClass) - h:\(heightSizeClass)")
//print("w: \(sizeClassString(sizeClass: widithSizeClass)) - h:\(sizeClassString(sizeClass: heightSizeClass))")


func screenSize(sizeClass: UIUserInterfaceSizeClass) -> String{
    switch sizeClass{
    case .unspecified:
        return "unspecified"
    case .compact:
        return "compact"
    case .regular:
        return "regular"
    }
}
































//: [Next](@next)
