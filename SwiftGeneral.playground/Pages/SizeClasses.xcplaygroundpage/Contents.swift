//: [Previous](@previous)

import UIKit
import Foundation



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

print("print")

class ViewControllerTest: UIViewController{
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let widithSizeClass = traitCollection.horizontalSizeClass
        let heightSizeClass = traitCollection.verticalSizeClass
        print("w: \(widithSizeClass) - h:\(heightSizeClass)")
//        self.printSize("w: \(widithSizeClass) - h:\(heightSizeClass)")
        self.screenSize(sizeClass: widithSizeClass)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.horizontalSizeClass == .compact {
            // load slim view
        } else {
            // load wide view
        }
    }
    
    func printSize(_ printString: String){
        print("\(printString)")
    }
   
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
}

let vc = ViewControllerTest()
vc.viewWillLayoutSubviews()



























//: [Next](@next)
